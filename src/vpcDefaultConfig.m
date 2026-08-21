function cfg = vpcDefaultConfig()
%VPCDEFAULTCONFIG Default configuration for the vessel power certification demo.
%
%   cfg = VPCDEFAULTCONFIG() returns a struct describing the vessel, its
%   operating profile, the selected component variants, and the acceptance
%   limits used by the certification rules.
%
%   This function is deployment-safe: no file I/O, no base-workspace access.
%
%   See also vpcRunCertification, vpcEvaluateCriteria.

% ---------------------------------------------------------------- vessel ---
cfg.vessel.name          = 'MV Demo Trader';
cfg.vessel.imo           = '9999999';
cfg.vessel.class         = 'Offshore Support Vessel';
cfg.vessel.displacement_t = 8500;      % t
cfg.vessel.loa_m          = 92.0;      % m
cfg.vessel.designSpeed_kn = 14.0;      % kn at design draught
cfg.vessel.propPower_kW   = 4800;      % shaft power required at design speed
cfg.vessel.hotelBase_kW   = 550;       % continuous hotel / auxiliary load

% ------------------------------------------------- operating profile -------
% One row per voyage leg. The simulation walks these legs in order.
%   mode : 1=Harbour  2=Manoeuvring  3=Transit  4=DP / Station-keeping
%   hours, speed_kn, hotelFactor (x hotelBase), seaState (0-6)
cfg.profile.mode        = [1 2 3 4 3 2 1];
cfg.profile.hours       = [4 1 8 6 8 1 4];
cfg.profile.speed_kn    = [0 6 14 0 12 6 0];
cfg.profile.hotelFactor = [1.0 1.1 1.0 1.6 1.0 1.1 1.0];
cfg.profile.seaState    = [0 1 3 4 3 1 0];

% ------------------------------------------------------------- variants ----
% Each field selects the active choice of one Variant Subsystem in the model.
cfg.variants.propulsionArch = 3;   % 1=Mechanical 2=DieselElectric 3=HybridPTIPTO
cfg.variants.energyStorage  = 2;   % 1=None       2=LiIon          3=SuperCap
cfg.variants.genSetConfig   = 2;   % 1=2 units    2=3 units        3=4 units
cfg.variants.shorePower     = 2;   % 1=None       2=ColdIroning

% ------------------------------------------------- component parameters ----
% Prime mover / drive train
cfg.plant.etaGearbox   = 0.97;
cfg.plant.etaDrive     = 0.97;   % frequency converter
cfg.plant.etaMotor     = 0.96;   % propulsion motor
cfg.plant.etaGenerator = 0.96;   % shaft / genset alternator
cfg.plant.etaShaftMach = 0.95;   % PTI/PTO shaft machine

% Main engine (mechanical / hybrid architectures)
cfg.plant.mePower_kW   = 5200;
cfg.plant.meSfocMin_gpkWh = 178;   % best-point specific fuel consumption
cfg.plant.meSfocLoadOpt   = 0.85;  % load fraction at best point

% Diesel generator sets
cfg.plant.genUnitPower_kW  = 1800;  % rating per unit
cfg.plant.genSfocMin_gpkWh = 192;
cfg.plant.genSfocLoadOpt   = 0.80;
cfg.plant.genLoadMax       = 0.90;  % dispatch target ceiling
cfg.plant.genStartTime_s   = 45;    % time to bring a unit online

% Energy storage
cfg.plant.essEnergy_kWh   = 1200;
cfg.plant.essPower_kW     = 1500;
cfg.plant.essEtaRT        = 0.92;   % round trip
cfg.plant.essSocInit      = 0.65;
cfg.plant.capEnergy_kWh   = 60;     % supercapacitor option
cfg.plant.capPower_kW     = 2500;

% Dynamic positioning thruster load. Station keeping is not a quiet condition:
% the thrusters work continuously against wind and waves, and that fluctuation is
% precisely what an energy store is bought to absorb. Deterministic (not random)
% so that a certification run is repeatable.
cfg.plant.dpBase_kW      = 1250;   % mean thruster demand while on DP
cfg.plant.dpRippleAmp_kW = 480;    % wave-group driven swing about the mean

% Shore connection
cfg.plant.shorePower_kW   = 1600;

% Fuel / emissions
cfg.fuel.lhv_MJkg     = 42.7;      % MGO
cfg.fuel.co2PerFuel   = 3.206;     % t CO2 per t fuel (MGO, IMO factor)
cfg.fuel.price_USDpt  = 780;

% ------------------------------------------------- acceptance criteria -----
% These thresholds are calibrated against the achievable range of this vessel and
% profile (see tests/vpcSweep.m), so that a well-chosen configuration passes and a
% poor one fails on a specific, explainable rule rather than on everything at once.
cfg.limits.genLoadMin      = 0.30;  % sustained low load is not permitted
cfg.limits.genLoadMax      = 0.90;
cfg.limits.spinReserveMin  = 0.15;  % fraction of online capacity
cfg.limits.socMin          = 0.20;
cfg.limits.socMax          = 0.90;
cfg.limits.fuelBudget_t    = 20.5;
cfg.limits.co2Intensity_max = 34.0; % g CO2 per t-nm  (CII-style index)
cfg.limits.harbourEmissionsZero = true;   % cold ironing required in port
cfg.limits.lowLoadDwellMax_frac = 0.05;   % tolerated time outside load band

% Simulation
cfg.sim.stepSize_s = 60;
end
