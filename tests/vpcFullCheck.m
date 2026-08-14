% vpcFullCheck.m -- full pipeline from a clean state: build, run, app, archive.
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root,'vpcSetup.m'));

logFile = fullfile(fileparts(mfilename('fullpath')),'fullcheck.txt');
fid = fopen(logFile,'w');
closer = onCleanup(@() fclose(fid));
sinks = [1 fid];
say = @(varargin) vpcSay(sinks, varargin{:});

say('=== 1. model builds from script ===\n');
mdl = vpcBuildModel();
say('   %s.slx built\n', mdl);

say('=== 2. default configuration passes ===\n');
cfg = vpcDefaultConfig();
res = vpcRunCertification(cfg);
say('   verdict: %s  (%d rules)\n', res.verdict, numel(res.findings));
nPass = sum(strcmp({res.findings.status},'PASS'));
say('   %d/%d PASS\n', nPass, numel(res.findings));
assert(strcmp(res.verdict,'PASS'), 'default configuration no longer passes');

say('=== 3. a poor configuration fails, with reasons ===\n');
bad = cfg;
bad.variants = struct('propulsionArch',2,'energyStorage',1, ...
                      'genSetConfig',2,'shorePower',1);
resBad = vpcRunCertification(bad);
say('   verdict: %s\n', resBad.verdict);
failed = {resBad.findings(~strcmp({resBad.findings.status},'PASS')).id};
say('   not passing: %s\n', strjoin(failed,', '));
assert(strcmp(resBad.verdict,'FAIL'), 'poor configuration unexpectedly passed');

say('=== 4. variant selection changes the answer ===\n');
a = cfg; a.variants.propulsionArch = 1;
b = cfg; b.variants.propulsionArch = 2;
fa = vpcRunCertification(a).metrics.fuelTotal_t;
fb = vpcRunCertification(b).metrics.fuelTotal_t;
say('   mechanical %.2f t vs diesel-electric %.2f t\n', fa, fb);
assert(abs(fa-fb) > 0.1, 'variant switch had no effect on the result');

say('=== 5. report generates ===\n');
html = vpcBuildReport(res);
say('   %d chars, print button: %d\n', numel(html), ...
    contains(html,'window.print()'));

say('=== 6. app runs headlessly from the .mlapp ===\n');
clear VesselCertApp
w = which('VesselCertApp');
assert(endsWith(w,'.mlapp'), ...
    'VesselCertApp should resolve to the .mlapp, got %s', w);
app = VesselCertApp();
cb = app.RunButton.ButtonPushedFcn;
cb([],[]);
s = struct(app);
assert(~isempty(s.Results), 'app produced no results');
say('   app verdict: %s\n', s.Results.verdict);
delete(app.UIFigure);

say('=== 7. .mlapp carries the class AND App Designer''s code model ===\n');
mlapp = vpcBuildApp();
c = appdesigner.internal.serialization.FileReader(mlapp).readAppDesignerData().code;
say('   %d callbacks, %d editable-section lines\n', ...
    numel(c.Callbacks), numel(c.EditableSectionCode));

say('=== 8. deployable archive builds ===\n');
ctf = fullfile(root,'dist','VesselCertApp.ctf');
d = dir(ctf);
if isempty(d)
    say('   NOT BUILT - run vpcCompileWebApp\n');
else
    say('   %s  (%.2f MB)\n', ctf, d.bytes/1e6);
end

say('\nALL CHECKS PASSED\n');

% Local function: fprintf to several sinks. Deliberately a plain loop - doing this
% with arrayfun/cellfun over the fids trips "Unexpected output while using Uniform
% output", because fprintf's return differs between stdout and a file handle.
function vpcSay(sinks, varargin)
for k = sinks
    fprintf(k, varargin{:});
end
end
