function probe2_entry()
%PROBE2_ENTRY Test each variant-control strategy using ONLY plain numeric values,
% which is all that deployed code is permitted to push.

mdls = {'probe_A','probe_B','probe_C'};

for m = 1:numel(mdls)
    mdl = mdls{m};
    fprintf('==== %s ====\n', mdl);
    for v = [1 2 1]
        try
            in = Simulink.SimulationInput(mdl);
            in = in.setVariable('VCTRL', v, 'Workspace', mdl);
            in = simulink.compiler.configureForDeployment(in);
            out  = sim(in);
            yout = out.get('yout');
            y    = yout{1}.Values.Data(end);
            ok   = 'FAIL';
            if abs(y - v*10) < 1e-9; ok = 'ok'; end
            fprintf('  VCTRL=%d -> y=%g (expect %d)  [%s]\n', v, y, v*10, ok);
        catch ME
            fprintf('  VCTRL=%d -> ERROR: %s\n', v, ME.message);
        end
    end
end
fprintf('PROBE2_DONE\n');
end
