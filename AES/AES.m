classdef AES < matlab.System ...
        & coder.ExternalDependency ...
        & matlabshared.sensors.simulink.internal.BlockSampleTime

    % AES encryption/decryption driver for TI C2000 DSP
    %#codegen
    %#ok<*EMCA>

    properties

    end

    properties(Access = protected)
        Logo = 'IO Device Builder';
    end

    properties (Nontunable)
        base(:,:) {mustBeData(base,'uint32'),mustBeSize(base,[1,1])} = uint32(0);
        keySize(:,:) {mustBeData(keySize,'uint8'),mustBeSize(keySize,[1,1])} = uint8(1);
        direction(:,:) {mustBeData(direction,'uint8'),mustBeSize(direction,[1,1])} = uint8(0);
        opMode(:,:) {mustBeData(opMode,'uint8'),mustBeSize(opMode,[1,1])} = uint8(0);
        dataLength(:,:) {mustBeData(dataLength,'uint32'),mustBeSize(dataLength,[1,1])} = uint32(16);
    end

    properties (Access = private)


    end

    methods
        % Constructor
        function obj = AES(varargin)
            setProperties(obj,nargin,varargin{:});
        end
    end

    methods (Access=protected)
        function setupImpl(obj)
            if coder.target('RtwForRapid')
                % Rapid Accelerator. In this mode, coder.target('Rtw')
                % returns true as well, so it is important to check for
                % 'RtwForRapid' before checking for 'Rtw'

                %pass
            elseif ~coder.target('MATLAB')
                coder.cinclude('AES.h');
                coder.ceval('setupFunctionAES', (obj.base),1, (obj.keySize),1, (obj.direction),1, (obj.opMode),1, (obj.dataLength),1);
            end
        end

        function validateInputsImpl(obj,varargin)
            %  Check the input size
            if nargin ~=0

                validateattributes(varargin{1},{'uint32'},{'2d','size',[4,1]},'','srcArray');
                validateattributes(varargin{2},{'uint32'},{'2d','size',[8,1]},'','key1');
                validateattributes(varargin{3},{'uint32'},{'2d','size',[8,1]},'','key2');
                validateattributes(varargin{4},{'uint32'},{'2d','size',[4,1]},'','iniVector');
                validateattributes(varargin{5},{'uint32'},{'2d','size',[4,1]},'','authDataArray');
                validateattributes(varargin{6},{'uint32'},{'2d','size',[1,1]},'','authDataLength');

            end
        end

        function [destArray,tagArray,iniVector,status] =  stepImpl(obj ,srcArray,key1,key2,iniVector,authDataArray,authDataLength)
            destArray = uint32(zeros(4,1));
            tagArray = uint32(zeros(4,1));
            iniVector = uint32(zeros(4,1));
            status = uint8(zeros(1,1));
            if isempty(coder.target)
            elseif coder.target('RtwForRapid')
                % Rapid Accelerator. In this mode, coder.target('Rtw')
                % returns true as well, so it is important to check for
                % 'RtwForRapid' before checking for 'Rtw'

                %pass
            else
                coder.ceval('stepFunctionAES',coder.ref(destArray),4,coder.ref(tagArray),4,coder.ref(iniVector),4,coder.ref(status),1, srcArray,4, key1,8, key2,8, iniVector,4, authDataArray,4, authDataLength,1);
            end
        end

        function releaseImpl(obj)
            if isempty(coder.target)
            elseif coder.target('RtwForRapid')
                % Rapid Accelerator. In this mode, coder.target('Rtw')
                % returns true as well, so it is important to check for
                % 'RtwForRapid' before checking for 'Rtw'

                %pass
            else

            end
        end
    end

    methods (Access=protected)
        %% Define output properties
        function num = getNumInputsImpl(~)
            num = 6;
        end

        function num = getNumOutputsImpl(~)
            num = 4;
        end

        function varargout = getInputNamesImpl(obj)
            varargout{1} = 'srcArray';
            varargout{2} = 'key1';
            varargout{3} = 'key2';
            varargout{4} = 'iniVector';
            varargout{5} = 'authDataArray';
            varargout{6} = 'authDataLength';

        end

        function varargout = getOutputNamesImpl(obj)
            varargout{1} = 'destArray';
            varargout{2} = 'tagArray';
            varargout{3} = 'iniVector';
            varargout{4} = 'status';
        end

        function flag = isOutputSizeLockedImpl(~,~)
            flag = true;
        end

        function varargout = isOutputFixedSizeImpl(~,~)
            varargout{1} = true;
            varargout{2} = true;
            varargout{3} = true;
            varargout{4} = true;
        end

        function varargout = isOutputComplexImpl(~)
            varargout{1} = false;
            varargout{2} = false;
            varargout{3} = false;
            varargout{4} = false;
        end

        function varargout = getOutputSizeImpl(~)
            varargout{1} = [4,1];
            varargout{2} = [4,1];
            varargout{3} = [4,1];
            varargout{4} = [1,1];
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'uint32';
            varargout{2} = 'uint32';
            varargout{3} = 'uint32';
            varargout{4} = 'uint8';
        end

        function maskDisplayCmds = getMaskDisplayImpl(obj)
            outport_label = [];
            num = getNumOutputsImpl(obj);
            if num > 0
                outputs = cell(1,num);
                [outputs{1:num}] = getOutputNamesImpl(obj);
                for i = 1:num
                    outport_label = [outport_label 'port_label(''output'',' num2str(i) ',''' outputs{i} ''');' ]; %#ok<AGROW>
                end
            end
            inport_label = [];
            num = getNumInputsImpl(obj);
            if num > 0
                inputs = cell(1,num);
                [inputs{1:num}] = getInputNamesImpl(obj);
                for i = 1:num
                    inport_label = [inport_label 'port_label(''input'',' num2str(i) ',''' inputs{i} ''');' ]; %#ok<AGROW>
                end
            end
            icon = 'AES';
            maskDisplayCmds = [ ...
                ['color(''white'');',...
                'plot([100,100,100,100]*1,[100,100,100,100]*1);',...
                'plot([100,100,100,100]*0,[100,100,100,100]*0);',...
                'color(''blue'');', ...
                ['text(38, 92, ','''',obj.Logo,'''',',''horizontalAlignment'', ''right'');',newline],...
                'color(''black'');'], ...
                ['text(52,50,' [''' ' icon ''',''horizontalAlignment'',''center'');' newline]]   ...
                inport_label ...
                outport_label
                ];
        end

        function sts = getSampleTimeImpl(obj)
            sts = getSampleTimeImpl@matlabshared.sensors.simulink.internal.BlockSampleTime(obj);
        end
    end

    methods (Static, Access=protected)
        function simMode = getSimulateUsingImpl(~)
            simMode = 'Interpreted execution';
        end

        function isVisible = showSimulateUsingImpl
            isVisible = false;
        end
    end

    methods (Static)
        function name = getDescriptiveName(~)
            name = 'AES';
        end

        function tf = isSupportedContext(~)
            tf = true;
        end

        function updateBuildInfo(buildInfo, context)
            coder.extrinsic('codertarget.targethardware.getTargetHardware');
            isRaccelBuild = strcmp(context.getConfigProp('SystemTargetFile'), 'raccel.tlc');
            if ~isRaccelBuild
                hCS = coder.const(getActiveConfigSet(bdroot));
                targetInfo = coder.const(codertarget.targethardware.getTargetHardware(hCS));

                % Added this env variable to fetch the comm libraries required only for Arduino target.
                % The env variable is cleared at the end of
                % "GenerateWrapperMakefile.m" file.
                if contains(targetInfo.TargetName,'arduinotarget')
                    setenv('Arduino_ML_Codegen_I2C', 'Y');
                end

                filename = mfilename('fullpath');
                [filepath,~,~] = fileparts(filename);

                DriverFiles = {'aes.c',};
                DriverFilesFolder = 'Dependencies';
                SystemObjFiles = {'AES.c'};




                buildInfo.addSourceFiles(SystemObjFiles,filepath);
                buildInfo.addSourceFiles(DriverFiles,fullfile(filepath,DriverFilesFolder));
                buildInfo.addIncludePaths(filepath);
                buildInfo.addIncludePaths(fullfile(filepath,DriverFilesFolder));
            end
        end
    end
end

function mustBeData(a,dataType)
% As the 'isa' function doesnot support boolean datatype, change to 'logical' %
if isequal(dataType,'boolean')
    dataType = 'logical';
end

if ~(isa(a,dataType))
    error("Value must of type %s.",dataType);
end
end

function mustBeSize(value, expectedSize)
% Get the actual size of the input
actualSize = size(value);

% Check if the actual size matches the expected size
if ~isequal(actualSize, expectedSize)
    error(message('devicedriverapp_resources:messages:ParameterSizeValidation',num2str(expectedSize), num2str(actualSize)).getString);
end
end

function value = getValueFromTypeName(typeName)
keys = {'double', 'single','uint8', 'uint16', 'uint32', 'uint64', ...
    'int8', 'int16', 'int32', 'int64'};
values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

% Find the index of the type name
index = find(strcmp(keys, typeName));

if isempty(index)
    value = -1;
else
    value = values(index);
end
end


