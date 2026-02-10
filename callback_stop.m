function callback_stop()
% CALLBACK_STOP - Replaces StopFcn model callback
% This function is called when simulation stops
% It CAN be packaged into the .exe!

fprintf('\n=== SIMULATION STOPPED ===\n');
fprintf('Time: %s\n', datestr(now));

% Get elapsed time
if evalin('base', 'exist(''timer_handle'', ''var'')')
    timer_handle = evalin('base', 'timer_handle');
    elapsed = toc(timer_handle);
    fprintf('Elapsed Time: %.2f seconds\n', elapsed);
else
    fprintf('Warning: Timer handle not found!\n');
end

% Display results if output exists
if evalin('base', 'exist(''output_signal'', ''var'')')
    output_signal = evalin('base', 'output_signal');
    fprintf('Final value: %.4f\n', output_signal(end));
    fprintf('Max value: %.4f\n', max(output_signal));
    fprintf('Min value: %.4f\n', min(output_signal));
end

end
