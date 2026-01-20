% Simplified Conveyor System - MATLAB Script to Generate Stateflow
% 2 Sensors (S1, S2) and 1 Robot
clear; clc;

% Create a new Simulink model
modelName = 'SimpleConveyorSystem';
if bdIsLoaded(modelName)
    close_system(modelName, 0);
end
new_system(modelName);
open_system(modelName);

% Add Stateflow Chart
sfChart = add_block('sflib/Chart', [modelName '/ConveyorLogic']);
set_param(sfChart, 'Position', [100 100 400 400]);

% Get chart object
rt = sfroot;
model = rt.find('-isa', 'Simulink.BlockDiagram', 'Name', modelName);
chart = model.find('-isa', 'Stateflow.Chart');

% Set discrete sample time for PLC Coder
chart.ChartUpdate = 'DISCRETE';
chart.SampleTime = '0.1';

% Add Input Data
s1 = Stateflow.Data(chart);
s1.Name = 's1';
s1.Scope = 'Input';
s1.DataType = 'boolean';

s2 = Stateflow.Data(chart);
s2.Name = 's2';
s2.Scope = 'Input';
s2.DataType = 'boolean';

robot_done = Stateflow.Data(chart);
robot_done.Name = 'robot_done';
robot_done.Scope = 'Input';
robot_done.DataType = 'boolean';

% Add Output Data
conveyor_on = Stateflow.Data(chart);
conveyor_on.Name = 'conveyor_on';
conveyor_on.Scope = 'Output';
conveyor_on.DataType = 'boolean';

robot_trigger = Stateflow.Data(chart);
robot_trigger.Name = 'robot_trigger';
robot_trigger.Scope = 'Output';
robot_trigger.DataType = 'boolean';

% Create States
stateIDLE = Stateflow.State(chart);
stateIDLE.Name = 'IDLE';
stateIDLE.Position = [50 50 150 100];

stateMOVING = Stateflow.State(chart);
stateMOVING.Name = 'MOVING';
stateMOVING.Position = [50 200 150 100];

stateROBOT = Stateflow.State(chart);
stateROBOT.Name = 'ROBOT_WORKING';
stateROBOT.Position = [250 200 150 100];

% Create default transition to IDLE (proper way for PLC Coder)
defaultTrans = Stateflow.Transition(chart);
defaultTrans.Destination = stateIDLE;
defaultTrans.DestinationOClock = 9;
defaultTrans.Source = [];
defaultTrans.SourceOClock = 0;

% Create Transitions
% IDLE to MOVING
t1 = Stateflow.Transition(chart);
t1.Source = stateIDLE;
t1.Destination = stateMOVING;
t1.LabelString = '[s1 && ~s2]';

% MOVING to ROBOT_WORKING
t2 = Stateflow.Transition(chart);
t2.Source = stateMOVING;
t2.Destination = stateROBOT;
t2.LabelString = '[s2]';

% ROBOT_WORKING to IDLE
t3 = Stateflow.Transition(chart);
t3.Source = stateROBOT;
t3.Destination = stateIDLE;
t3.LabelString = '[robot_done && ~s2]';

% Add state actions using label strings
stateIDLE.LabelString = sprintf('IDLE\nentry: conveyor_on = false; robot_trigger = false;');
stateMOVING.LabelString = sprintf('MOVING\nduring: conveyor_on = true;');
stateROBOT.LabelString = sprintf('ROBOT_WORKING\nentry: conveyor_on = false; robot_trigger = true;\nduring: conveyor_on = false;');

% Add input blocks with boolean output type
add_block('simulink/Sources/Constant', [modelName '/S1_Sensor'], 'Value', 'false', ...
    'OutDataTypeStr', 'boolean', 'Position', [20 50 50 70]);
add_block('simulink/Sources/Constant', [modelName '/S2_Sensor'], 'Value', 'false', ...
    'OutDataTypeStr', 'boolean', 'Position', [20 120 50 140]);
add_block('simulink/Sources/Constant', [modelName '/Robot_Done'], 'Value', 'false', ...
    'OutDataTypeStr', 'boolean', 'Position', [20 190 50 210]);

% Add output blocks
add_block('simulink/Sinks/Scope', [modelName '/Conveyor_Status'], 'Position', [500 50 530 80]);
add_block('simulink/Sinks/Scope', [modelName '/Robot_Status'], 'Position', [500 150 530 180]);

% Connect blocks
add_line(modelName, 'S1_Sensor/1', 'ConveyorLogic/1', 'autorouting', 'on');
add_line(modelName, 'S2_Sensor/1', 'ConveyorLogic/2', 'autorouting', 'on');
add_line(modelName, 'Robot_Done/1', 'ConveyorLogic/3', 'autorouting', 'on');
add_line(modelName, 'ConveyorLogic/1', 'Conveyor_Status/1', 'autorouting', 'on');
add_line(modelName, 'ConveyorLogic/2', 'Robot_Status/1', 'autorouting', 'on');

% Configure simulation parameters
set_param(modelName, 'StopTime', '100');

% Save the model as .slx
save_system(modelName, [modelName '.slx']);

disp('==============================================');
disp('Simplified Conveyor System Created!');
disp('==============================================');
disp(' ');
disp(['Model saved as: ' modelName '.slx']);
disp(' ');
disp('States:');
disp('  - IDLE: Waiting for object (conveyor stopped)');
disp('  - MOVING: Conveyor moving object from S1 to S2');
disp('  - ROBOT_WORKING: Robot processing object at S2');
disp(' ');
disp('Logic:');
disp('  1. S1 detects object & S2 clear → Start conveyor');
disp('  2. Object reaches S2 → Stop conveyor, trigger robot');
disp('  3. Robot done & S2 clears → Return to IDLE');
disp(' ');
disp('Inputs (change Constant blocks to test):');
disp('  - S1_Sensor: Set to 1 when object detected at sensor 1');
disp('  - S2_Sensor: Set to 1 when object reaches sensor 2');
disp('  - Robot_Done: Set to 1 when robot finishes processing');
disp(' ');
disp('Outputs (view in Scopes):');
disp('  - Conveyor_Status: Shows when conveyor is running');
disp('  - Robot_Status: Shows when robot is triggered');
disp('==============================================');
disp(' ');
disp('To test: Open the model and double-click blocks to change values!');