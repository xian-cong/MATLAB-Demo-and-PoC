%% CREATE_COMBINED_CALLBACK_CSV_MODEL
% This script creates a Simulink model that:
% 1. Has callbacks populated in Model Properties
% 2. Uses a MATLAB Function block to read CSV data based on counter
% 3. Demonstrates deployment-ready callback handling

clear all;
close all;
clc;

%% Model Configuration
model_name = 'combined_callback_csv_model';

% Close model if it exists
if bdIsLoaded(model_name)
    close_system(model_name, 0);
end

% Delete model file if it exists
if exist([model_name '.slx'], 'file')
    delete([model_name '.slx']);
end

%% Create New Model
fprintf('Creating combined callback + CSV model: %s\n', model_name);
new_system(model_name);
open_system(model_name);

%% Configure Model Settings
set_param(model_name, 'Solver', 'FixedStepDiscrete');
set_param(model_name, 'FixedStep', '0.1');
set_param(model_name, 'StopTime', '50');  % Run for 50 seconds

%% Add Blocks

% Counter block (generates incrementing values)
add_block('simulink/Sources/Counter Free-Running', [model_name '/Counter']);
set_param([model_name '/Counter'], 'Position', [50, 100, 90, 130]);

% MATLAB Function Block - CSV Reader with Counter
add_block('simulink/User-Defined Functions/MATLAB Function', ...
    [model_name '/CSV Reader']);
set_param([model_name '/CSV Reader'], 'Position', [150, 85, 280, 155]);

% Sine Wave (will be modulated by CSV data)
add_block('simulink/Sources/Sine Wave', [model_name '/Sine Wave']);
set_param([model_name '/Sine Wave'], 'Position', [50, 250, 80, 280]);
set_param([model_name '/Sine Wave'], 'Amplitude', 'amplitude_param');
set_param([model_name '/Sine Wave'], 'Frequency', 'frequency_param');

% Gain blocks (will use CSV values)
add_block('simulink/Math Operations/Gain', [model_name '/Gain1']);
set_param([model_name '/Gain1'], 'Position', [350, 90, 380, 120]);
set_param([model_name '/Gain1'], 'Gain', '1');

add_block('simulink/Math Operations/Gain', [model_name '/Gain2']);
set_param([model_name '/Gain2'], 'Position', [350, 140, 380, 170]);
set_param([model_name '/Gain2'], 'Gain', '1');

add_block('simulink/Math Operations/Gain', [model_name '/Gain3']);
set_param([model_name '/Gain3'], 'Position', [350, 190, 380, 220]);
set_param([model_name '/Gain3'], 'Gain', '1');

% Product block (modulate sine wave with CSV value1)
add_block('simulink/Math Operations/Product', [model_name '/Modulator']);
set_param([model_name '/Modulator'], 'Position', [430, 165, 460, 195]);

% Mux (combine signals for visualization)
add_block('simulink/Signal Routing/Mux', [model_name '/Mux']);
set_param([model_name '/Mux'], 'Position', [520, 80, 525, 220]);
set_param([model_name '/Mux'], 'Inputs', '4');

% Scope
add_block('simulink/Sinks/Scope', [model_name '/Scope']);
set_param([model_name '/Scope'], 'Position', [570, 125, 600, 155]);

% Displays for CSV values
add_block('simulink/Sinks/Display', [model_name '/CSV Value 1']);
set_param([model_name '/CSV Value 1'], 'Position', [350, 35, 410, 55]);

add_block('simulink/Sinks/Display', [model_name '/CSV Value 2']);
set_param([model_name '/CSV Value 2'], 'Position', [450, 35, 510, 55]);

add_block('simulink/Sinks/Display', [model_name '/CSV Value 3']);
set_param([model_name '/CSV Value 3'], 'Position', [550, 35, 610, 55]);

% To Workspace
add_block('simulink/Sinks/To Workspace', [model_name '/Output Data']);
set_param([model_name '/Output Data'], 'Position', [570, 240, 630, 260]);
set_param([model_name '/Output Data'], 'VariableName', 'simulation_output');
set_param([model_name '/Output Data'], 'SaveFormat', 'Array');

%% Configure MATLAB Function Block Code
fprintf('Configuring MATLAB Function block...\n');

matlab_fcn_block = [model_name '/CSV Reader'];

% Wait for block to be fully created
pause(0.5);

% Get the MATLAB Function block chart
chart = [];
for attempt = 1:5
    try
        chart = find(slroot, '-isa', 'Stateflow.EMChart', 'Path', matlab_fcn_block);
        if ~isempty(chart)
            break;
        end
    catch
    end
    pause(0.3);
end

if ~isempty(chart)
    % Define the CSV reader function code
    fcn_code = [...
        'function [value1, value2, value3] = fcn(counter)', newline, ...
        '%% CSV Reader with Counter', newline, ...
        '% Reads data from input_data.csv based on counter', newline, newline, ...
        'coder.extrinsic(''readtable'', ''exist'');', newline, newline, ...
        '% Convert counter to double (Counter block outputs uint16)', newline, ...
        'counter_double = double(counter);', newline, newline, ...
        '% Declare persistent variables with explicit types', newline, ...
        'persistent lastCounter;', newline, ...
        'persistent data;', newline, newline, ...
        'if isempty(lastCounter)', newline, ...
        '    lastCounter = double(0);  % Initialize as double', newline, ...
        '    data = [1.5, 1.8, 1.0];   % Default values', newline, ...
        'end', newline, newline, ...
        '%% Update CSV data every 50 counter steps', newline, ...
        'if counter_double - lastCounter >= 50', newline, ...
        '    % Try to read CSV file', newline, ...
        '    if coder.target(''MATLAB'')', newline, ...
        '        if exist(''input_data.csv'', ''file'')', newline, ...
        '            try', newline, ...
        '                T = readtable(''input_data.csv'', ''ReadVariableNames'', false);', newline, ...
        '                if ~isempty(T)', newline, ...
        '                    data(1) = T{1,1};', newline, ...
        '                    data(2) = T{1,2};', newline, ...
        '                    data(3) = T{1,3};', newline, ...
        '                end', newline, ...
        '            catch', newline, ...
        '                % Keep last good data on error', newline, ...
        '            end', newline, ...
        '        end', newline, ...
        '    end', newline, ...
        '    lastCounter = counter_double;  % Update with double value', newline, ...
        'end', newline, newline, ...
        'value1 = data(1);', newline, ...
        'value2 = data(2);', newline, ...
        'value3 = data(3);', newline];
    
    chart.Script = fcn_code;
    fprintf('MATLAB Function code configured!\n');
    
    % Wait for Simulink to process
    pause(1);
    
    try
        set_param(model_name, 'SimulationCommand', 'update');
    catch
    end
    pause(0.5);
else
    warning('Could not configure MATLAB Function block automatically.');
    fprintf('You will need to add the code manually.\n');
end

%% Connect Blocks
fprintf('Connecting blocks...\n');

try
    % Counter to CSV Reader
    add_line(model_name, 'Counter/1', 'CSV Reader/1', 'autorouting', 'on');
    
    % CSV Reader outputs to Gains
    add_line(model_name, 'CSV Reader/1', 'Gain1/1', 'autorouting', 'on');
    add_line(model_name, 'CSV Reader/2', 'Gain2/1', 'autorouting', 'on');
    add_line(model_name, 'CSV Reader/3', 'Gain3/1', 'autorouting', 'on');
    
    % CSV values to displays
    add_line(model_name, 'CSV Reader/1', 'CSV Value 1/1', 'autorouting', 'on');
    add_line(model_name, 'CSV Reader/2', 'CSV Value 2/1', 'autorouting', 'on');
    add_line(model_name, 'CSV Reader/3', 'CSV Value 3/1', 'autorouting', 'on');
    
    % Sine wave and CSV value1 to modulator
    add_line(model_name, 'Sine Wave/1', 'Modulator/1', 'autorouting', 'on');
    add_line(model_name, 'CSV Reader/1', 'Modulator/2', 'autorouting', 'on');
    
    % Outputs to Mux
    add_line(model_name, 'Gain1/1', 'Mux/1', 'autorouting', 'on');
    add_line(model_name, 'Gain2/1', 'Mux/2', 'autorouting', 'on');
    add_line(model_name, 'Gain3/1', 'Mux/3', 'autorouting', 'on');
    add_line(model_name, 'Modulator/1', 'Mux/4', 'autorouting', 'on');
    
    % Mux to Scope and To Workspace
    add_line(model_name, 'Mux/1', 'Scope/1', 'autorouting', 'on');
    add_line(model_name, 'Mux/1', 'Output Data/1', 'autorouting', 'on');
    
    fprintf('All blocks connected!\n');
    
catch ME
    warning('Error connecting some blocks: %s', ME.message);
    fprintf('You may need to connect some blocks manually.\n');
end

%% Add Model Callbacks (Deployable Version)
fprintf('\nAdding deployable model callbacks...\n');

% PreLoadFcn
set_param(model_name, 'PreLoadFcn', 'callback_preload();');
fprintf('✓ PreLoadFcn: callback_preload()\n');

% InitFcn
set_param(model_name, 'InitFcn', 'callback_init();');
fprintf('✓ InitFcn: callback_init()\n');

% StartFcn
set_param(model_name, 'StartFcn', 'callback_start();');
fprintf('✓ StartFcn: callback_start()\n');

% StopFcn
set_param(model_name, 'StopFcn', 'callback_stop();');
fprintf('✓ StopFcn: callback_stop()\n');

% CloseFcn
set_param(model_name, 'CloseFcn', 'callback_close();');
fprintf('✓ CloseFcn: callback_close()\n');

%% Save Model
save_system(model_name);
fprintf('\nModel saved: %s.slx\n', model_name);

%% Create Sample CSV File
fprintf('\nCreating sample input_data.csv...\n');
csv_data = [1.5, 1.8, 1.0];
writematrix(csv_data, 'input_data.csv');
fprintf('✓ Created input_data.csv with values: %.1f, %.1f, %.1f\n', ...
    csv_data(1), csv_data(2), csv_data(3));

%% Display Instructions
fprintf('\n');
fprintf('╔════════════════════════════════════════════════════════════╗\n');
fprintf('║  COMBINED MODEL CREATED                                    ║\n');
fprintf('╚════════════════════════════════════════════════════════════╝\n\n');

fprintf('MODEL FEATURES:\n');
fprintf('  ✓ Counter block generates incrementing values\n');
fprintf('  ✓ MATLAB Function reads CSV every 50 counts\n');
fprintf('  ✓ CSV values displayed and used in calculations\n');
fprintf('  ✓ Sine wave modulated by CSV value 1\n');
fprintf('  ✓ All signals combined in Mux and sent to Scope\n');
fprintf('  ✓ Callbacks call deployable .m functions\n\n');

fprintf('CALLBACKS IN MODEL PROPERTIES:\n');
fprintf('  Open Model Properties → Callbacks tab to see:\n');
fprintf('  - PreLoadFcn: callback_preload()\n');
fprintf('  - InitFcn: callback_init()\n');
fprintf('  - StartFcn: callback_start()\n');
fprintf('  - StopFcn: callback_stop()\n');
fprintf('  - CloseFcn: callback_close()\n\n');

fprintf('CSV FUNCTIONALITY:\n');
fprintf('  - Reads input_data.csv every 5 seconds (50 counts × 0.1s)\n');
fprintf('  - Returns 3 values: value1, value2, value3\n');
fprintf('  - Default values: 1.5, 1.8, 1.0\n');
fprintf('  - Update input_data.csv while running to see changes!\n\n');

fprintf('TO TEST:\n');
fprintf('  1. Run: test_combined_model\n');
fprintf('  2. Watch the displays show CSV values\n');
fprintf('  3. Try changing input_data.csv during simulation\n\n');

fprintf('FOR DEPLOYMENT:\n');
fprintf('  Include these files in Simulink Compiler:\n');
fprintf('  - combined_callback_csv_model.slx\n');
fprintf('  - callback_preload.m\n');
fprintf('  - callback_init.m\n');
fprintf('  - callback_start.m\n');
fprintf('  - callback_stop.m\n');
fprintf('  - callback_close.m\n');
fprintf('  - input_data.csv\n\n');

fprintf('╚════════════════════════════════════════════════════════════╝\n\n');
