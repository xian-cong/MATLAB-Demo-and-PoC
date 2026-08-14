function [socNew, Pess_kW] = vpcEssStep(soc, Pload_kW, Pavg_kW, Pmax_kW, ...
                                       E_kWh, etaRT, dt_s)
%VPCESSSTEP One step of peak-shaving energy storage control.
%
%   [socNew, Pess_kW] = VPCESSSTEP(soc, Pload_kW, Pavg_kW, Pmax_kW, E_kWh, etaRT, dt_s)
%
%   The store discharges when instantaneous load exceeds its moving average and
%   recharges when load falls below it, so the generators see a flatter demand.
%   Positive Pess_kW means discharging to the bus.
%
%   State of charge is held inside 0.15..0.95 by the controller itself; the
%   certification rules then check the tighter operational band separately, so a
%   design that only just stays legal is still visible as a finding.
%
%   Code-generation compatible: used inside MATLAB Function blocks.

socLo = 0.15;
socHi = 0.95;

% Requested power: shave the excess over the moving average.
Preq = Pload_kW - Pavg_kW;
Preq = min(max(Preq, -Pmax_kW), Pmax_kW);

eta = sqrt(max(etaRT, 1e-3));
Ecap = max(E_kWh, 1e-6);

if Preq > 0
    % Discharging - limited by usable energy above the floor.
    availKWh = max(0, (soc - socLo)) * Ecap;
    maxKW    = availKWh * 3600 / max(dt_s,1e-6) * eta;
    Pess_kW  = min(Preq, maxKW);
    socNew   = soc - (Pess_kW / eta) * dt_s / 3600 / Ecap;
else
    % Charging - limited by headroom below the ceiling.
    roomKWh  = max(0, (socHi - soc)) * Ecap;
    maxKW    = roomKWh * 3600 / max(dt_s,1e-6) / eta;
    Pess_kW  = -min(-Preq, maxKW);
    socNew   = soc + (-Pess_kW * eta) * dt_s / 3600 / Ecap;
end

socNew = min(max(socNew, 0), 1);
end
