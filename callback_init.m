function callback_init()
% CALLBACK_INIT - Replaces InitFcn model callback
% This function initializes parameters for the simulation
% It CAN be packaged into the .exe!

fprintf('InitFcn: Initializing parameters...\n');

% Initialize model parameters
% These will be available in the base workspace
amplitude_value = 5;
frequency_value = 2*pi*1;
gain_value = 0.8;

assignin('base', 'amplitude_param', amplitude_value);
assignin('base', 'frequency_param', frequency_value);
assignin('base', 'gain_param', gain_value);

fprintf('  Amplitude: %g\n', amplitude_value);
fprintf('  Frequency: %g\n', frequency_value);
fprintf('  Gain: %g\n', gain_value);

end