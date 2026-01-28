% This script was automatically generated on 27-Oct-2025 17:44:05, during
% SoC Blockset design generation

% Generated design information:
%	Target platform: XilinxZynqUltraScale_RFSoCZCU111EvaluationKit
%	Generated bitstream: C:\demo\DVBS2ReceiverSoCExample\soc_prj\soc_dvbs2_top-XilinxZynqUltraScale_RFSoCZCU111EvaluationKit.bit

% NOTE: You must program the FPGA with the generated bitstream file
% before running this script

% Copyright 2025 The MathWorks, Inc.

%% Load saved AXI manager info
% This file contains information used by this script
% Available structs in this file: s2mm_dma, dvbs2_ip, memRegions
load('C:\demo\DVBS2ReceiverSoCExample\soc_prj\soc_dvbs2_top_XilinxZynqUltraScale_RFSoCZCU111EvaluationKit_aximanager.mat');

% Create hardware object
hwObj = socHardwareBoard('Xilinx Zynq UltraScale+ RFSoC ZCU111 Evaluation Kit','Connect',false);

%% Create socAXIManager object

AXIManagerObj = socAXIManager(hwObj);

%% User settings

% Initialize memory contents

%% Initialize built-in IP core(s) 

% Create IP core object for DMA core
s2mm_dmaCoreObj=socIPCore(AXIManagerObj, s2mm_dma,'DMA');
% Initialize DMA core
initialize(s2mm_dmaCoreObj,'memoryRegion',memRegions);

%% Initialize user IP core(s)

init_dvbs2_ip(AXIManagerObj, dvbs2_ip);

%% Run testbench

% Adjust 'NumRuns' variable to change the number of consecutive runs of the testbench
NumRuns = 1;
for n = 1:NumRuns
    % Insert testbench stimulus here ...
end

%% Release AXI Manager object

AXIManagerObj.release;

%%
% -------------------------------------------------------------------------------
%
% SUPPORT FUNCTIONS
%
% -------------------------------------------------------------------------------
%%

function init_dvbs2_ip(AXIManagerObj, dvbs2_ip)

%% Register space for dvbs2_ip IP core.
writememory(AXIManagerObj,dvbs2_ip.IPCore_Reset, uint32(1)); % Reset IP core

% Default values for AXI4_Stream_0_Master interface -- dvbs2_ip
% The TLAST output signal of the interface is generated based on the packet size.
writememory(AXIManagerObj,dvbs2_ip.AXI4_Stream_0_Master_PacketSize, uint32(dvbs2_ip.packetSize));

% AXI4-Lite Memory-Mapped register access
% AXI4-Lite register write (Default value from Register Channel)
writememory(AXIManagerObj,dvbs2_ip.adc_dac_loopback, uint32(0));
% AXI4-Lite register write (Default value from Register Channel)
writememory(AXIManagerObj,dvbs2_ip.enbNoise, uint32(0));
% AXI4-Lite register write (Default value from Register Channel)
writememory(AXIManagerObj,dvbs2_ip.snrdB, uint32(0));
% AXI4-Lite register write (Default value from Register Channel)
writememory(AXIManagerObj,dvbs2_ip.CFO, uint32(0));
% AXI4-Lite register write (Default value from Register Channel)
writememory(AXIManagerObj,dvbs2_ip.CPO, uint32(0));
% AXI4-Lite register write (Default value from Register Channel)
writememory(AXIManagerObj,dvbs2_ip.modcodIdx, uint32(0));
% AXI4-Lite register write (Default value from Register Channel)
writememory(AXIManagerObj,dvbs2_ip.resetFCPO, uint32(0));
% AXI4-Lite register write (Default value from Register Channel)
writememory(AXIManagerObj,dvbs2_ip.resetDisplay, uint32(0));
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.nframesSynced, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.decodedModcod, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.decodedFecFrame, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.FreqEst, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.TSorGS, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.UPL, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.DFL, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.SYNC, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.nbitsReceived, 1);
% AXI4-Lite register read
readmemory(AXIManagerObj,dvbs2_ip.nbitsErrored, 1);
end
