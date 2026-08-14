function fuel_kgs = vpcSfoc(P_kW, Prated_kW, sfocMin_gpkWh, loadOpt)
%VPCSFOC Fuel rate of a diesel prime mover from a bowl-shaped SFOC curve.
%
%   fuel_kgs = VPCSFOC(P_kW, Prated_kW, sfocMin_gpkWh, loadOpt) returns the fuel
%   mass flow in kg/s for shaft/electrical output P_kW from an engine rated
%   Prated_kW whose best specific fuel consumption sfocMin_gpkWh occurs at load
%   fraction loadOpt.
%
%   Specific consumption rises either side of the best point, which is what makes
%   sustained low-load running expensive and is why the certification rules police
%   a minimum generator loading.
%
%   Code-generation compatible: used inside MATLAB Function blocks.

if P_kW <= 0
    fuel_kgs = 0;
    return
end

load = P_kW / max(Prated_kW, 1e-6);
load = min(max(load, 0.05), 1.10);

% Quadratic penalty away from the best point.
sfoc = sfocMin_gpkWh * (1 + 0.9 * (load - loadOpt)^2);

fuel_kgs = P_kW * sfoc / 1000 / 3600;   % g/kWh -> kg/s
end
