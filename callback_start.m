function callback_start()
% CALLBACK_START - Replaces StartFcn model callback
% This function is called when simulation starts
% It CAN be packaged into the .exe!

fprintf('\n=== SIMULATION STARTING ===\n');
fprintf('Time: %s\n', datestr(now));

% Start timer (store in base workspace)
timer_handle = tic;  % Get the timer handle
assignin('base', 'timer_handle', timer_handle);

end
