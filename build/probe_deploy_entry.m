function probe_deploy_entry(varargin)
% Deploy-safe entry point: runs the probe model once per requested variant.
% Proves that a 'startup'-activation Variant Subsystem can be switched at RUN TIME
% inside a Simulink Compiler artifact (no recompile per variant).

mdl = 'probe_variant';

if isempty(varargin)
    vals = {'1','2','1','2'};
else
    vals = varargin;
end

for i = 1:numel(vals)
    v = str2double(vals{i});
    in = Simulink.SimulationInput(mdl);
    in = in.setVariable('VCTRL', ...
            Simulink.VariantControl('Value',v,'ActivationTime','startup'), ...
            'Workspace', mdl);

    % REQUIRED for Simulink Compiler / Web App Server deployment.
    in = simulink.compiler.configureForDeployment(in);

    out  = sim(in);
    yout = out.get('yout');
    y    = yout{1}.Values.Data(end);
    fprintf('DEPLOYED VCTRL=%d -> y=%g (expect %d)\n', v, y, v*10);
end

fprintf('PROBE_DEPLOY_DONE\n');
end
