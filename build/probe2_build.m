% probe2_build.m
% Build THREE candidate models to find which variant-control strategy survives
% packaging by MATLAB Compiler / Simulink Compiler.
%
%   probe_A : model-workspace Simulink.Parameter (ExportedGlobal) + activation 'startup'
%   probe_B : model-workspace plain double        + activation 'runtime'
%   probe_C : model-workspace plain double        + activation 'startup'
%
% Constraint discovered earlier: Simulink.VariantControl cannot be CONSTRUCTED in
% deployed code, so the deployed side may only push a plain numeric value.

cd(fileparts(mfilename('fullpath')));

specs = { 'probe_A','param',  'startup'
          'probe_B','double', 'runtime'
          'probe_C','double', 'startup' };

for s = 1:size(specs,1)
    mdl  = specs{s,1};
    kind = specs{s,2};
    act  = specs{s,3};

    if bdIsLoaded(mdl); close_system(mdl,0); end
    if isfile([mdl '.slx']); delete([mdl '.slx']); end
    new_system(mdl); load_system(mdl);

    mws = get_param(mdl,'ModelWorkspace');
    switch kind
        case 'param'
            p = Simulink.Parameter(1);
            p.StorageClass = 'ExportedGlobal';   % must be non-Auto to stay tunable
            assignin(mws,'VCTRL',p);
        case 'double'
            assignin(mws,'VCTRL',1);
    end

    add_block('simulink/Sources/Constant',[mdl '/C1'],'Value','1','Position',[40 40 70 70]);
    add_block(sprintf('simulink/Ports &\nSubsystems/Variant Subsystem'),[mdl '/VS'], ...
              'Position',[140 20 260 90]);
    vs = [mdl '/VS'];

    ch = find_system(vs,'SearchDepth',1,'MatchFilter',@Simulink.match.allVariants, ...
                     'LookUnderMasks','all','BlockType','SubSystem');
    ch = ch(~strcmp(ch,vs));
    for k = 1:numel(ch); delete_block(ch{k}); end

    vsIn  = find_system(vs,'SearchDepth',1,'BlockType','Inport');
    vsOut = find_system(vs,'SearchDepth',1,'BlockType','Outport');
    inNm  = get_param(vsIn{1},'Name');
    outNm = get_param(vsOut{1},'Name');

    for k = 1:2
        nm = sprintf('%s/Choice%d', vs, k);
        add_block('built-in/Subsystem', nm, 'Position',[100 40+80*(k-1) 200 100+80*(k-1)]);
        add_block('simulink/Sources/In1',[nm '/' inNm],'Position',[30 40 60 60]);
        add_block('simulink/Math Operations/Gain',[nm '/g'], ...
                  'Gain',num2str(k*10),'Position',[110 35 150 65]);
        add_block('simulink/Sinks/Out1',[nm '/' outNm],'Position',[200 40 230 60]);
        add_line(nm,[inNm '/1'],'g/1'); add_line(nm,'g/1',[outNm '/1']);
        set_param(nm,'TreatAsAtomicUnit','on');
        set_param(nm,'VariantControl',sprintf('VCTRL==%d',k));
    end

    set_param(vs,'VariantActivationTime',act);
    add_block('simulink/Sinks/Out1',[mdl '/y'],'Position',[330 45 360 65]);
    add_line(mdl,'C1/1','VS/1'); add_line(mdl,'VS/1','y/1');

    set_param(mdl,'SolverType','Fixed-step','FixedStep','0.1','StopTime','1', ...
                  'SaveOutput','on','SaveFormat','Dataset','ReturnWorkspaceOutputs','on');
    save_system(mdl);
    fprintf('built %s (%s, %s)\n', mdl, kind, act);
end
fprintf('PROBE2_BUILD_OK\n');
