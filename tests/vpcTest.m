% vpcTest.m -- rebuild the model and score the default configuration.
run(fullfile(fileparts(fileparts(mfilename('fullpath'))),'vpcSetup.m'));

vpcBuildModel();
cfg = vpcDefaultConfig();
res = vpcRunCertification(cfg);

fprintf('\n=== VERDICT: %s ===\n', res.verdict);
for k = 1:numel(res.findings)
    f = res.findings(k);
    fprintf('%-8s %-5s %-50s %-20s %s\n', f.id, f.status, f.title, f.measured, f.limit);
end
m = res.metrics;
fprintf('\nfuel %.2f t | CO2 %.1f t | %.0f nm | intensity %.2f | shore %.0f kWh | harbourFuel %.4f t\n', ...
    m.fuelTotal_t, m.co2_t, m.distance_nm, m.co2Intensity_gptnm, ...
    m.energyShore_kWh, m.harbourFuel_t);
fprintf('genLoad mean %.2f max %.2f | outOfBand %.3f | spinRes %.3f | nMinus1 %.0f kW\n', ...
    m.genLoadMean, m.genLoadMax, m.loadOutOfBandFrac, m.spinReserveMin, m.nMinus1MaxDeficit_kW);
