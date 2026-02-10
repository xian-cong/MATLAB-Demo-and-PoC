function callback_close()
% CALLBACK_CLOSE - Replaces CloseFcn model callback
% This function is called when the model closes
% It CAN be packaged into the .exe!

fprintf('CloseFcn: Cleaning up...\n');

% Clean up workspace variables
if evalin('base', 'exist(''amplitude_param'', ''var'')')
    evalin('base', 'clear amplitude_param frequency_param gain_param');
end

if evalin('base', 'exist(''timer_handle'', ''var'')')
    evalin('base', 'clear timer_handle');
end

end
