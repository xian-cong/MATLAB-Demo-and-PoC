# Instructions for Adding MATLAB Function Block to Combined Model

## Overview
This document explains how to manually add a MATLAB Function block to the combined model that reads CSV data based on counter input.

## Steps to Add the MATLAB Function Block

1. **Open the combined model**
   ```matlab
   open_system('combined_callback_csv_model.slx');
   ```

2. **Add a MATLAB Function block**
   - Open the Simulink Library Browser
   - Navigate to "User-Defined Functions" 
   - Drag and drop "MATLAB Function" block into your model
   - Rename it to "CSV Reader with Counter"

3. **Configure the MATLAB Function block**
   - Double-click the "CSV Reader with Counter" block
   - Replace the default code with the content from `csv_reader_counter.m`
   - The code should look like this:

```matlab
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
```

4. **Connect the blocks**
   - Connect the Counter block output to the input of the MATLAB Function block
   - Connect the three outputs of the MATLAB Function block to additional processing or visualization blocks as needed
   - You can connect them to the Mux block or other parts of your model

5. **Update the model connections**
   - You may want to modify the existing connections to incorporate the CSV data
   - For example, you could use the CSV values to modulate your sine wave amplitude or frequency

6. **Save the model**
   - Save your changes to the combined model

## Alternative Connection Options

You can connect the CSV data in various ways:

1. **Direct connection**: Connect CSV values directly to your signal processing
2. **Multiplexer**: Combine CSV values with other signals using a Mux block
3. **Gain modulation**: Use CSV values to modulate gains or other parameters
4. **Visualization**: Send CSV values to scopes or displays

## Testing the Model

After adding the MATLAB Function block:

1. Make sure `input_data.csv` is in the same directory
2. Run the simulation:
   ```matlab
   sim('combined_callback_csv_model');
   ```
3. Observe how the CSV data affects your simulation

## Deployment Notes

When deploying with Simulink Compiler:
- Include the `input_data.csv` file as a required file
- The MATLAB Function block will be compiled into the executable
- The file I/O operations will work in the standalone application