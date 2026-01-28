%% Multichannel FIR Filter for FPGA
% This example shows how to implement a discrete
% FIR filter with multiple input data streams for hardware.
%
% In many DSP applications, multiple data streams are filtered by the same
% filter. The straightforward solution is to implement a separate filter for
% each channel. You can create a more area-efficient structure by sharing 
% one filter implementation across multiple channels. The resulting hardware
% requires a faster clock rate compared to the clock rate used for a single channel filter.

% Copyright 2012 The MathWorks, Inc.

%% Model Multichannel FIR Filter
modelname = 'dspmultichannelhdl';
open_system(modelname);
%%
% The model contains a two-channel FIR filter. The input data vector includes two
% streams of sinusoidal signal with different frequencies. The input data
% streams are processed by a lowpass filter whose coefficients are
% specified by the Model Properties |InitFcn| Callback function.
%%
% Select a fully parallel architecture for the Discrete FIR Filter block,
% and enable resource sharing across multiple channels.
systemname = [modelname '/Multichannel FIR Filter'];
blockname = [systemname '/Discrete FIR Filter'];
set_param(blockname,'FilterStructure','Direct form symmetric');
hdlset_param(blockname,'Architecture','Fully Parallel');
hdlset_param(blockname,'ChannelSharing','On');
%%
% You can alternatively specify these settings on the *HDL Block Properties* menu,
% which you access by right-clicking a block and selecting *HDL Code* > *HDL Block
% Properties*. 
%% Simulation Results
% Run the example model and open the scope to compare the two data streams.
sim(modelname);
open_system([modelname '/Scope']);
%% Generate HDL Code and Test Bench
% You must have an HDL Coder(TM) license to generate HDL code for this example model.
% Use this command to generate HDL code for the Multichannel FIR Filter subsystem. 
% Enable the resource use report. 
%
%   makehdl(systemname,'resource','on');
%
% Use this command to generate a test bench that compares the HDL simulation
% results with the Simulink model results. 
%
%   makehdltb(systemname);
%
%% Compare Resource Utilization
% To compare resource use with and without sharing, you can disable sharing
% resources across channels and generate HDL code again, then compare the 
% resource use reports.  
%
%   hdlset_param(blockname,'ChannelSharing','Off');
%   makehdl(systemname,'resource','on');
%
%
% <<../dspmultichannelhdl_rp.png>>
%
