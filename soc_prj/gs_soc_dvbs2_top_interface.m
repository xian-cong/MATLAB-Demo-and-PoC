%--------------------------------------------------------------------------
% Host Interface Script
% 
% Generated with MATLAB 25.2 (R2025b) at 17:44:08 on 27/10/2025.
% This script was created for the IP Core generated from design 'soc_dvbs2_top'.
% 
% Use this script to access DUT ports in the design that were mapped to compatible IP core interfaces.
% You can write to input ports in the design and read from output ports directly from MATLAB.
% To write to input ports, use the "writePort" command and specify the port name and input data. The input data will be cast to the DUT port's data type before writing.
% To read from output ports, use the "readPort" command and specify the port name. The output data will be returned with the same data type as the DUT port.
% Use the "release" command to release MATLAB's control of the hardware resources.
%--------------------------------------------------------------------------

%% Create xilinxsoc object
hwobj = xilinxsoc('192.168.1.101', 'root', 'root');

%% Create fpga object
hFPGA = fpga(hwobj);

%% Setup fpga object
% This function configures the "fpga" object with the same interfaces as the generated IP core
gs_soc_dvbs2_top_setup(hFPGA);

%% Write/read DUT ports
% Uncomment the following lines to write/read DUT ports in the generated IP Core.
% Update the example data in the write commands with meaningful data to write to the DUT.
%% DVBS2 Register Interface
% writePort(hFPGA, "adc_dac_loopback", zeros([1 1]));
% writePort(hFPGA, "enbNoise", zeros([1 1]));
% writePort(hFPGA, "snrdB", zeros([1 1]));
% writePort(hFPGA, "CFO", zeros([1 1]));
% writePort(hFPGA, "CPO", zeros([1 1]));
% writePort(hFPGA, "modcodIdx", zeros([1 1]));
% writePort(hFPGA, "resetFCPO", zeros([1 1]));
% writePort(hFPGA, "resetDisplay", zeros([1 1]));
% data_nframesSynced = readPort(hFPGA, "nframesSynced");
% data_decodedModcod = readPort(hFPGA, "decodedModcod");
% data_decodedFecFrame = readPort(hFPGA, "decodedFecFrame");
% data_FreqEst = readPort(hFPGA, "FreqEst");
% data_TSorGS = readPort(hFPGA, "TSorGS");
% data_UPL = readPort(hFPGA, "UPL");
% data_DFL = readPort(hFPGA, "DFL");
% data_SYNC = readPort(hFPGA, "SYNC");
% data_nbitsReceived = readPort(hFPGA, "nbitsReceived");
% data_nbitsErrored = readPort(hFPGA, "nbitsErrored");

%% DVBS2 Stream Interface
% data_DVBS2StreamRead0 = readPort(hFPGA, "data_DVBS2StreamRead0");

%% Release hardware resources
release(hFPGA);

