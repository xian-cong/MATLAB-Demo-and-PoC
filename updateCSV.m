function updateCSV()
    % This script updates the CSV file every 10 seconds
    % Run this separately while your compiled model is running
    
    filename = 'input_data.csv';
    
    while true
        % Generate random data (replace with your actual data source)
        temp = 20 + randn() * 5;      % Temperature: ~20°C
        pressure = 101 + randn() * 2;  % Pressure: ~101 kPa
        flowRate = 3 + randn() * 0.5;  % Flow rate: ~3 L/min
        
        % Write to CSV
        fileID = fopen(filename, 'w');
        fprintf(fileID, '%.2f,%.2f,%.2f\n', temp, pressure, flowRate);
        fclose(fileID);
        
        fprintf('Updated CSV at %s: T=%.2f, P=%.2f, F=%.2f\n', ...
                datestr(now), temp, pressure, flowRate);
        
        % Wait 10 seconds
        pause(10);
    end
end