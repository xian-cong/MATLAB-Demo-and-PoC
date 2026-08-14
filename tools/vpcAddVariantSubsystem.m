function vpcAddVariantSubsystem(vsPath, inNames, outNames, choiceNames, ...
                                codeCell, ctrlVar, paramNames, position)
%VPCADDVARIANTSUBSYSTEM Create a Variant Subsystem with deployable choices.
%
%   VPCADDVARIANTSUBSYSTEM(vsPath, inNames, outNames, choiceNames, codeCell,
%   ctrlVar, paramNames, position) creates a Variant Subsystem at vsPath whose
%   interface is inNames -> outNames, with one choice per entry of choiceNames
%   implementing the corresponding body in codeCell.
%
%   Choice k is selected when the model-workspace variable ctrlVar equals k.
%
%   Three constraints make this deployable through Simulink Compiler, and all
%   three are enforced here rather than left to the caller:
%     * activation time is 'startup', so every choice is compiled into the
%       artifact and the active one is resolved per simulation run;
%     * every choice is an atomic subsystem, which 'startup' requires;
%     * every choice exposes exactly the Variant Subsystem's own port names,
%       which Simulink checks at update-diagram time.

add_block(sprintf('simulink/Ports &\nSubsystems/Variant Subsystem'), vsPath, ...
          'Position', position);

% --- clear the template ------------------------------------------------
% find_system returns the Variant Subsystem itself as well as its children;
% deleting the parent first would orphan the children, so exclude it.
kids = find_system(vsPath,'SearchDepth',1,'MatchFilter',@Simulink.match.allVariants, ...
                   'LookUnderMasks','all','BlockType','SubSystem');
kids = kids(~strcmp(kids, vsPath));
for k = 1:numel(kids); delete_block(kids{k}); end

for bt = {'Inport','Outport'}
    old = find_system(vsPath,'SearchDepth',1,'BlockType',bt{1});
    for k = 1:numel(old); delete_block(old{k}); end
end

% --- author the interface on the Variant Subsystem itself ---------------
for k = 1:numel(inNames)
    add_block('simulink/Sources/In1',[vsPath '/' inNames{k}], ...
              'Port',num2str(k),'Position',[40 40+50*(k-1) 70 60+50*(k-1)]);
end
for k = 1:numel(outNames)
    add_block('simulink/Sinks/Out1',[vsPath '/' outNames{k}], ...
              'Port',num2str(k),'Position',[420 40+50*(k-1) 450 60+50*(k-1)]);
end

% --- one atomic choice per implementation ------------------------------
for c = 1:numel(choiceNames)
    ch = sprintf('%s/%s', vsPath, choiceNames{c});
    add_block('built-in/Subsystem', ch, ...
              'Position',[150 40+120*(c-1) 330 140+120*(c-1)]);
    vpcAddFcnBlock(ch, inNames, outNames, codeCell{c}, paramNames);
    set_param(ch,'TreatAsAtomicUnit','on');
    set_param(ch,'VariantControl', sprintf('%s==%d', ctrlVar, c));
end

set_param(vsPath,'VariantActivationTime','startup');
end
