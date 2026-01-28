%% dvbs2hdlParameters
% This function generates parameters required for
% dvbs2hdlSyncPLHeaderRecoveryCore model reference initialization.

%   Copyright 2021 The MathWorks, Inc.

function s2Sync = dvbs2hdlRxParameters()
    
    % constants
    s2Sync.NumInputStreams     = 1;
    s2Sync.RolloffFactor       = 0.35;
    s2Sync.FilterSpanInSymbols = 10;
    s2Sync.SamplesPerSymbol    = 4;
    s2Sync.SOFLength           = 26;
    s2Sync.PLSCLength          = 64;
    
    % Matched Filter Impulse Response
    s2Sync.RRCImpulseResponse  = rcosdesign(s2Sync.RolloffFactor,...
                                             s2Sync.FilterSpanInSymbols,...
                                             s2Sync.SamplesPerSymbol);
                                         
    % Frame Synchronizer Parameters
    thresholddB               = -2;
    FECLenFS                  = 64800; 
    MODCODFS                  = 24;
    HasPilotFS                = true;
    plheaderFS                = satcom.internal.dvbs.plHeader('s2',MODCODFS, HasPilotFS, FECLenFS);
    maxCorrValue              = 25+32; % SOF peak + PLSC peak
    ScaleFac                  = 1/maxCorrValue;
    s2Sync.refSOF                = ScaleFac*conj(flip(plheaderFS(1:25).*conj(plheaderFS(2:26)))).';
    temp                      = plheaderFS(27:89).*conj(plheaderFS(28:90));
    temp(2:2:end)             = 0;
    s2Sync.refPLSC               = ScaleFac*conj(flip(temp).');
    s2Sync.Threshold             = fi(10^(thresholddB/10),0,16);
    s2Sync.refSOFE               = sum(abs(s2Sync.refSOF).^2);
    s2Sync.refPLSCE              = sum(abs(s2Sync.refPLSC).^2);
    
    % Symbol Synchronizer Parameters
    SSNormalizedLoopBandwidth    = 8e-3;
    SSdoo                        = 1/sqrt(2);
    SSth                         = SSNormalizedLoopBandwidth/(SSdoo + 0.25/SSdoo);
    SSd                          = 1+2*SSdoo*SSth+SSth^2;
    SSKp                         = 4*sin(pi*s2Sync.RolloffFactor/2)/(1-(s2Sync.RolloffFactor^2)/4);
    SSK0                         = -1;
    SSLoopFilterPropGain         = 4*SSdoo*(SSth/SSd)*(1/(SSKp*SSK0));
    SSLoopFilterIntegGain        = 4*(SSth^2/SSd)*(1/(SSKp*SSK0));
    s2Sync.SSKp                     = SSKp;
    s2Sync.SSK0                     = SSK0;
    s2Sync.SSLoopFilterPropGain     = SSLoopFilterPropGain;
    s2Sync.SSLoopFilterIntegGain    = SSLoopFilterIntegGain;
    
    % Pilot Constants
    s2Sync.PilotBlkFreq             = 16; % in Slots
    s2Sync.SlotLength               = 90;
    s2Sync.nPilot                   = 36;
    s2Sync.Pilot                    = (1+1i)/sqrt(2);
    s2Sync.PilotMinIdx              = s2Sync.PilotBlkFreq * s2Sync.SlotLength;
    s2Sync.PilotMaxIdx              = s2Sync.PilotBlkFreq * s2Sync.SlotLength + s2Sync.nPilot - 1;
    
    % Coarse Frequency Compensator Parameters
    CFCNormalizedLoopBandwidth   = 1e-4;
    s2Sync.CFCLoopFilterIntegGain   = 4*CFCNormalizedLoopBandwidth;

    % Fine Frequency Compensator Parameters
    s2Sync.FFCAveragingLength = 512;

    % Fine Phase Compensator Parameters
    FPCNormalizedLoopBandwidth   = 20e-6;
    s2Sync.FPCLoopFilterIntegGain   = 4*4*FPCNormalizedLoopBandwidth/(2*(1+2*FPCNormalizedLoopBandwidth));
    
    % PLSC descrambling sequence LUT Constants
    PLSCScramSeq                 = '0111000110011101100000111100100101010011010000100010110111111010';
    s2Sync.PLSCDescramLUT           = fi(1 - 2*(PLSCScramSeq - '0').',1,2,0);
    
    % ML Decoding Constants
    genMat                       = [0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1; ...
                                    0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1; ...
                                    0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1; ...
                                    0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1; ...
                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1; ...
                                    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
    allMsgs                      = dec2bin(0:2^6-1) - '0';
    MLallCodeWords               = logical(mod(allMsgs*genMat,2));
    s2Sync.intColAllCodeWords1to32  = uint32(sum(MLallCodeWords( 1:32,:).*2.^(31:-1:0).'));
    s2Sync.intColAllCodeWords33to64 = uint32(sum(MLallCodeWords(33:64,:).*2.^(31:-1:0).'));

    % s2x has one more row in the genMat. It takes the place of 1st row and
    % the existing rows of genMat starts from 2nd to 7th. For this, the
    % allMsgs is of length 2^7 with each message having 7 bits.
    % In the HDLImpl, the new 2^6 codewords are derived from existing code
    % words by using the new row of genMat as a mask and exor the mask with
    % existing code words.
    genMatNewRow = [1 0 0 1 0 0 0 0 1 0 1 0 1 1 0 0 0 0 1 0 1 1 0 1 1 1 0 1 1 1 0 1];
    s2Sync.s2xGenMatRowMask = fi(genMatNewRow(:),0,1,0);
    
end
  
  
  
  