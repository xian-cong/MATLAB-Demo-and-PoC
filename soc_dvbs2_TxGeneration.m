classdef soc_dvbs2_TxGeneration < dvbs2WaveformGenerator

%soc_dvbs2_TxGeneration DVB-S2 waveform generator
%This script generates a transmitter waveform for the soc_dvbs2_top model. 
    
    %   Copyright 2023 The MathWorks, Inc.
    
    % Pre-computed constants
    properties(Access = private)
        % Modulation order
        pModOrder
        % LDPC code rate (numeric)
        pCodeRate
        % FEC frame length
        pFECFrameLen
        % Number of pilot blocks
        pNumPilotBlks
        % Physical layer (PL) frame length
        pPLFrameLen
        % Baseband header
        pBBHeader
        % Physical layer header
        pPLHeader
        % BCH encoding parameters (code rate, message length, codeword length)
        pBCHParams
        % Interleaver indices
        pInterleaveInd
        % Sync bits in TS/GS packet
        pSyncBits
        % LDPC code identifier (char)
        pCodeIdentifier
    end

    % Pre-computed constants
    properties(Access = private, Nontunable)
        % Physical layer complex scrambling sequence
        pPLScramSeq
        % Transmit filter object(RRC)
        pTxFilter
        % Filter gain
        pGain
    end
    
    properties(SetAccess = private, GetAccess = public)
        pTxFilterCoeff
    end

    methods
        function obj = soc_dvbs2_TxGeneration(varargin)
            % Support name-value pair arguments when constructing object
            fecType = satcom.internal.parseProp('FECFrame', "normal", varargin{:});
            modcod = satcom.internal.parseProp('MODCOD', 1, varargin{:});
            dfl =  satcom.internal.parseProp('DFL', 15928, varargin{:});
            hasPilots = satcom.internal.parseProp('HasPilots', false, varargin{:});

            setProperties(obj, nargin+8, 'FECFrame', fecType, ...
                'MODCOD', modcod, ...
                'DFL', dfl, ...
                'HasPilots',  hasPilots, ...
                varargin{:})
        end
        function coeff = get.pTxFilterCoeff(obj)
            b = rcosdesign(double(obj.RolloffFactor), double(obj.FilterSpanInSymbols), ...
                double(obj.SamplesPerSymbol));
            coeff = b;
        end
    end

    methods(Access = protected)
        function setupImpl(obj, data)
            % Perform one-time calculations, such as computing constants
            setupImpl@satcom.internal.dvbs.s2Base(obj)
            if iscell(data)
                dataCell = data;
            else
                dataCell = {data};
            end
            % Sync Field calculation
            syncFieldLen = 8;
            obj.pSyncBits = zeros(syncFieldLen, obj.NumInputStreams);
            if strcmpi(obj.StreamFormat, 'TS')
                % Sync byte 47 HEX
                obj.pSyncBits = repmat([0 1 0 0 0 1 1 1]',1, obj.NumInputStreams);
            elseif strcmpi(obj.StreamFormat, 'GS') && ~any(obj.UPL == 0)
                for k = 1:obj.NumInputStreams
                    obj.pSyncBits(:,k) = dataCell{k}(1:syncFieldLen);
                end
            end
            calculateProcessingParams(obj)
            % PL scrambling sequence generation
            plScrambIntSeq = satcom.internal.dvbs.plScramblingIntegerSequence(coder.const(0));
            cMap = [1 1j -1 -1j].';
            obj.pPLScramSeq = cMap(plScrambIntSeq+1);
            % RRC transmit filter initialization
            obj.pTxFilter = comm.RaisedCosineTransmitFilter( ...
                'RolloffFactor', obj.RolloffFactor, ...
                'FilterSpanInSymbols', double(obj.FilterSpanInSymbols), ...
                'OutputSamplesPerSymbol', double(obj.SamplesPerSymbol));
            b = rcosdesign(double(obj.RolloffFactor), double(obj.FilterSpanInSymbols), ...
                double(obj.SamplesPerSymbol));
            % |H(f)| = 1  for |f| < fN(1-alpha) - Section 5.6
            obj.pGain =  1/sum(b);
            obj.pTxFilterCoeff = b;
        end

        function txWaveform = stepImpl(obj, data)
            if iscell(data)
                dataCell = data;
            else
                dataCell = {data};
            end
            numStreams = obj.NumInputStreams;
            pktLen = obj.pPktLen;
            plFrameLen = obj.pPLFrameLen;
            cwLen = obj.pFECFrameLen;
            modOrder = obj.pModOrder;
            crStr      =  obj.pCodeIdentifier;
            % Pilot block length is 36 symbols
            numPilots = obj.pNumPilotBlks*36;
            % PL header length is 90 symbols
            plDataFrameLen = obj.pPLFrameLen-90;
            hasPilots = scalarExpand(obj.HasPilots, obj.NumInputStreams);
            [numPktsPerStream, bbFrameLen] = deal(zeros(numStreams, 1));
            pilotIndices = coder.nullcopy(cell(numStreams, 1));
            dataIndices      = coder.nullcopy(cell(numStreams, 1));
            plDataFrame      = coder.nullcopy(cell(numStreams, 1));
            for k = 1:numStreams
                dataLen = length(dataCell{k});
                if strcmpi(obj.StreamFormat, 'TS') || obj.pIsGSPkt
                    numPktsPerStream(k) = floor(dataLen/pktLen(k));
                end
                bbFrameLen(k) = obj.pBCHParams(k,3);
                [num, den] = rat(obj.pCodeRate(k));
                crStr{k} = [sprintf('%0.0f',num) '/' sprintf('%0.0f',den)];
                if hasPilots(k)
                    pilotIndices{k} = obj.pPilotInd(1:numPilots(k));
                    seq = (1:plDataFrameLen(k))';
                    seq(pilotIndices{k}) = [];
                    dataIndices{k} = seq;
                end
                plDataFrame{k} = complex(zeros(plDataFrameLen(k), 1));
            end
            unitPower = strcmpi(obj.ScalingMethod, 'Unit average power');

            % Computing CRC for packetized input streams
            crcOut = dataCell;
            if strcmpi(obj.StreamFormat, 'TS') || obj.pIsGSPkt
                for k = 1:numStreams
                    for i = 1:numPktsPerStream(k)
                        userPkt = dataCell{k}((i-1)*pktLen(k)+9:i*pktLen(k));
                        encOut = satcom.internal.dvbs.crcGenerate(userPkt);
                        crcOut{k}((i-1)*pktLen(k)+1:i*pktLen(k)) = encOut;
                    end
                end
            end
            % Data field length calculation
            numFramesPerStream = zeros(numStreams, 1);
            if any(pktLen == 0)
                DFLen = scalarExpand(obj.DFL, numStreams);
                for k = 1:numStreams
                    numFramesPerStream(k) = length(crcOut{k})/DFLen(k);
                end
                rawDFLength = DFLen(:);
            else
                for k = 1:numStreams
                    numFramesPerStream(k) = numPktsPerStream(k)/obj.MinNumPackets(k);
                end
                rawDFLength = pktLen.*obj.MinNumPackets(:);
            end
            txFrames = complex(zeros(sum(numFramesPerStream.*plFrameLen),1));
            outEndIdx = 0;
            % Merger indices generation. Supports only round-robin merging
            [streamInd, frameInd] = satcom.internal.dvbs.getMergerIndices( ...
                numStreams, numFramesPerStream);
            totFrames = length(streamInd);
            for m = 1:totFrames
                k = streamInd(m);
                outStIdx = outEndIdx+1;
                outEndIdx = outEndIdx+plFrameLen(k);
                % BB Frame generation
                % DFL generation
                dataField = cast(crcOut{k}((frameInd(m)-1)*rawDFLength(k)+1:frameInd(m)*rawDFLength(k)), 'int8');
                tmpOut = [obj.pBBHeader(:,k);dataField;zeros(bbFrameLen(k)-rawDFLength(k)-80,1,'int8')];
                bbFrame = cast(xor(tmpOut, obj.pBBScrambleSeq(1:bbFrameLen(k))), 'int8');
                % PL Frame generation
                % BCH encoding
                bchOut = satcom.internal.dvbs.bchEncode(bbFrame, bbFrameLen(k), cwLen(k));
                % LDPC encoding
                ldpcOut = satcom.internal.dvbs.ldpcEncode(bchOut, crStr{k}, cwLen(k));
                % Bit interleaving
                fecFrame = ldpcOut(obj.pInterleaveInd{k});
                % Symbol mapping
                xFecFrame = satcom.internal.dvbs.mapper(fecFrame, modOrder(k), ...
                    crStr{k}, cwLen(k), unitPower);
                if hasPilots(k)
                    plDataFrame{k}(pilotIndices{k}) = repmat(obj.pPilotSeq, obj.pNumPilotBlks(k), 1);
                    plDataFrame{k}(dataIndices{k}) = xFecFrame;
                else
                    plDataFrame{k} = xFecFrame;
                end
                plDataFrame{k} = plDataFrame{k}.*obj.pPLScramSeq(1:length(plDataFrame{k}));
                txFrames(outStIdx:outEndIdx) = [obj.pPLHeader(:,k);plDataFrame{k}];
            end
            % No Transmit pulse shaping
            txWaveform = txFrames;
        end
    end

    methods(Access = private)
        function calculateProcessingParams(obj)
            numStreams = obj.NumInputStreams;
            [obj.pModOrder, obj.pFECFrameLen, ...
                obj.pNumPilotBlks, obj.pCodeRate] = deal(zeros(numStreams, 1));
            modCod = scalarExpand(obj.MODCOD, obj.NumInputStreams);
            for k = 1:numStreams
                [obj.pModOrder(k), obj.pCodeRate(k), obj.pFECFrameLen(k)] = ...
                    satcom.internal.dvbs.getS2PHYParams(modCod(k),obj.FECFrame);
            end
            bps = log2(obj.pModOrder);
            xFECFrameLen = obj.pFECFrameLen./bps;
            hasPilots = scalarExpand(obj.HasPilots, obj.NumInputStreams);
            for k = 1:numStreams
                if hasPilots(k)
                    % XFECFrame is divided into slots of 90 symbols each.
                    numSlots = xFECFrameLen(k)/90;
                    % Pilot block of length 36 symbols is repeated every 16 slots.
                    obj.pNumPilotBlks(k) = floor(numSlots/16);
                    % Pilots shouldn't coincide with next PL Header
                    if floor(numSlots/16) == numSlots/16
                        obj.pNumPilotBlks(k) = obj.pNumPilotBlks(k)-1;
                    end
                end
            end
            isVCM = numStreams > 1 && numel(obj.MODCOD) > 1 && ...
                length(obj.MODCOD) == length(unique(obj.MODCOD(:)));
            bbHeaderLen = 80;
            plHeaderLen = 90;
            obj.pPLFrameLen = plHeaderLen + xFECFrameLen + obj.pNumPilotBlks*36;
            DFLen = scalarExpand(obj.DFL, obj.NumInputStreams);
            % BBHeader generation and PLHeader generation
            obj.pBBHeader = zeros(bbHeaderLen, numStreams, 'int8');
            obj.pPLHeader = complex(zeros(plHeaderLen, numStreams));
            isSIS = obj.NumInputStreams == 1;
            if strcmpi(obj.StreamFormat, 'TS')
                inputFormat = 0;
            elseif strcmpi(obj.StreamFormat, 'GS') && ~any(obj.UPL == 0)
                inputFormat = 1;
            else
                inputFormat = 2;
            end
            for k = 1:numStreams
                % inputFormat, pktLen, dfLen, isSIS, isVCM, rollOffFac, ISSYI, syncBits, streamIdx
                obj.pBBHeader(:,k) =  satcom.internal.dvbs.bbHeader(inputFormat, ...
                    obj.pPktLen(k), DFLen(k), isSIS, isVCM, obj.RolloffFactor, ...
                    obj.ISSYI, obj.pSyncBits(:,k), k-1);
                obj.pPLHeader(:,k) = satcom.internal.dvbs.plHeader(coder.const('s2'), ...
                    modCod(k), hasPilots(k), obj.pFECFrameLen(k));
            end
            obj.pBCHParams = zeros(numStreams, 3);
            for k = 1:numStreams
                obj.pBCHParams(k,1) = obj.pCodeRate(k);
                [obj.pBCHParams(k,2), obj.pBCHParams(k,3)] = ...
                    satcom.internal.dvbs.getBCHParams(obj.pFECFrameLen(k), obj.pCodeRate(k));
            end
            obj.pInterleaveInd = coder.nullcopy(cell(numStreams, 1));
            obj.pCodeIdentifier  = coder.nullcopy(cell(numStreams, 1));
            for k = 1:numStreams
                [n, d] = rat(obj.pCodeRate(k));
                obj.pCodeIdentifier{k} = [sprintf('%0.0f',n) '/' sprintf('%0.0f',d)];
                obj.pInterleaveInd{k} = satcom.internal.dvbs.interleaverIndices( ...
                    obj.pFECFrameLen(k), obj.pCodeIdentifier{k}, obj.pModOrder(k));
            end
        end
    end
end

% Scalar expansion
function y = scalarExpand(x,cnt)

if isscalar(x) && cnt > 1
    y = double(x(1)).*ones(cnt,1);
else
    y = double(x(:));
end

end