%% Design the Interpolation and decimation filter for the DVBS2 receiver.
function b = soc_dvbs2_designFIRFilter(Fs,passBW,stopBW)
% Returns a discrete-time filter object.
% Equiripple Lowpass filter designed using the FIRPM function.
%
%   Inputs:
%       Fs     - Sampling frequency in Hz.
%       passBW - Passband bandwidth in Hz.
%       stopBW - Stopband bandwidth in Hz.
%
%   Output:
%       b      - Coefficients of the designed FIR filter.
%
%   The filter is designed using the FIRPM function based on the specified
%   passband and stopband frequencies, passband ripple, and stopband attenuation.
%

%   Copyright 2023-2024 The MathWorks, Inc.

% All frequency values are in Hz.
Fpass = passBW/2;  % Passband Frequency
Fstop = stopBW/2;                   % Stopband Frequency
Dpass = 0.0057563991496;        % Passband Ripple
Dstop = 1e-08;                  % Stopband Attenuation
dens  = 20;                     % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, dens);
end