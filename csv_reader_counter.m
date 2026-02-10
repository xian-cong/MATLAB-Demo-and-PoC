function [value1, value2, value3] = fcn(counter)
% MATLAB Function: CSV Reader with Counter
% This function reads data from input_data.csv based on counter inputs
% It mimics the Stateflow functionality from modelPOC.slx

coder.extrinsic('readCSV');  % Declare readCSV as extrinsic since it uses file I/O

persistent lastCounter;
persistent data;
persistent errorCount;

if isempty(lastCounter)
    lastCounter = 0;
    data = [1.5, 1.8, 1]; % Default values from the CSV
    errorCount = 0;
end

% Update CSV data every 50 counter steps (adjust as needed)
% This corresponds to approximately 5 seconds with 0.1s sample time
if counter - lastCounter >= 50
    newData = readCSV();

    % Only update if valid data received
    if ~all(newData == 0)
        data = newData;
        errorCount = 0;
    else
        errorCount = errorCount + 1;
        % Keep using last good data if read fails
    end

    lastCounter = counter;
end

value1 = data(1);
value2 = data(2);
value3 = data(3);

end

function values = readCSV()
% Internal function to read CSV data
coder.extrinsic('fopen', 'fgets', 'fclose', 'strtrim', 'strsplit', 'str2double');

values = [0.0, 0.0, 0.0];

fid = fopen('input_data.csv', 'r');
if fid == -1
    return;
end

line = fgets(fid);
fclose(fid);  % Always close file

if line == -1
    return;
end

% Parse the CSV line
line = strtrim(line);
data_str = strsplit(line, ',');

% Convert to numbers
data = zeros(1, length(data_str));
for i = 1:length(data_str)
    data(i) = str2double(data_str{i});
end

% Handle case where we don't have enough values
if length(data) < 3
    data = [data, zeros(1, 3-length(data))];
end

values = data;

end