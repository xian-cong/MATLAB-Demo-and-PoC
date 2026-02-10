function create_callback_demo_model()
% CREATE_CALLBACK_DEMO_MODEL - Creates a Simulink model with callback functions
%
% This function creates a simple Simulink model and sets up the callback functions
% to call external .m files.

modelName = 'callback_demo_with_callbacks';

% Close the model if it's already open
if bdIsLoaded(modelName)
    close_system(modelName, 0);
end

% Delete the model if it exists in memory
try
    delete_system(modelName);
catch
    % If delete_system fails, continue anyway
end

% Create a new model
new_system(modelName);

% Add blocks to make a functional model that uses the callback parameters
add_block('simulink/Sources/Sine Wave', [modelName '/Sine Wave']);
add_block('simulink/Math Operations/Gain', [modelName '/Gain']);
add_block('simulink/Sinks/Scope', [modelName '/Scope']);

% Connect the blocks: Sine Wave -> Gain -> Scope
add_line(modelName, 'Sine Wave/1', 'Gain/1');
add_line(modelName, 'Gain/1', 'Scope/1');

% Configure the Sine Wave block to use parameters from callbacks
set_param([modelName '/Sine Wave'], 'Amplitude', 'amplitude_param');
set_param([modelName '/Sine Wave'], 'Frequency', 'frequency_param');

% Configure the Gain block to use the gain parameter from callbacks
set_param([modelName '/Gain'], 'Gain', 'gain_param');

% Set the model callbacks to call external functions
set_param(modelName, 'PreLoadFcn', 'callback_preload();');
set_param(modelName, 'InitFcn', 'callback_init();');
set_param(modelName, 'StartFcn', 'callback_start();');
set_param(modelName, 'StopFcn', 'callback_stop();');
set_param(modelName, 'CloseFcn', 'callback_close();');

% Set other model properties
set_param(modelName, 'SolverName', 'ode45');

% Save the model
save_system(modelName, [modelName '.slx']);

% Close the model
close_system(modelName, 0);

fprintf('Model %s.slx has been created with callback functions.\n', modelName);
end