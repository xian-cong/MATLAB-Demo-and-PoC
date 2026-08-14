function [nRun, loadFrac, fuel_kgs, capOnline_kW] = vpcGenDispatch( ...
        P_kW, nInstalled, unit_kW, loadMax, sfocMin, loadOpt)
%VPCGENDISPATCH Symmetric-load-sharing dispatch of a diesel generator bank.
%
%   [nRun, loadFrac, fuel_kgs, capOnline_kW] = VPCGENDISPATCH(P_kW, nInstalled,
%   unit_kW, loadMax, sfocMin, loadOpt) brings online the fewest units that can
%   carry P_kW without exceeding the loadMax load fraction, shares the load
%   equally between them, and returns the resulting bank fuel rate.
%
%   nRun is 0 when there is no onboard demand at all - which is what cold ironing
%   in harbour produces, and the reason the harbour-emissions rule can pass.
%
%   Code-generation compatible: used inside MATLAB Function blocks.

if P_kW <= 1e-6
    nRun         = 0;
    loadFrac     = 0;
    fuel_kgs     = 0;
    capOnline_kW = 0;
    return
end

% Fewest units that keep each machine at or below its dispatch ceiling.
nRun = ceil(P_kW / max(unit_kW * loadMax, 1e-6));
nRun = min(max(nRun, 1), nInstalled);

capOnline_kW = nRun * unit_kW;
loadFrac     = P_kW / max(capOnline_kW, 1e-6);

% Equal sharing: every running unit sits at the same operating point.
perUnit  = P_kW / nRun;
fuel_kgs = nRun * vpcSfoc(perUnit, unit_kW, sfocMin, loadOpt);
end
