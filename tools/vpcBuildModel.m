function mdl = vpcBuildModel()
%VPCBUILDMODEL Build the vessel hybrid power-system certification model.
%
%   mdl = VPCBUILDMODEL() creates models/vesselPowerCert.slx, overwriting any
%   existing copy, and returns the model name.
%
%   The model is deliberately authored to be DEPLOYABLE via Simulink Compiler to
%   MATLAB Web App Server. The rules that make that work were established
%   empirically on this toolchain (see docs/DEPLOYMENT.md):
%
%     1. Variant control variables are PLAIN DOUBLES in the model workspace and
%        every Variant Subsystem uses VariantActivationTime = 'startup'. All
%        choices are therefore compiled into the artifact and the active one is
%        chosen per run. Deployed code may NOT construct Simulink.VariantControl -
%        that class is excluded from packaging by the MATLAB Compiler license.
%     2. Every variant choice is an atomic subsystem exposing exactly the port
%        names of its Variant Subsystem's interface.
%     3. App-editable numbers are Simulink.Parameter objects with a non-Auto
%        storage class so they stay tunable in the Rapid Accelerator target and
%        can be overridden per run with setVariable.
%
%   See also vpcDefaultConfig, vpcRunCertification, vpcAddVariantSubsystem.

mdl = 'vesselPowerCert';

here   = fileparts(mfilename('fullpath'));
mdlDir = fullfile(fileparts(here),'models');
if ~isfolder(mdlDir); mkdir(mdlDir); end
mdlFile = fullfile(mdlDir,[mdl '.slx']);

cfg = vpcDefaultConfig();

if bdIsLoaded(mdl); close_system(mdl,0); end
if isfile(mdlFile); delete(mdlFile); end
new_system(mdl);
load_system(mdl);

% =====================================================================
% Model workspace
% =====================================================================
mws = get_param(mdl,'ModelWorkspace');

% Variant controls: plain doubles, resolved at model startup.
assignin(mws,'VAR_PROP_ARCH', cfg.variants.propulsionArch);
assignin(mws,'VAR_ESS',       cfg.variants.energyStorage);
assignin(mws,'VAR_GEN',       cfg.variants.genSetConfig);
assignin(mws,'VAR_SHORE',     cfg.variants.shorePower);

legStart_s = [0 cumsum(cfg.profile.hours(1:end-1))*3600];
tunables = struct( ...
    'tBreak_s',        legStart_s, ...
    'vTab_kn',         cfg.profile.speed_kn, ...
    'hotelTab_kW',     cfg.vessel.hotelBase_kW .* cfg.profile.hotelFactor, ...
    'seaTab',          cfg.profile.seaState, ...
    'modeTab',         cfg.profile.mode, ...
    'propPower_kW',    cfg.vessel.propPower_kW, ...
    'designSpeed_kn',  cfg.vessel.designSpeed_kn, ...
    'seaMargin',       0.06, ...
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

% Step size is a plain double, NOT a tunable Simulink.Parameter: the solver's
% FixedStep is a non-tunable setting, and pointing it at a tunable variable makes
% Simulink warn on every build. It is deliberately not app-editable.
assignin(mws,'dt_s', cfg.sim.stepSize_s);

% Plain doubles, NOT Simulink.Parameter objects.
%
% Simulink.Parameter with a non-Auto storage class ('SimulinkGlobal') looks like the
% right way to keep values tunable after compilation, and it works fine in desktop
% MATLAB - including through simulink.compiler.configureForDeployment. It does NOT
% work inside the MATLAB Runtime: every deployed sim of this model then fails with a
% bare "Assertion failed", even a plain sim() with no overrides at all.
%
% Plain model-workspace doubles are still tunable per run via
% SimulationInput.setVariable in Rapid Accelerator, which is all this app needs.
fn = fieldnames(tunables);
for k = 1:numel(fn)
    assignin(mws, fn{k}, tunables.(fn{k}));
end

% =====================================================================
% Solver and logging
% =====================================================================
set_param(mdl, ...
    'SolverType','Fixed-step', 'Solver','FixedStepDiscrete', ...
    ... % FixedStep MUST be a literal number, never the name of a workspace
    ... % variable. Pointing it at 'dt_s' works perfectly in desktop MATLAB, even
    ... % through simulink.compiler.configureForDeployment, but every deployed
    ... % simulation then fails inside the MATLAB Runtime with a bare
    ... % "Assertion failed" - including a plain sim() with no overrides. Simulink
    ... % warns about it at build time ("Parameter 'FixedStep' of 'Configuration'
    ... % is non-tunable but refers to tunable variables"); that warning is the
    ... % only hint you get, and it is worth treating as an error.
    'FixedStep',num2str(cfg.sim.stepSize_s), ...
    'StopTime',num2str(sum(cfg.profile.hours)*3600), ...
    'SaveOutput','on', 'SaveFormat','Dataset', 'ReturnWorkspaceOutputs','on', ...
    'SaveTime','on');

% =====================================================================
% Operating profile: piecewise-constant voyage legs driven by the clock
% =====================================================================
prof = [mdl '/OperatingProfile'];
add_block('built-in/Subsystem', prof, 'Position',[40 150 170 300]);
add_block('simulink/Sources/Clock',[prof '/t'],'Position',[30 100 60 130]);

profSigs = { 'V_kn','vTab_kn'; 'hotel_kW','hotelTab_kW'; 'sea','seaTab'; 'mode','modeTab' };
for k = 1:size(profSigs,1)
    nm  = profSigs{k,1};
    lut = sprintf('%s/lut_%s', prof, nm);
    add_block('simulink/Lookup Tables/1-D Lookup Table', lut, ...
        'BreakpointsForDimension1','tBreak_s', 'Table',profSigs{k,2}, ...
        'InterpMethod','Flat', 'ExtrapMethod','Clip', ...
        'Position',[140 40+70*(k-1) 200 90+70*(k-1)]);
    add_block('simulink/Sinks/Out1',[prof '/' nm], ...
        'Port',num2str(k),'Position',[270 55+70*(k-1) 300 75+70*(k-1)]);
    add_line(prof,'t/1',sprintf('lut_%s/1',nm));
    add_line(prof,sprintf('lut_%s/1',nm),[nm '/1']);
end

% Dynamic positioning thruster load: only present on DP, and deliberately not
% steady. The two wave-group periods are well above the Nyquist limit of the
% 60 s solver step so the fluctuation is actually resolved rather than aliased.
dpBlk = [prof '/dpThrusters'];
add_block('simulink/User-Defined Functions/MATLAB Function', dpBlk, ...
          'Position',[140 330 220 380]);
dpChart = vpcFindEMChart(dpBlk);
dpChart.Script = strjoin({ ...
    'function dpLoad_kW = fcn(t, mode)'
    '% Thruster demand while station keeping, zero otherwise.'
    'if mode > 3.5'
    '    ripple = dpRippleAmp_kW * (sin(2*pi*t/600) + 0.5*sin(2*pi*t/1500));'
    '    dpLoad_kW = max(0, dpBase_kW + ripple);'
    'else'
    '    dpLoad_kW = 0;'
    'end'}, newline);
for pn = {'dpBase_kW','dpRippleAmp_kW'}
    d = Stateflow.Data(dpChart);
    d.Name  = pn{1};
    d.Scope = 'Parameter';
end
add_block('simulink/Sinks/Out1',[prof '/dpLoad_kW'], ...
          'Port','5','Position',[270 345 300 365]);
add_line(prof,'t/1','dpThrusters/1');
add_line(prof,'lut_mode/1','dpThrusters/2');
add_line(prof,'dpThrusters/1','dpLoad_kW/1');

% =====================================================================
% Propulsion demand: speed and sea state -> required shaft power
% =====================================================================
pd = [mdl '/PropulsionDemand'];
add_block('built-in/Subsystem', pd, 'Position',[230 160 370 240]);
vpcAddFcnBlock(pd, {'V_kn','sea'}, {'P_prop_kW'}, { ...
    'function P_prop_kW = fcn(V_kn, sea)'
    '% Admiralty-style cubic speed-power law plus a sea-state margin.'
    'vRatio  = V_kn / max(designSpeed_kn, 1e-6);'
    'P_calm  = propPower_kW * vRatio^3;'
    'P_prop_kW = P_calm * (1 + seaMargin * sea);'}, ...
    {'designSpeed_kn','propPower_kW','seaMargin'});

% =====================================================================
% VARIANT 1 - Propulsion architecture
% =====================================================================
archCode = { ...
  { 'function [P_elec_kW, P_ME_kW, fuelME_kgs] = fcn(P_prop_kW)'
    '% Direct mechanical drive: the main engine carries all propulsion through'
    '% the gearbox, and the generators see only the hotel load.'
    'P_elec_kW  = 0;'
    'P_ME_kW    = P_prop_kW / etaGearbox;'
    'fuelME_kgs = vpcSfoc(P_ME_kW, mePower_kW, meSfocMin, meSfocLoadOpt);'}, ...
  { 'function [P_elec_kW, P_ME_kW, fuelME_kgs] = fcn(P_prop_kW)'
    '% Diesel-electric: no main engine at all - propulsion becomes an'
    '% electrical load behind the converter and motor.'
    'P_elec_kW  = P_prop_kW / (etaDrive * etaMotor);'
    'P_ME_kW    = 0;'
    'fuelME_kgs = 0;'}, ...
  { 'function [P_elec_kW, P_ME_kW, fuelME_kgs] = fcn(P_prop_kW)'
    '% Hybrid PTI/PTO: hold the main engine near its best-SFOC point and let the'
    '% shaft machine take up the difference as motor (PTI) or generator (PTO).'
    'P_ME_best  = mePower_kW * meSfocLoadOpt;'
    'P_shaft    = min(P_prop_kW, P_ME_best);'
    'P_deficit  = max(0, P_prop_kW - P_shaft);'
    'P_elec_kW  = P_deficit / (etaShaftMach * etaDrive);'
    'P_ME_kW    = P_shaft / etaGearbox;'
    'fuelME_kgs = vpcSfoc(P_ME_kW, mePower_kW, meSfocMin, meSfocLoadOpt);'} };

vpcAddVariantSubsystem([mdl '/PropulsionArch'], {'P_prop_kW'}, ...
    {'P_elec_kW','P_ME_kW','fuelME_kgs'}, ...
    {'Mechanical','DieselElectric','HybridPTIPTO'}, archCode, 'VAR_PROP_ARCH', ...
    {'etaGearbox','etaDrive','etaMotor','etaShaftMach','mePower_kW', ...
     'meSfocMin','meSfocLoadOpt'}, [430 150 580 270]);

% =====================================================================
% Total electrical demand: propulsion (if electric) plus hotel load
% =====================================================================
% Electrical propulsion demand + hotel load + DP thruster load.
add_block('simulink/Math Operations/Add',[mdl '/LoadSum'], ...
          'Inputs','+++','Position',[620 170 650 210]);

% =====================================================================
% VARIANT 2 - Shore power connection
% =====================================================================
% NOTE ON ORDERING: shore power is applied AFTER energy storage, so that the
% battery's own charging demand is part of the load the shore connection covers.
% With the two the other way round the battery charges off the generators while
% alongside, which burns fuel in port and defeats cold ironing entirely.
shoreCode = { ...
  { 'function [P_gen_kW, P_shore_kW] = fcn(P_afterEss_kW, mode)'
    '% No shore connection: the vessel always supplies its own load.'
    'P_gen_kW   = P_afterEss_kW;'
    'P_shore_kW = 0;'}, ...
  { 'function [P_gen_kW, P_shore_kW] = fcn(P_afterEss_kW, mode)'
    '% Cold ironing: alongside in harbour (mode 1) the shore supply carries the'
    '% load up to the rating of the connection; any excess falls to the plant.'
    'if mode < 1.5'
    '    P_shore_kW = min(max(P_afterEss_kW,0), shorePower_kW);'
    '    P_gen_kW   = P_afterEss_kW - P_shore_kW;'
    'else'
    '    P_shore_kW = 0;'
    '    P_gen_kW   = P_afterEss_kW;'
    'end'} };

vpcAddVariantSubsystem([mdl '/ShorePower'], {'P_afterEss_kW','mode'}, ...
    {'P_gen_kW','P_shore_kW'}, {'NoConnection','ColdIroning'}, shoreCode, ...
    'VAR_SHORE', {'shorePower_kW'}, [1060 150 1210 270]);

% =====================================================================
% VARIANT 3 - Energy storage
% =====================================================================
essCode = { ...
  { 'function [P_afterEss_kW, P_ess_kW, SOC] = fcn(P_load_kW)'
    '% No energy storage fitted - the plant follows the load exactly.'
    'P_afterEss_kW = P_load_kW;'
    'P_ess_kW      = 0;'
    'SOC           = 0;'}, ...
  { 'function [P_afterEss_kW, P_ess_kW, SOC] = fcn(P_load_kW)'
    '% Li-ion battery shaving peaks against a 15 minute moving average, which is'
    '% long enough to let the generators sit at a steady operating point.'
    'persistent soc pavg'
    'if isempty(soc)'
    '    soc  = essSocInit;'
    '    pavg = P_load_kW;'
    'end'
    'a    = dt_s / (900 + dt_s);'
    'pavg = pavg + a * (P_load_kW - pavg);'
    '[soc, P_ess_kW] = vpcEssStep(soc, P_load_kW, pavg, essPower_kW, ...'
    '                             essEnergy_kWh, essEtaRT, dt_s);'
    'P_afterEss_kW = P_load_kW - P_ess_kW;'
    'SOC = soc;'}, ...
  { 'function [P_afterEss_kW, P_ess_kW, SOC] = fcn(P_load_kW)'
    '% Supercapacitor: little energy but high power, so it only rides out fast'
    '% transients against a 2 minute average.'
    'persistent soc pavg'
    'if isempty(soc)'
    '    soc  = 0.6;'
    '    pavg = P_load_kW;'
    'end'
    'a    = dt_s / (120 + dt_s);'
    'pavg = pavg + a * (P_load_kW - pavg);'
    '[soc, P_ess_kW] = vpcEssStep(soc, P_load_kW, pavg, capPower_kW, ...'
    '                             capEnergy_kWh, 0.97, dt_s);'
    'P_afterEss_kW = P_load_kW - P_ess_kW;'
    'SOC = soc;'} };

vpcAddVariantSubsystem([mdl '/EnergyStorage'], {'P_load_kW'}, ...
    {'P_afterEss_kW','P_ess_kW','SOC'}, ...
    {'NoStorage','LiIonBattery','Supercapacitor'}, essCode, 'VAR_ESS', ...
    {'essSocInit','essPower_kW','essEnergy_kWh','essEtaRT', ...
     'capPower_kW','capEnergy_kWh','dt_s'}, [850 150 1000 270]);

% =====================================================================
% VARIANT 4 - Generator set configuration
% =====================================================================
genTmpl = { 'function [nRun, loadFrac, fuelGen_kgs, capOnline_kW] = fcn(P_gen_kW)'
            '% __WORD__ diesel generator sets with equal load sharing.'
            'nInstalled = __N__;'
            '[nRun, loadFrac, fuelGen_kgs, capOnline_kW] = vpcGenDispatch( ...'
            '    P_gen_kW, nInstalled, genUnitPower_kW, genLoadMax, ...'
            '    genSfocMin, genSfocLoadOpt);'};
words   = {'Two','Three','Four'};
genCode = cell(1,3);
for c = 1:3
    genCode{c} = strrep(strrep(genTmpl,'__WORD__',words{c}), ...
                        '__N__', num2str(c+1));
end

vpcAddVariantSubsystem([mdl '/GenSets'], {'P_gen_kW'}, ...
    {'nRun','loadFrac','fuelGen_kgs','capOnline_kW'}, ...
    {'TwoUnits','ThreeUnits','FourUnits'}, genCode, 'VAR_GEN', ...
    {'genUnitPower_kW','genLoadMax','genSfocMin','genSfocLoadOpt'}, ...
    [1060 150 1210 270]);

% =====================================================================
% Wiring
% =====================================================================
% Signal chain:
%   speed/sea -> shaft power -> architecture -> +hotel -> storage -> shore -> sets
add_line(mdl,'OperatingProfile/1','PropulsionDemand/1','autorouting','smart');
add_line(mdl,'OperatingProfile/3','PropulsionDemand/2','autorouting','smart');
add_line(mdl,'PropulsionDemand/1','PropulsionArch/1','autorouting','smart');
add_line(mdl,'PropulsionArch/1','LoadSum/1','autorouting','smart');
add_line(mdl,'OperatingProfile/2','LoadSum/2','autorouting','smart');
add_line(mdl,'OperatingProfile/5','LoadSum/3','autorouting','smart');
add_line(mdl,'LoadSum/1','EnergyStorage/1','autorouting','smart');
add_line(mdl,'EnergyStorage/1','ShorePower/1','autorouting','smart');
add_line(mdl,'OperatingProfile/4','ShorePower/2','autorouting','smart');
add_line(mdl,'ShorePower/1','GenSets/1','autorouting','smart');

% Root outports - these are the logged certification signals.
outs = { 'V_kn','OperatingProfile/1'; 'hotel_kW','OperatingProfile/2'; ...
         'mode','OperatingProfile/4'; 'dpLoad_kW','OperatingProfile/5'; ...
         'P_prop_kW','PropulsionDemand/1'; ...
         'P_elec_kW','PropulsionArch/1'; 'P_ME_kW','PropulsionArch/2'; ...
         'fuelME_kgs','PropulsionArch/3'; 'P_load_kW','LoadSum/1'; ...
         'P_afterEss_kW','EnergyStorage/1'; 'P_ess_kW','EnergyStorage/2'; ...
         'SOC','EnergyStorage/3'; 'P_gen_kW','ShorePower/1'; ...
         'P_shore_kW','ShorePower/2'; ...
         'nRun','GenSets/1'; 'loadFrac','GenSets/2'; ...
         'fuelGen_kgs','GenSets/3'; 'capOnline_kW','GenSets/4' };
for k = 1:size(outs,1)
    add_block('simulink/Sinks/Out1', sprintf('%s/%s',mdl,outs{k,1}), ...
              'Port',num2str(k),'Position',[1300 60+35*(k-1) 1330 80+35*(k-1)]);
    h = add_line(mdl, outs{k,2}, [outs{k,1} '/1'], 'autorouting','smart');
    % Name the signal so results can be looked up by name rather than by index -
    % logged Dataset elements are otherwise unnamed.
    set_param(h,'Name',outs{k,1});
end

Simulink.BlockDiagram.arrangeSystem(mdl);
save_system(mdl, mdlFile);
fprintf('Built %s\n', mdlFile);

% Verify what actually landed on disk, not what is in memory here.
vpcCheckModelDeployable(mdlFile);
end
