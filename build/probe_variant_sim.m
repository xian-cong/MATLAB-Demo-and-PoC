% probe_variant_sim.m  -- in-process check of per-run variant switching
mdl = 'probe_variant';
load_system(mdl);

for v = [1 2 1 2]
    in = Simulink.SimulationInput(mdl);
    in = in.setVariable('VCTRL', Simulink.VariantControl('Value',v,'ActivationTime','startup'), ...
                        'Workspace', mdl);
    out = sim(in);
    yout = out.get('yout');
    y = yout{1}.Values.Data(end);
    fprintf('VCTRL=%d  ->  y=%g   (expect %d)\n', v, y, v*10);
end
fprintf('PROBE_SIM_DONE\n');
