import java.io.*;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * MatlabController – Java side of the persistent Java ↔ MATLAB IPC demo.
 *
 * Lifecycle:
 * 1. Check system\heartbeat.txt – if missing or stale (>10 s), launch MATLAB.
 * 2. Wait for MATLAB daemon to become ready (heartbeat fresh).
 * 3. For each of N_REQUESTS iterations:
 * a. Generate 1024 random bits.
 * b. Write input\data_<timestamp>.txt.
 * c. Wait for output\result_<timestamp>.txt.
 * d. Parse and print decoded value + timing.
 */
public class MatlabController {

    // ── Paths (resolved at runtime from the working directory) ────────────────
    // run.bat does: cd /d "%~dp0" before launching java, so user.dir is always
    // the folder that contains the .class file and matlab_daemon.m – portable
    // to any machine regardless of where the project is placed.
    private static final String BASE_DIR = System.getProperty("user.dir");
    private static final String INPUT_DIR = BASE_DIR + File.separator + "input";
    private static final String OUTPUT_DIR = BASE_DIR + File.separator + "output";
    private static final String SYSTEM_DIR = BASE_DIR + File.separator + "system";
    private static final String HEARTBEAT = SYSTEM_DIR + File.separator + "heartbeat.txt";
    private static final String MATLAB_SCRIPT = BASE_DIR + File.separator + "matlab_daemon.m";

    // ── Tunables ──────────────────────────────────────────────────────────────
    private static final int N_REQUESTS = 3;
    private static final int BITS = 1024;
    private static final long HEARTBEAT_MAX_AGE_MS = 10_000L; // 10 s
    private static final long MATLAB_START_TIMEOUT = 120_000L; // 120 s
    private static final long RESULT_TIMEOUT = 60_000L; // 60 s
    // WatchService watches OUTPUT_DIR for file-creation events (no polling needed)
    private static WatchService watcher;

    // ── Helpers ───────────────────────────────────────────────────────────────
    private static final SimpleDateFormat TS_FMT = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
    private static final Random RAND = new Random();

    // ─────────────────────────────────────────────────────────────────────────
    public static void main(String[] args) throws Exception {

        log("Java - MATLAB IPC Demo - starting");
        log("Base directory : " + BASE_DIR);
        log("Requests       : " + N_REQUESTS);
        log("Bits per request: " + BITS);
        System.out.println();

        ensureDirectories();

        // Register WatchService BEFORE launching MATLAB so no event is ever missed.
        watcher = FileSystems.getDefault().newWatchService();
        Paths.get(OUTPUT_DIR).register(watcher, StandardWatchEventKinds.ENTRY_CREATE);
        log("[WATCH]  OS file-watch registered on: " + OUTPUT_DIR);

        ensureMatlabRunning();

        for (int i = 1; i <= N_REQUESTS; i++) {
            System.out.println("─".repeat(60));
            log("Request " + i + " of " + N_REQUESTS);
            processRequest(i);
        }

        System.out.println("─".repeat(60));
        log("All requests complete. MATLAB engine continues running.");
    }

    // ── Ensure the three IPC directories exist ────────────────────────────────
    private static void ensureDirectories() throws IOException {
        for (String dir : new String[] { INPUT_DIR, OUTPUT_DIR, SYSTEM_DIR }) {
            Files.createDirectories(Paths.get(dir));
        }
    }

    // ── Heartbeat check / MATLAB launch ───────────────────────────────────────
    private static void ensureMatlabRunning() throws Exception {

        if (isHeartbeatFresh()) {
            log("[MATLAB] Heartbeat is fresh - reusing running MATLAB instance.");
            return;
        }

        log("[MATLAB] No fresh heartbeat detected - launching MATLAB engine...");
        log("[MATLAB] Command: matlab -nosplash -nodesktop -r \"run('" + MATLAB_SCRIPT + "')\"");

        // Launch MATLAB in a new console window (detached) so it outlives Java.
        ProcessBuilder pb = new ProcessBuilder(
                "cmd", "/c", "start", "MATLAB Engine",
                "matlab", "-nosplash", "-nodesktop",
                // Use forward slashes: MATLAB's run() accepts them on Windows
                // and rejects double-backslash (\\) escaped paths.
                "-r", "run('" + MATLAB_SCRIPT.replace("\\", "/") + "')");
        pb.redirectErrorStream(true);
        pb.start(); // fire-and-forget

        log("[MATLAB] Waiting for MATLAB to write its first heartbeat (up to "
                + (MATLAB_START_TIMEOUT / 1000) + " s)...");

        long deadline = System.currentTimeMillis() + MATLAB_START_TIMEOUT;
        while (System.currentTimeMillis() < deadline) {
            if (isHeartbeatFresh()) {
                log("[MATLAB] Heartbeat received - MATLAB engine is ready.");
                return;
            }
            Thread.sleep(500);
        }

        throw new RuntimeException(
                "MATLAB did not produce a heartbeat within " +
                        (MATLAB_START_TIMEOUT / 1000) + " seconds. Aborting.");
    }

    // Is heartbeat.txt present AND written within the last HEARTBEAT_MAX_AGE_MS?
    private static boolean isHeartbeatFresh() {
        File f = new File(HEARTBEAT);
        if (!f.exists())
            return false;
        try {
            String content = new String(Files.readAllBytes(f.toPath())).trim();
            long matlabEpochSec = Long.parseLong(content);
            long nowSec = System.currentTimeMillis() / 1000L;
            return (nowSec - matlabEpochSec) * 1000L <= HEARTBEAT_MAX_AGE_MS;
        } catch (Exception e) {
            return false;
        }
    }

    // ── One complete request / response cycle ─────────────────────────────────
    private static void processRequest(int reqNum) throws Exception {

        // 1. Generate random bits
        StringBuilder sb = new StringBuilder(BITS);
        for (int i = 0; i < BITS; i++)
            sb.append(RAND.nextInt(2));
        String binaryData = sb.toString();

        // 2. Write input file
        String timestamp = TS_FMT.format(new Date());
        String inputFile = INPUT_DIR + File.separator + "data_" + timestamp + ".txt";
        String outputFile = OUTPUT_DIR + File.separator + "result_" + timestamp + ".txt";
        String expectedFilename = "result_" + timestamp + ".txt";
        File out = new File(outputFile);

        Files.write(Paths.get(inputFile), binaryData.getBytes());
        long startTime = System.currentTimeMillis();
        log("[REQUEST] Wrote input file : " + Paths.get(inputFile).getFileName());

        // 3. Wait for the result file.
        //
        // Design: WatchService = wake-up signal ONLY.
        // "found" is set EXCLUSIVELY by out.exists() && out.length() > 0.
        // This avoids the ENTRY_CREATE race: on Windows, fopen() triggers
        // ENTRY_CREATE BEFORE fclose() writes the data, so matching the
        // filename alone is not sufficient — the file may still be empty.
        //
        // Each poll is capped at 50 ms; even if WatchService misses an event,
        // the existence check at the top of the loop re-fires within 50 ms.
        log("[REQUEST] Waiting for result file: " + expectedFilename);
        boolean found = false;
        long deadline = startTime + RESULT_TIMEOUT;

        while (System.currentTimeMillis() < deadline) {

            // ── Authoritative check: non-empty file present ───────────────────
            if (out.exists() && out.length() > 0) {
                found = true;
                break;
            }

            long remaining = deadline - System.currentTimeMillis();
            if (remaining <= 0)
                break;

            // ── WatchService: wake-up only, drain and reset ───────────────────
            // Poll for at most 50 ms. If an event arrives (for any file), reset
            // the key and immediately loop back to the existence check above.
            // If null (50 ms elapsed with no event), also loop back.
            WatchKey key = watcher.poll(Math.min(remaining, 50L), TimeUnit.MILLISECONDS);
            if (key != null) {
                key.pollEvents(); // drain — we don't act on event content here
                key.reset(); // must reset to keep receiving future events
            }
        }

        if (!found) {
            log("[ERROR] Timed out waiting for result on request " + reqNum);
            return;
        }

        long roundTripMs = System.currentTimeMillis() - startTime;

        // 4. Parse result
        String decoded = "";
        double processingMs = 0.0;

        try (BufferedReader br = new BufferedReader(new FileReader(out))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.startsWith("Decoded:")) {
                    decoded = line.substring("Decoded:".length()).trim();
                } else if (line.startsWith("ProcessingTime:")) {
                    processingMs = Double.parseDouble(
                            line.substring("ProcessingTime:".length()).trim());
                }
            }
        }

        // Print summary
        String preview = decoded.length() >= 64 ? decoded.substring(0, 64) + "…" : decoded;
        System.out.println();
        log("[RESULT] Decoded (first 64 bits) : " + preview);
        log(String.format("[RESULT] MATLAB processing time  : %.2f ms", processingMs));
        log(String.format("[RESULT] Total round-trip time   : %d ms", roundTripMs));
        System.out.println();
    }

    // Simple timestamped console logger
    private static void log(String msg) {
        System.out.println("[" + new SimpleDateFormat("HH:mm:ss.SSS").format(new Date())
                + "] " + msg);
    }
}
