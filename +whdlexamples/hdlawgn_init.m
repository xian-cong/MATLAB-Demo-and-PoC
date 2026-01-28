%hdlawgn_init Script to initialize HDLAWGNGenerator.
%  This script initializes seeds for Tausworthe generators, generates coefficients for
%  evaluation of logarithm (log) and square root (sqrt), look-up table data for Signal-to-Noise Ratio (SNR) dB to linear scale mapping.

%% Generate simulation input
snrdB = [5,15];
numOfSamples = 10^6;

snrdBSimInput = repmat(snrdB,numOfSamples,1); 
snrdBSimInput = snrdBSimInput(:);
SamplingTime = 1/10^6;
latency = 37; %latency of model
StopTime = (length(snrdBSimInput)+latency-1)*SamplingTime; 


%% Seeds for the Tausworthe random number generator
seedsURNG1 = [121 719 511]; %Seeds for TausURNG1
seedsURNG2 = [2343 323 833]; %Seeds for TausURNG2

%% Coefficients for log implementation
breakpointsLog = linspace(1,2,257);
coefficientsLog = zeros(256,3);
for j=1:256
        x = linspace(breakpointsLog(j),breakpointsLog(j+1),2^20);
        y = log(x);
        coefficientsLog(j,:) = polyfit(x,y,2);
end

%% Coefficients for sqrt implementation
breakpointsSqrt1 = linspace(1,2,65);
breakpointsSqrt2 = linspace(2,4,65);
coefficientsSqrt1 = zeros(64,2);
coefficientsSqrt2 = zeros(64,2);
for j=1:64
        x1 = linspace(breakpointsSqrt1(j),breakpointsSqrt1(j+1),2^20);
        y1 = sqrt(x1);
        coefficientsSqrt1(j,:) = polyfit(x1,y1,1); % coefficients for the range [1,2)
        x2 = linspace(breakpointsSqrt2(j),breakpointsSqrt2(j+1),2^20);
        y2 = sqrt(x2);
        coefficientsSqrt2(j,:) = polyfit(x2,y2,1);  %% coefficients for the range [2,4)
end
 
%% SNRdB to linear scale mapping
breakpointsSNR = -20:0.1:31;
noisePow=sqrt((1./10.^(breakpointsSNR/10))./2); % noise power is computed assuming signal power is equal to 1

