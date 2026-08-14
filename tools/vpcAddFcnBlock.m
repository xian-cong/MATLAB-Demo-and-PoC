function vpcAddFcnBlock(sysPath, inNames, outNames, codeLines, paramNames)
%VPCADDFCNBLOCK Populate an existing subsystem with a MATLAB Function block.
%
%   VPCADDFCNBLOCK(sysPath, inNames, outNames, codeLines, paramNames) adds Inport
%   blocks named inNames, a MATLAB Function block carrying codeLines, and Outport
%   blocks named outNames, then wires them together.
%
%   codeLines is a cellstr of source lines (joined with newlines) whose function
%   signature must use exactly inNames as arguments and outNames as returns - the
%   block derives its ports from the signature, so a mismatch shows up as a wiring
%   error rather than silently misconnecting.
%
%   paramNames lists model-workspace variables the code reads directly. Each is
%   declared as Stateflow parameter data so the generated code takes it as a
%   tunable parameter instead of inlining a constant.

fcnBlk = [sysPath '/fcn'];
add_block('simulink/User-Defined Functions/MATLAB Function', fcnBlk, ...
          'Position',[180 40 300 40+30*max(numel(inNames),numel(outNames))]);

% Install the body BEFORE wiring: the block's ports come from the signature.
chart = vpcFindEMChart(fcnBlk);
chart.Script = strjoin(codeLines, newline);

% Declare model-workspace variables the body reads as tunable parameter data.
for k = 1:numel(paramNames)
    d = Stateflow.Data(chart);
    d.Name  = paramNames{k};
    d.Scope = 'Parameter';
end

for k = 1:numel(inNames)
    add_block('simulink/Sources/In1',[sysPath '/' inNames{k}], ...
              'Port',num2str(k),'Position',[40 40+50*(k-1) 70 60+50*(k-1)]);
    add_line(sysPath,[inNames{k} '/1'],sprintf('fcn/%d',k));
end
for k = 1:numel(outNames)
    add_block('simulink/Sinks/Out1',[sysPath '/' outNames{k}], ...
              'Port',num2str(k),'Position',[380 40+50*(k-1) 410 60+50*(k-1)]);
    add_line(sysPath,sprintf('fcn/%d',k),[outNames{k} '/1']);
end
end
