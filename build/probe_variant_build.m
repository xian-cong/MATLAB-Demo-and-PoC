% probe_variant_build.m
% Minimal probe: can a Variant Subsystem's active choice be selected at RUN TIME
% (per sim() call, no recompile) in a way that survives Simulink Compiler deployment?
%
% Strategy under test:
%   - variant control is a Simulink.VariantControl with ActivationTime = 'startup'
%   - Variant Subsystem VariantActivationTime = 'inherit from Simulink.VariantControl'
%   - control variable lives in the MODEL WORKSPACE (so it packages into the CTF)
%   - value overridden per run via Simulink.SimulationInput.setVariable(...,'Workspace',mdl)

mdl = 'probe_variant';
if bdIsLoaded(mdl); close_system(mdl,0); end
if isfile([mdl '.slx']); delete([mdl '.slx']); end

new_system(mdl);
load_system(mdl);

% ---- model workspace: the variant control ---------------------------------
mws = get_param(mdl,'ModelWorkspace');
vc = Simulink.VariantControl('Value',1,'ActivationTime','startup');
assignin(mws,'VCTRL',vc);

% ---- build: Constant -> VariantSubsystem -> Outport ----------------------
add_block('simulink/Sources/Constant',[mdl '/C1'],'Value','1','Position',[40 40 70 70]);
% NOTE: this library path contains a literal newline ("Ports &<LF>Subsystems").
add_block(sprintf('simulink/Ports &\nSubsystems/Variant Subsystem'),[mdl '/VS'], ...
          'Position',[140 20 260 90]);

vs = [mdl '/VS'];
% Variant Subsystem ships with two empty choice subsystems; delete and author our own.
% NOTE: find_system returns the PARENT VS as well - must exclude it, or deleting the
% parent first orphans the children and the next delete_block errors.
ch = find_system(vs,'SearchDepth',1,'MatchFilter',@Simulink.match.allVariants, ...
                 'LookUnderMasks','all','BlockType','SubSystem');
ch = ch(~strcmp(ch, vs));
for k = 1:numel(ch); delete_block(ch{k}); end

% The Variant Subsystem block carries its OWN interface Inport/Outport blocks, and every
% choice must expose ports with exactly these names. Discover them rather than guessing.
vsIn  = find_system(vs,'SearchDepth',1,'BlockType','Inport');
vsOut = find_system(vs,'SearchDepth',1,'BlockType','Outport');
inNm  = get_param(vsIn{1},'Name');
outNm = get_param(vsOut{1},'Name');

for k = 1:2
    nm = sprintf('%s/Choice%d', vs, k);
    % A fresh built-in/Subsystem is EMPTY in R2026a - nothing to clear out.
    add_block('built-in/Subsystem', nm, 'Position',[100 40+80*(k-1) 200 100+80*(k-1)]);
    add_block('simulink/Sources/In1',   [nm '/' inNm],  'Position',[30 40 60 60]);
    add_block('simulink/Math Operations/Gain', [nm '/g'], ...
              'Gain', num2str(k*10), 'Position',[110 35 150 65]);
    add_block('simulink/Sinks/Out1',   [nm '/' outNm], 'Position',[200 40 230 60]);
    add_line(nm,[inNm '/1'],'g/1'); add_line(nm,'g/1',[outNm '/1']);
    % 'startup' variant activation REQUIRES every choice to be an atomic subsystem.
    set_param(nm,'TreatAsAtomicUnit','on');
    set_param(nm,'VariantControl', sprintf('VCTRL==%d',k));
end

set_param(vs,'VariantActivationTime','inherit from Simulink.VariantControl');
add_block('simulink/Sinks/Out1',[mdl '/y'],'Position',[330 45 360 65]);
add_line(mdl,'C1/1','VS/1'); add_line(mdl,'VS/1','y/1');

set_param(mdl,'SolverType','Fixed-step','FixedStep','0.1','StopTime','1', ...
              'SaveOutput','on','SaveFormat','Dataset', ...
              'SignalLogging','on','ReturnWorkspaceOutputs','on');

save_system(mdl);
fprintf('PROBE_BUILD_OK\n');
