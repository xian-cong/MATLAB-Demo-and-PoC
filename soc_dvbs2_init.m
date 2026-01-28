%% Initialization script for the DVBS2 RFSoC example.
% This script generates the model initialization parameters and transmitter
% waveform required to run the soc_dvbs2_top model.

%   Copyright 2023-2024 The MathWorks, Inc.

whdlexamples.hdlawgn_init; %initiate AWGN subsystem 
% Generate the transmitter LUT data for all the MODCOD values to load into 
% the Simulink transmitter  
for MODCOD = [1:10 12:16 18:22 24:27]

    %Simulink tramsnitter loaded with Short FEC frames.
    %To support of Normal FEC frames required to be change Tranmsitter LUTs
    %in the Simulink model
    FECFrame            = 1; % 0: Normal and 1:Short, 
    
    % Receiver Model run with below sample rate.
    % Corresponding changes required to run at different sampling rates  
    Rsym                = 4e6; % Symbol rate

    % Fixed transmitter configuration
    hasPilot            = 1 * ones(size(MODCOD));
    
    %StreamFormat TS/GS
    StreamFormat        = 'GS';
    %supported user packet length always less than 8 to DFL-10
    UPL                 = 1504; %%9 to 2980, to accomidate min/max DFL
    % Generate Tx Waveform

    % UPL for TS packet is 1504
    if strcmpi(StreamFormat,'TS')
        UPL             = 1504; 
    end
       
    if ~(isequal(size(MODCOD),size(FECFrame)) && (size(MODCOD,1) == 1))
        error('MODCOD,FECFrame must be row vectors of same length')
    end
    validateattributes(Rsym,{'double'},{'scalar','positive','integer','>=',1e6,'<=',50e6},'','symbol rate');
    DFL                 = getMaxDFL(MODCOD,FECFrame);

    getdvbs2LDPCParityMatrices;
    addpath s2xLDPCParityMatrices;

    s2Config            = dvbs2hdlRxParameters;
    txobj               = soc_dvbs2_TxGeneration(...
        'StreamFormat'        ,StreamFormat,...
        'NumInputStreams'     ,s2Config.NumInputStreams,...
        'RolloffFactor'       ,s2Config.RolloffFactor,...
        'FilterSpanInSymbols' ,s2Config.FilterSpanInSymbols,...
        'SamplesPerSymbol'    ,s2Config.SamplesPerSymbol);
    if strcmpi(StreamFormat,'GS')
        set(txobj,struct('UPL',UPL));
        [frameBits,pktsSent,syncWord]          = generateUserPkts(StreamFormat,DFL,UPL);
    else
        [frameBits,pktsSent,syncWord]          = generateUserPkts(StreamFormat,DFL);
    end

    txFiltCoeff = txobj.pTxFilterCoeff;
    if FECFrame == 0
        FECFrameStr     = "normal";
    else
        FECFrameStr     = "short";
    end
    set(txobj,struct('MODCOD',MODCOD, ...
        'FECFrame',FECFrameStr, ...
        'DFL',DFL, ...
        'HasPilots',hasPilot));
    txDataOut       = txobj(frameBits(:));
    eval(['txDataOutS' num2str(MODCOD) '     = txDataOut;'])
    rmpath s2xLDPCParityMatrices;
    fs                  = Rsym *32; %DUT sample rate

end
load soc_dvbs2_txPacketBits soc_dvbs2_txPacketBits;
%%
function [bitsInFrames,nPkts,syncWord] = generateUserPkts(StreamFormat,DFL,varargin)
% This function generates TS or GS packets for all frames
   if strcmpi(StreamFormat,'TS')
       UPL      = 188*8;
       syncWord = [0;1;0;0;0;1;1;1];  % 47 HEX
   else
       UPL = varargin{1};
       if UPL ~= 0 
           syncWord = (dec2bin(hex2dec('AC')) - '0').';
       end
   end
   packetsInFrames       = fix(DFL/UPL);
   load soc_dvbs2_txPacketBits soc_dvbs2_txPacketBits;
   bitsInFrames    = [repmat(syncWord,1,packetsInFrames);repmat(soc_dvbs2_txPacketBits(1:UPL-8),1,packetsInFrames)];
   nPkts = sum(packetsInFrames);
end

function DFL = getMaxDFL(MODCOD,FECFrame)
%    if ~(isequal(size(MODCOD),size(FECFrame)) && (size(MODCOD,1) == 1))
%        error('MODCOD,FECFrame must be row vectors of same length')
%    end
   Kbch = zeros(size(MODCOD));
   for i = 1:length(MODCOD)
       if FECFrame(i)
           if any(MODCOD(i) == [11 17 23 28])
               error(['MODCOD = ' num2str(MODCOD(i)) ' is not supported for FECFrame = 1 (short)']);
           end
           [~,R,cwLen] = satcom.internal.dvbs.getS2PHYParams(MODCOD(i),'short');
       else
           [~,R,cwLen] = satcom.internal.dvbs.getS2PHYParams(MODCOD(i),'normal');
       end
       [~,Kbch(i)] = satcom.internal.dvbs.getBCHParams(cwLen,R);
   end
   DFL = Kbch - 80;
end

%% getdvbs2LDPCParityMatrices
% This functions checks for the existence of the LDPC Matrices and
% downloads them if they doesn't exist

function getdvbs2LDPCParityMatrices()
    if ~exist('s2xLDPCParityMatrices/dvbs2xLDPCParityMatrices.mat','file')
        if ~exist('s2xLDPCParityMatrices.zip','file')
            url = 'https://ssd.mathworks.com/supportfiles/spc/satcom/DVB/s2xLDPCParityMatrices.zip';
            websave('s2xLDPCParityMatrices.zip',url);
            unzip('s2xLDPCParityMatrices.zip');
        end
    end
end