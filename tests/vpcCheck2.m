% vpcCheck2.m -- default configuration plus a deliberately poor one, in detail.
%
% Run from this folder. Results are mirrored to check2.txt so a long run is still
% readable if the calling session times out.
run(fullfile(fileparts(fileparts(mfilename('fullpath'))),'vpcSetup.m'));

logFile = fullfile(fileparts(mfilename('fullpath')),'check2.txt');
fid = fopen(logFile,'w');
closer = onCleanup(@() fclose(fid));
sinks = [1 fid];

cases = { 'DEFAULT (hybrid + Li-ion + cold ironing)', ...
              struct('propulsionArch',3,'energyStorage',2,'genSetConfig',2,'shorePower',2)
          'POOR (diesel-electric, no storage, no shore)', ...
              struct('propulsionArch',2,'energyStorage',1,'genSetConfig',2,'shorePower',1) };

for c = 1:size(cases,1)
    cfg = vpcDefaultConfig();
    cfg.variants = cases{c,2};
    res = vpcRunCertification(cfg);
    m   = res.metrics;

    for s = sinks
        fprintf(s,'\n================ %s\n', cases{c,1});
        fprintf(s,'VERDICT: %s\n', res.verdict);
        for k = 1:numel(res.findings)
            f = res.findings(k);
            fprintf(s,'  %-8s %-5s %-46s %-20s %s\n', ...
                f.id, f.status, f.title, f.measured, f.limit);
        end
        fprintf(s,'  fuel %.2f t | CO2 %.1f t | %.2f g/t-nm | peak %.0f kW / installed %.0f kW\n', ...
            m.fuelTotal_t, m.co2_t, m.co2Intensity_gptnm, m.peakGenDemand_kW, m.installedCap_kW);
        fprintf(s,'  reserve gen-only %.3f -> with store %.3f (credit %.0f kW) | outBand %.3f\n', ...
            m.spinReserveGenOnly, m.spinReserveMin, m.essReserveCredit_kW, m.loadOutOfBandFrac);
        fprintf(s,'  SOC %.2f..%.2f | harbourFuel %.4f t\n', ...
            m.socMin, m.socMax, m.harbourFuel_t);
    end
end

for s = sinks; fprintf(s,'\nDONE\n'); end
