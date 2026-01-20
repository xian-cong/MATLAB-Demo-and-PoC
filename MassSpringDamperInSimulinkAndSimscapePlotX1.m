% Code to plot simulation results from openExample('simulink/ControlASimulinkSimulationAppDesignerExample')

% Copyright 2024 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
try
    figure(h1_ex_mass_spring_damper_appdemo)
catch
    h1_ex_mass_spring_damper_appdemo=figure('Name', 'ex_mass_spring_damper_appdemo');
end

% Generate simulation results if they don't exist
if(~exist('ex_mass_spring_damper_appdemo.slx','var'))
    sim('ex_mass_spring_damper_appdemo.slx');
end

% Get simulation results
temp_x1_sl=get(out.logsout_MassSpringDamperInSimulink,'m1_h_sl');    % Simulink

% Plot results
plot(temp_x1_sl.Values.Time,temp_x1_sl.Values.Data,'r','LineWidth',2);
grid on
xlabel('Time (s)');
ylabel('Position (m)');
title('Position of Mass');


% Remove temporary variables
clear temp_x1_sl temp_x1_sc
