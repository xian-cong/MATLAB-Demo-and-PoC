%% matlab_daemon.m
% Persistent MATLAB daemon for Java <-> MATLAB IPC demo.
% Keeps MATLAB alive, writes heartbeats, polls for input files,
% performs parallel decoding work, and writes result files.

% Derive BASE_DIR from the script's own location so this works on any machine.
[BASE_DIR, ~, ~] = fileparts(mfilename('fullpath'));
INPUT_DIR  = fullfile(BASE_DIR, 'input');
OUTPUT_DIR = fullfile(BASE_DIR, 'output');
SYSTEM_DIR = fullfile(BASE_DIR, 'system');
HEARTBEAT  = fullfile(SYSTEM_DIR, 'heartbeat.txt');

% ── Parallel pool ──────────────────────────────────────────────
fprintf('[DAEMON] Starting up at %s\n', datestr(now));
pool = gcp('nocreate');
if isempty(pool)
    fprintf('[DAEMON] Creating parallel pool...\n');
    parpool('local');
    fprintf('[DAEMON] Parallel pool ready.\n');
else
    fprintf('[DAEMON] Reusing existing parallel pool (%d workers).\n', pool.NumWorkers);
end

% ── Helpers ────────────────────────────────────────────────────
heartbeatTimer = tic;

fprintf('[DAEMON] Entering main loop. Polling %s\n', INPUT_DIR);

% ── Main loop ──────────────────────────────────────────────────
while true

    % --- Heartbeat (every 5 s) ----------------------------------
    if toc(heartbeatTimer) >= 5
        fid = fopen(HEARTBEAT, 'w');
        if fid ~= -1
            fprintf(fid, '%d', floor(posixtime(datetime('now','TimeZone','local'))));
            fclose(fid);
        end
        heartbeatTimer = tic;
    end

    % --- Poll input folder --------------------------------------
    files = dir(fullfile(INPUT_DIR, 'data_*.txt'));
    if ~isempty(files)
        % Pick the oldest file first
        [~, idx] = min([files.datenum]);
        f = files(idx);
        inputPath = fullfile(INPUT_DIR, f.name);

        % Extract timestamp token from filename  data_<ts>.txt
        tok = regexp(f.name, '^data_(.+)\.txt$', 'tokens', 'once');
        if isempty(tok)
            pause(0.01);
            continue;
        end
        ts = tok{1};

        % Read binary string
        fid = fopen(inputPath, 'r');
        if fid == -1
            pause(0.01);
            continue;
        end
        binaryStr = strtrim(fgetl(fid));
        fclose(fid);

        fprintf('[DAEMON] Processing file: %s (%d bits)\n', f.name, length(binaryStr));

        % --- Parallel decoding simulation -----------------------
        N = length(binaryStr);
        bits = double(binaryStr) - 48;   % '0'->0, '1'->1

        % Split into 8-bit chunks for parfor
        numChunks = ceil(N / 8);
        chunks    = cell(1, numChunks);
        for k = 1:numChunks
            s = (k-1)*8 + 1;
            e = min(k*8, N);
            chunks{k} = bits(s:e);
        end

        decoded = zeros(1, numChunks);
        tStart  = cputime;
        parfor k = 1:numChunks   %#ok<PFUIX>
            chunk = chunks{k};
            % Simulate work: XOR with a key and sum
            key   = mod(k, 2);
            val   = sum(bitxor(chunk, key));
            decoded(k) = val;            %#ok<PFOUS>
        end
        elapsedMs = (cputime - tStart) * 1000;

        fprintf('[DAEMON] parfor done in %.2f ms\n', elapsedMs);

        % --- Write result file ----------------------------------
        outputPath = fullfile(OUTPUT_DIR, ['result_' ts '.txt']);
        fid = fopen(outputPath, 'w');
        if fid ~= -1
            fprintf(fid, 'Decoded:%s\r\n', binaryStr);
            fprintf(fid, 'ProcessingTime:%.4f\r\n', elapsedMs);
            fclose(fid);
        end

        % --- Delete input file ----------------------------------
        delete(inputPath);

        fprintf('[DAEMON] Result written: result_%s.txt\n', ts);
    else
        pause(0.01);
    end
end
