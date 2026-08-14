function res = vpcRunCertification(cfg, opts)
%VPCRUNCERTIFICATION Simulate a vessel configuration and score it against the rules.
%
%   res = VPCRUNCERTIFICATION(cfg) runs the certification model for the
%   configuration cfg (see vpcDefaultConfig) and returns a struct containing the
%   time series, the derived voyage metrics, and the pass/fail findings.
%
%   res = VPCRUNCERTIFICATION(cfg, opts) accepts:
%       opts.simulationMode - 'rapid-accelerator' (default) or 'normal'
%       opts.progressFcn    - function handle called with a 0..1 fraction
%
%   This function is deployment-safe. In particular it never constructs a
%   Simulink.VariantControl (excluded from packaging by the MATLAB Compiler
%   licence) - variant choices are pushed as plain doubles, and the model resolves
%   them at startup because every choice is compiled into the artifact.
%
%   See also vpcDefaultConfig, vpcEvaluateCriteria, vpcBuildModel.

arguments
    cfg  struct
    opts struct = struct()
end

mdl = 'vesselPowerCert';
if ~isfield(opts,'simulationMode'); opts.simulationMode = 'rapid-accelerator'; end
report = isfield(opts,'progressFcn') && ~isempty(opts.progressFcn);

if report; opts.progressFcn(0.05); end

% load_system and bdIsLoaded do not exist in the MATLAB Runtime and error if
% called there. A deployed archive does not need them: the model is already part
% of the archive and sim() resolves it from the SimulationInput.
% DESKTOP ONLY. Never pre-check the model's existence when deployed: inside the
% MATLAB Runtime the model is served from the CTF and exist/which do not necessarily
% report it, so this check false-fires on a perfectly good package. Deployed failures
% are caught around sim() below instead, where the real error is available.
if ~isdeployed && exist(mdl,'file') ~= 4 && isempty(which([mdl '.slx']))
    error('vpc:modelNotFound', ...
        ['The Simulink model "%s" is not on the MATLAB path.\n\n' ...
         'Run vpcSetup, then vpcBuildModel to generate models\\%s.slx.'], mdl, mdl);
end

if ~isdeployed
    %#exclude bdIsLoaded
    %#exclude load_system
    if ~bdIsLoaded(mdl)
        load_system(mdl);
    end
end

% ------------------------------------------------------------------ inputs --
in = Simulink.SimulationInput(mdl);

% Variant selections: plain doubles only.
in = in.setVariable('VAR_PROP_ARCH', cfg.variants.propulsionArch, 'Workspace', mdl);
in = in.setVariable('VAR_ESS',       cfg.variants.energyStorage,  'Workspace', mdl);
in = in.setVariable('VAR_GEN',       cfg.variants.genSetConfig,   'Workspace', mdl);
in = in.setVariable('VAR_SHORE',     cfg.variants.shorePower,     'Workspace', mdl);

% Tunable numbers.
legStart_s = [0 cumsum(cfg.profile.hours(1:end-1))*3600];
vals = struct( ...
    'tBreak_s',        legStart_s, ...
    'vTab_kn',         cfg.profile.speed_kn, ...
    'hotelTab_kW',     cfg.vessel.hotelBase_kW .* cfg.profile.hotelFactor, ...
    'seaTab',          cfg.profile.seaState, ...
    'modeTab',         cfg.profile.mode, ...
    'propPower_kW',    cfg.vessel.propPower_kW, ...
    'designSpeed_kn',  cfg.vessel.designSpeed_kn, ...
    'etaGearbox',      cfg.plant.etaGearbox, ...
    'etaDrive',        cfg.plant.etaDrive, ...
    'etaMotor',        cfg.plant.etaMotor, ...
    'etaShaftMach',    cfg.plant.etaShaftMach, ...
    'mePower_kW',      cfg.plant.mePower_kW, ...
    'meSfocMin',       cfg.plant.meSfocMin_gpkWh, ...
    'meSfocLoadOpt',   cfg.plant.meSfocLoadOpt, ...
    'genUnitPower_kW', cfg.plant.genUnitPower_kW, ...
    'genSfocMin',      cfg.plant.genSfocMin_gpkWh, ...
    'genSfocLoadOpt',  cfg.plant.genSfocLoadOpt, ...
    'genLoadMax',      cfg.plant.genLoadMax, ...
    'essEnergy_kWh',   cfg.plant.essEnergy_kWh, ...
    'essPower_kW',     cfg.plant.essPower_kW, ...
    'essEtaRT',        cfg.plant.essEtaRT, ...
    'essSocInit',      cfg.plant.essSocInit, ...
    'capEnergy_kWh',   cfg.plant.capEnergy_kWh, ...
    'capPower_kW',     cfg.plant.capPower_kW, ...
    'dpBase_kW',       cfg.plant.dpBase_kW, ...
    'dpRippleAmp_kW',  cfg.plant.dpRippleAmp_kW, ...
    'shorePower_kW',   cfg.plant.shorePower_kW);

fn = fieldnames(vals);
for k = 1:numel(fn)
    in = in.setVariable(fn{k}, vals.(fn{k}), 'Workspace', mdl);
end

in = in.setModelParameter('StopTime', num2str(sum(cfg.profile.hours)*3600));
in = in.setModelParameter('SimulationMode', opts.simulationMode);

% Required when running inside a compiled artifact; harmless in MATLAB.
if isdeployed
    in = simulink.compiler.configureForDeployment(in);
end

if report; opts.progressFcn(0.15); end

% ------------------------------------------------------------------- run ----
try
    out = sim(in);
catch ME
    if isdeployed
        % Inside a package the usual cause is that the model, or its Rapid
        % Accelerator target, is not in the archive. Simulink reports that from a
        % long way down as something unhelpful like a bare "Assertion failed".
        error('vpc:simFailedDeployed', ...
            ['The simulation could not run.\n\n%s\n\n' ...
             'If this application was just packaged, check that models\\%s.slx was ' ...
             'added under "Files required for the app to run", and that the Rapid ' ...
             'Accelerator target was rebuilt during packaging (the build log should ' ...
             'say "Building the rapid accelerator target for model: %s", not ' ...
             '"Skipping code compilation").'], ME.message, mdl, mdl);
    else
        rethrow(ME);
    end
end

if report; opts.progressFcn(0.75); end

% --------------------------------------------------------------- unpack -----
res.config = cfg;
res.ts     = vpcDatasetToStruct(out.get('yout'));
res.metrics = vpcVoyageMetrics(res.ts, cfg);

if report; opts.progressFcn(0.9); end

res.findings = vpcEvaluateCriteria(res.ts, res.metrics, cfg);
res.verdict  = vpcOverallVerdict(res.findings);
res.timestamp = datetime('now');

if report; opts.progressFcn(1); end
end

% =========================================================================
function s = vpcDatasetToStruct(ds)
%VPCDATASETTOSTRUCT Flatten a logged Dataset into a struct of column vectors.
s = struct();
for k = 1:ds.numElements
    el = ds{k};
    nm = el.Name;
    if isempty(nm)
        nm = sprintf('sig%d',k);
    end
    s.(nm) = el.Values.Data(:);
end
s.t_s = ds{1}.Values.Time(:);
s.t_h = s.t_s / 3600;
end

% =========================================================================
function m = vpcVoyageMetrics(ts, cfg)
%VPCVOYAGEMETRICS Integrate the time series into voyage-level figures.
dt = mean(diff(ts.t_s));

% Fuel: trapezoidal integration of both prime-mover streams.
m.fuelME_t  = trapz(ts.t_s, ts.fuelME_kgs)  / 1000;
m.fuelGen_t = trapz(ts.t_s, ts.fuelGen_kgs) / 1000;
m.fuelTotal_t = m.fuelME_t + m.fuelGen_t;

m.co2_t     = m.fuelTotal_t * cfg.fuel.co2PerFuel;
m.fuelCost_USD = m.fuelTotal_t * cfg.fuel.price_USDpt;

% Transport work: distance sailed x cargo-carrying displacement.
m.distance_nm = trapz(ts.t_s, ts.V_kn) / 3600;
m.voyage_h    = ts.t_h(end);
transportWork_tnm = max(m.distance_nm * cfg.vessel.displacement_t, eps);
m.co2Intensity_gptnm = m.co2_t * 1e6 / transportWork_tnm;

% Energy split.
m.energyShore_kWh = trapz(ts.t_s, ts.P_shore_kW) / 3600;
m.energyGen_kWh   = trapz(ts.t_s, ts.P_gen_kW)   / 3600;
m.energyProp_kWh  = trapz(ts.t_s, ts.P_prop_kW)  / 3600;

% Generator loading statistics, counted only while machines are running.
running = ts.nRun > 0;
m.runningFraction = mean(running);
if any(running)
    m.genLoadMean = mean(ts.loadFrac(running));
    m.genLoadMax  = max(ts.loadFrac(running));
    m.genLoadMin  = min(ts.loadFrac(running));
    outOfBand = running & (ts.loadFrac < cfg.limits.genLoadMin | ...
                           ts.loadFrac > cfg.limits.genLoadMax);
    m.loadOutOfBandFrac = sum(outOfBand) * dt / ts.t_s(end);
else
    m.genLoadMean = 0; m.genLoadMax = 0; m.genLoadMin = 0;
    m.loadOutOfBandFrac = 0;
end

% Spinning reserve. Headroom on the running machines is only part of the picture:
% on a hybrid vessel the store is what actually catches a sudden load step, and
% that is the main reason it is fitted - it lets the dispatcher run fewer sets at
% a higher, more efficient load instead of idling a machine purely as reserve.
genHeadroom_kW = max(ts.capOnline_kW - ts.P_gen_kW, 0);

if cfg.variants.energyStorage == 1
    essAvail_kW = zeros(size(ts.t_s));
else
    if cfg.variants.energyStorage == 2
        essRating_kW = cfg.plant.essPower_kW;
    else
        essRating_kW = cfg.plant.capPower_kW;
    end
    % Only counts as reserve while there is charge left to deliver it.
    essAvail_kW = essRating_kW * (ts.SOC > cfg.limits.socMin);
end

reserveGen = ones(size(ts.t_s));
reserveTot = ones(size(ts.t_s));
reserveGen(running) = genHeadroom_kW(running) ./ max(ts.capOnline_kW(running), eps);
reserveTot(running) = (genHeadroom_kW(running) + essAvail_kW(running)) ./ ...
                       max(ts.capOnline_kW(running), eps);

m.spinReserveGenOnly = min(reserveGen);
m.spinReserveMin     = min(reserveTot);
m.essReserveCredit_kW = max(essAvail_kW);

% N-1: if the largest set trips, can the rest of the INSTALLED bank carry the
% load? Comparing against the online capacity instead would make the rule
% unsatisfiable whenever the dispatcher is economically running a single unit,
% even though the standby sets are available to start.
nInstalledUnits = cfg.variants.genSetConfig + 1;
capAfterTrip_kW = (nInstalledUnits - 1) * cfg.plant.genUnitPower_kW;
m.nMinus1MaxDeficit_kW = max([max(ts.P_gen_kW) - capAfterTrip_kW; 0]);
m.capAfterTrip_kW = capAfterTrip_kW;

% Storage.
if cfg.variants.energyStorage == 1
    m.socMin = NaN; m.socMax = NaN; m.essThroughput_kWh = 0;
else
    m.socMin = min(ts.SOC);
    m.socMax = max(ts.SOC);
    m.essThroughput_kWh = trapz(ts.t_s, abs(ts.P_ess_kW)) / 3600;
end

% Harbour emissions: fuel burned while alongside.
inHarbour = ts.mode < 1.5;
if any(inHarbour)
    m.harbourFuel_t = trapz(ts.t_s(inHarbour), ...
                            ts.fuelME_kgs(inHarbour) + ts.fuelGen_kgs(inHarbour)) / 1000;
else
    m.harbourFuel_t = 0;
end

% Installed capacity check.
m.peakGenDemand_kW = max(ts.P_gen_kW);
nInstalled = cfg.variants.genSetConfig + 1;
m.installedCap_kW = nInstalled * cfg.plant.genUnitPower_kW;
m.capacityMargin = (m.installedCap_kW - m.peakGenDemand_kW) / max(m.installedCap_kW,eps);
end

% =========================================================================
function v = vpcOverallVerdict(findings)
%VPCOVERALLVERDICT Roll individual findings up into one outcome.
sev = {findings.status};
if any(strcmp(sev,'FAIL'))
    v = 'FAIL';
elseif any(strcmp(sev,'WARN'))
    v = 'PASS WITH OBSERVATIONS';
else
    v = 'PASS';
end
end
