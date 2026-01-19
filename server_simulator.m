function server_simulator()
    % CONFIGURATION
    % filename = 'C:\demo\simulinkCompilerRealTimeUpdateCodeGenSafe\release\build\input_data.csv';
    filename = 'input_data.csv';
    temp_filename = 'input_data_temp.csv'; % Write here first
    update_interval = 10; % Seconds (Change to 900 for 15 mins)
    
    disp('------------------------------------------------');
    disp(['Server Simulator Started. Updating ' filename]);
    disp(['Interval: ' num2str(update_interval) ' seconds.']);
    disp('Press Ctrl+C in this Command Window to stop.');
    disp('------------------------------------------------');

    counter = 1;

    try
        while true
            % 1. Generate random data (Mimic sensor/server data)
            % Format: [Value1, Value2, Value3]
            % Example: Sine wave + noise to make it look real
            val1 = 10 * sin(counter * 0.1); 
            val2 = 20 * cos(counter * 0.1); 
            val3 = rand() * 100; % Random noise
            
            % 2. ATOMIC WRITE STRATEGY
            % Step A: Write to a temporary file first
            fid = fopen(temp_filename, 'w');
            if fid == -1
                warning('Could not write to temp file. Retrying...');
                pause(1);
                continue;
            end
            
            % Write 3 comma-separated values
            fprintf(fid, '%.4f,%.4f,%.4f\n', val1, val2, val3);
            fclose(fid);
            
            % Step B: Instantly rename temp file to actual file
            % This operation is atomic on most OSs, preventing read errors
            movefile(temp_filename, filename, 'f');
            
            % 3. Log to console (so you know it's alive)
            fprintf('[%s] Update #%d: %.2f, %.2f, %.2f\n', ...
                datestr(now, 'HH:MM:SS'), counter, val1, val2, val3);
            
            counter = counter + 1;
            
            % 4. Wait for next cycle
            pause(update_interval);
        end
    catch ME
        % Clean exit if interrupted
        disp('Server Simulator Stopped.');
        rethrow(ME);
    end
end