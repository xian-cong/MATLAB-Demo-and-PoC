% vpcSweep.m -- sweep the variant space to confirm variants change the answer
% and to calibrate the carbon-intensity limit sensibly.
run(fullfile(fileparts(fileparts(mfilename('fullpath'))),'vpcSetup.m'));

% Rebuild first - otherwise the sweep silently scores whatever .slx is on disk.
vpcBuildModel();

logFile = fullfile(fileparts(mfilename('fullpath')),'sweep.txt');
fid = fopen(logFile,'w');
closer = onCleanup(@() fclose(fid));

archN  = {'Mech','DE','Hybrid'};
essN   = {'None','LiIon','SCap'};
shoreN = {'NoShore','ColdIron'};

fprintf('\n%-8s %-6s %-9s %-4s | %8s %8s %9s %7s %6s\n', ...
    'arch','ess','shore','gen','fuel_t','CO2_t','g/t-nm','outBand','verdict');
rows = {};
for a = 1:3
  for e = 1:3
    for s = 1:2
        cfg = vpcDefaultConfig();
        cfg.variants.propulsionArch = a;
        cfg.variants.energyStorage  = e;
        cfg.variants.shorePower     = s;
        cfg.limits.co2Intensity_max = 1e9;   % neutralised while calibrating
        res = vpcRunCertification(cfg);
        m = res.metrics;
        line = sprintf('%-8s %-6s %-9s %-4d | %8.2f %8.1f %9.2f %7.3f %6s', ...
            archN{a}, essN{e}, shoreN{s}, cfg.variants.genSetConfig+1, ...
            m.fuelTotal_t, m.co2_t, m.co2Intensity_gptnm, m.loadOutOfBandFrac, res.verdict);
        fprintf('%s\n', line);
        fprintf(fid,'%s\n', line);
        rows{end+1} = [a e s m.co2Intensity_gptnm]; %#ok<SAGROW>
    end
  end
end

all = cell2mat(rows');
fprintf('\nintensity: min %.2f  median %.2f  max %.2f\n', ...
    min(all(:,4)), median(all(:,4)), max(all(:,4)));
