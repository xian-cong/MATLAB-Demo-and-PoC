# Java ↔ MATLAB Persistent IPC Demo

A proof-of-concept demonstrating a **daemon-style MATLAB process** controlled by Java via the filesystem.

---

## Folder Structure

```
C:\demo\java_matlab\
├── input\                  ← Java writes data_<ts>.txt here
├── output\                 ← MATLAB writes result_<ts>.txt here
├── system\                 ← MATLAB writes heartbeat.txt here
├── matlab_daemon.m         ← MATLAB daemon script
├── MatlabController.java   ← Java controller
├── MatlabController.class  ← Compiled Java bytecode
├── build.bat               ← Compile: javac MatlabController.java
└── run.bat                 ← Build + run the demo
```

---

## How to Run

> **Prerequisite:** MATLAB with the Parallel Computing Toolbox must be on your `PATH`.

```bat
cd C:\demo\java_matlab
run.bat
```

On the **first run**, MATLAB opens in a separate window and creates a parallel pool (~30–60 s).  
On **subsequent runs**, Java detects the live heartbeat and reuses the daemon immediately.

---

## Flow Diagram

```mermaid
flowchart TD
    A([run.bat]) --> B[build.bat\njavac MatlabController.java]
    B --> C[java MatlabController]

    subgraph JAVA ["☕  MatlabController.java  (runs 3 iterations)"]
        C --> D{Read\nsystem/heartbeat.txt}
        D -- "Missing or\nolder than 10 s" --> E["Launch MATLAB\nmatlab -nosplash -nodesktop\n-r run('matlab_daemon.m')"]
        E --> F[Poll heartbeat every 500 ms\nup to 90 s]
        F -- "Heartbeat fresh" --> G
        D -- "Fresh ≤ 10 s" --> G[Generate 1024 random bits]
        G --> H["Write input/data_&lt;ts&gt;.txt\nStart round-trip timer"]
        H --> I["OS WatchService blocks\nuntil result_&lt;ts&gt;.txt created"]
        I --> J[Parse Decoded + ProcessingTime]
        J --> K[Print results\nRound-trip time]
        K --> L{More\nrequests?}
        L -- Yes --> G
        L -- No --> M([Done])
    end

    subgraph MATLAB ["🔬  matlab_daemon.m  (infinite loop)"]
        N([Start]) --> O[Create parpool\nif not existing]
        O --> P{Every 5 s}
        P --> Q["Write system/heartbeat.txt\n(Unix epoch seconds via cputime clock)"]
        Q --> R{input/data_*.txt\npresent?}
        R -- No --> S[pause 0.01 s]
        S --> P
        R -- Yes --> T[Read binary string\n1024 bits]
        T --> U["parfor over 128 × 8-bit chunks\nXOR + sum simulation"]
        U --> V["Measure CPU time\n(cputime)"]
        V --> W["Write output/result_&lt;ts&gt;.txt\nDecoded: &lt;bits&gt;\nProcessingTime: &lt;ms&gt;"]
        W --> X[Delete input file]
        X --> P
    end

    H -. "writes" .-> R
    W -. "OS ENTRY_CREATE event" .-> I
```

---

## IPC File Formats

### `input/data_<timestamp>.txt`
```
10110010110010001100101...   ← 1024 characters, 0 or 1
```

### `output/result_<timestamp>.txt`
```
Decoded:10110010110010001100101...
ProcessingTime:122.5900
```

### `system/heartbeat.txt`
```
1740276600   ← Unix epoch seconds, refreshed every 5 s by MATLAB
```

---

## Key Design Points

| Concern | Mechanism |
|---|---|
| MATLAB lifecycle detection | `heartbeat.txt` — stale if > 10 s old |
| Request/response matching | Shared `<timestamp>` token in filenames |
| Parallel processing | `parfor` over 8-bit chunks with XOR simulation |
| CPU timing | `cputime` in MATLAB (reflects actual CPU consumption) |
| Java result waiting | `WatchService.poll()` — OS notifies Java instantly on file creation, no sleep loop |
| Java round-trip timing | `System.currentTimeMillis()` before write → after watch event |
