function html = vpcBuildReport(res)
%VPCBUILDREPORT Self-contained HTML certification report for a result set.
%
%   html = VPCBUILDREPORT(res) renders the result of vpcRunCertification as a
%   standalone HTML document string, suitable for display in a uihtml component
%   inside a web app and for saving to disk so the surveyor can print it.
%
%   The document embeds no external resources, which matters twice over: the app
%   may run behind a firewall with no internet access, and MATLAB Web App Server
%   serves the uihtml content from a sandboxed origin.
%
%   See also vpcRunCertification, vpcEvaluateCriteria.

arguments
    res struct
end

cfg = res.config;
m   = res.metrics;

archNames  = {'Direct mechanical drive','Diesel-electric','Hybrid PTI/PTO'};
essNames   = {'None','Li-ion battery','Supercapacitor'};
genNames   = {'2 x sets','3 x sets','4 x sets'};
shoreNames = {'None','Cold ironing'};

switch res.verdict
    case 'PASS',                   vClass = 'pass';
    case 'PASS WITH OBSERVATIONS', vClass = 'warn';
    otherwise,                     vClass = 'fail';
end

L = {};
L{end+1} = '<!DOCTYPE html><html><head><meta charset="utf-8">';
L{end+1} = '<style>';
L{end+1} = ['body{font-family:"Segoe UI",Arial,sans-serif;font-size:13px;color:#1a1a1a;' ...
            'margin:0;padding:18px 22px;background:#fff}'];
L{end+1} = 'h1{font-size:19px;margin:0 0 2px 0}';
L{end+1} = 'h2{font-size:14px;margin:22px 0 8px 0;padding-bottom:4px;border-bottom:2px solid #d8dde3}';
L{end+1} = '.sub{color:#5a6672;font-size:12px;margin-bottom:14px}';
L{end+1} = ['.verdict{display:inline-block;padding:9px 18px;border-radius:4px;' ...
            'font-size:16px;font-weight:600;letter-spacing:.4px;margin:6px 0 4px 0}'];
L{end+1} = '.verdict.pass{background:#e4f4e6;color:#1a6b2a;border:1px solid #a8d9b2}';
L{end+1} = '.verdict.warn{background:#fdf3dc;color:#8a5d09;border:1px solid #ecd08a}';
L{end+1} = '.verdict.fail{background:#fbe4e4;color:#9c2020;border:1px solid #e7a9a9}';
L{end+1} = 'table{border-collapse:collapse;width:100%;margin-bottom:6px}';
L{end+1} = 'th,td{text-align:left;padding:6px 9px;border-bottom:1px solid #e6e9ec;vertical-align:top}';
L{end+1} = 'th{background:#f5f7f9;font-size:11px;text-transform:uppercase;letter-spacing:.5px;color:#5a6672}';
L{end+1} = 'td.num{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}';
L{end+1} = ['.tag{display:inline-block;padding:2px 8px;border-radius:3px;font-size:11px;' ...
            'font-weight:700;letter-spacing:.4px}'];
L{end+1} = '.tag.PASS{background:#e4f4e6;color:#1a6b2a}';
L{end+1} = '.tag.WARN{background:#fdf3dc;color:#8a5d09}';
L{end+1} = '.tag.FAIL{background:#fbe4e4;color:#9c2020}';
L{end+1} = '.detail{color:#5a6672;font-size:11.5px;margin-top:3px}';
L{end+1} = '.grid{display:flex;flex-wrap:wrap;gap:10px}';
L{end+1} = ['.kpi{flex:1 1 128px;border:1px solid #e2e6ea;border-radius:5px;padding:9px 11px;' ...
            'background:#fafbfc}'];
L{end+1} = '.kpi .v{font-size:17px;font-weight:600}';
L{end+1} = '.kpi .l{font-size:10.5px;color:#5a6672;text-transform:uppercase;letter-spacing:.4px}';
L{end+1} = '.foot{margin-top:20px;color:#8a949d;font-size:10.5px;border-top:1px solid #e6e9ec;padding-top:8px}';
% The toolbar is the export mechanism: a browser session has no file dialog, so
% the surveyor saves the report through the browser's own print-to-PDF. It is
% hidden in the printed output.
L{end+1} = ['.toolbar{margin:0 0 12px 0}.toolbar button{font:inherit;padding:6px 14px;' ...
            'border:1px solid #c4ccd4;border-radius:4px;background:#f5f7f9;cursor:pointer}'];
L{end+1} = '.toolbar button:hover{background:#e9edf1}';
L{end+1} = '@media print{.toolbar{display:none}body{padding:0}}';
L{end+1} = '</style></head><body>';
L{end+1} = ['<div class="toolbar"><button onclick="window.print()">' ...
            'Print / save as PDF</button></div>'];

% ---------------------------------------------------------------- header ---
L{end+1} = '<h1>Electrical Power System Verification Report</h1>';
L{end+1} = sprintf('<div class="sub">%s &nbsp;&middot;&nbsp; IMO %s &nbsp;&middot;&nbsp; %s</div>', ...
    esc(cfg.vessel.name), esc(cfg.vessel.imo), esc(cfg.vessel.class));
L{end+1} = sprintf('<div class="verdict %s">%s</div>', vClass, res.verdict);

% ------------------------------------------------------------------ KPIs ---
L{end+1} = '<h2>Voyage summary</h2><div class="grid">';
kpis = { 'Fuel burned',      sprintf('%.2f t',   m.fuelTotal_t)
         'CO2 emitted',      sprintf('%.1f t',   m.co2_t)
         'Carbon intensity', sprintf('%.2f',     m.co2Intensity_gptnm)
         'Distance',         sprintf('%.0f nm',  m.distance_nm)
         'Voyage length',    sprintf('%.0f h',   m.voyage_h)
         'Shore energy',     sprintf('%.0f kWh', m.energyShore_kWh)
         'Peak plant load',  sprintf('%.0f kW',  m.peakGenDemand_kW)
         'Fuel cost',        sprintf('USD %s',   thousands(m.fuelCost_USD)) };
for k = 1:size(kpis,1)
    L{end+1} = sprintf('<div class="kpi"><div class="v">%s</div><div class="l">%s</div></div>', ...
        esc(kpis{k,2}), esc(kpis{k,1}));
end
L{end+1} = '</div>';

% -------------------------------------------------------------- findings ---
L{end+1} = '<h2>Verification criteria</h2>';
L{end+1} = ['<table><tr><th style="width:62px">Rule</th><th>Criterion</th>' ...
            '<th style="width:150px">Measured</th><th style="width:150px">Requirement</th>' ...
            '<th style="width:62px">Result</th></tr>'];
for k = 1:numel(res.findings)
    f = res.findings(k);
    L{end+1} = sprintf(['<tr><td>%s</td><td>%s<div class="detail">%s</div></td>' ...
                        '<td class="num">%s</td><td class="num">%s</td>' ...
                        '<td><span class="tag %s">%s</span></td></tr>'], ...
        esc(f.id), esc(f.title), esc(f.detail), esc(f.measured), esc(f.limit), ...
        f.status, f.status);
end
L{end+1} = '</table>';

% ---------------------------------------------------- configuration audit --
L{end+1} = '<h2>As-verified configuration</h2>';
L{end+1} = '<table><tr><th style="width:44%">Item</th><th>Selection / value</th></tr>';
rows = { 'Propulsion architecture',   archNames{cfg.variants.propulsionArch}
         'Energy storage',            essNames{cfg.variants.energyStorage}
         'Generator configuration',   sprintf('%s of %.0f kW', ...
                                        genNames{cfg.variants.genSetConfig}, ...
                                        cfg.plant.genUnitPower_kW)
         'Shore connection',          shoreNames{cfg.variants.shorePower}
         'Displacement',              sprintf('%.0f t', cfg.vessel.displacement_t)
         'Design speed',              sprintf('%.1f kn', cfg.vessel.designSpeed_kn)
         'Propulsion power at design speed', sprintf('%.0f kW', cfg.vessel.propPower_kW)
         'Hotel base load',           sprintf('%.0f kW', cfg.vessel.hotelBase_kW)
         'Installed generating capacity', sprintf('%.0f kW', m.installedCap_kW)
         'Capacity remaining after N-1', sprintf('%.0f kW', m.capAfterTrip_kW) };
for k = 1:size(rows,1)
    L{end+1} = sprintf('<tr><td>%s</td><td>%s</td></tr>', esc(rows{k,1}), esc(rows{k,2}));
end
L{end+1} = '</table>';

% ------------------------------------------------------- operating profile -
L{end+1} = '<h2>Operating profile as simulated</h2>';
L{end+1} = ['<table><tr><th>Leg</th><th>Mode</th><th class="num">Hours</th>' ...
            '<th class="num">Speed (kn)</th><th class="num">Hotel factor</th>' ...
            '<th class="num">Sea state</th></tr>'];
modeNames = {'Harbour','Manoeuvring','Transit','DP / station-keeping'};
for k = 1:numel(cfg.profile.hours)
    L{end+1} = sprintf(['<tr><td>%d</td><td>%s</td><td class="num">%.1f</td>' ...
                        '<td class="num">%.1f</td><td class="num">%.2f</td>' ...
                        '<td class="num">%d</td></tr>'], ...
        k, esc(modeNames{cfg.profile.mode(k)}), cfg.profile.hours(k), ...
        cfg.profile.speed_kn(k), cfg.profile.hotelFactor(k), cfg.profile.seaState(k));
end
L{end+1} = '</table>';

L{end+1} = sprintf(['<div class="foot">Generated %s by the Vessel Power System ' ...
    'Certification demo (Simulink model <code>vesselPowerCert</code>). ' ...
    'Demonstration tool: the rule set is representative and is not a class ' ...
    'society notation.</div>'], ...
    char(datetime(res.timestamp,'Format','yyyy-MM-dd HH:mm')));
L{end+1} = '</body></html>';

html = strjoin(L, newline);
end

% =========================================================================
function s = esc(v)
%ESC Escape text for safe inclusion in HTML.
s = char(string(v));
s = strrep(s,'&','&amp;');
s = strrep(s,'<','&lt;');
s = strrep(s,'>','&gt;');
s = strrep(s,'"','&quot;');
end

% =========================================================================
function s = thousands(v)
s = regexprep(sprintf('%.0f',v), '(\d)(?=(\d{3})+$)', '$1,');
end
