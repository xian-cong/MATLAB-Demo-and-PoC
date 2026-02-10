function callback_preload()
% CALLBACK_PRELOAD - Replaces PreLoadFcn model callback
% This function is called before the model loads
% It CAN be packaged into the .exe!

fprintf('PreLoadFcn: Model is loading...\n');

% Add current directory to path (if needed)
addpath(genpath(pwd));

% Any other pre-load initialization can go here
end
