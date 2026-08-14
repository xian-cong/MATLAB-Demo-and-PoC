% vpcColdStart.m -- open the app with NO project setup and press Run.
%
% This is the real user path: a fresh MATLAB, no vpcSetup, just VesselCertApp.
% The app is expected to put its own dependencies on the path and work.
root = 'C:\demo\webapp_server';

% Strip everything except the folder holding the app class itself.
for d = {'src','tools','models','build','build\mlapp'}
    warning('off','MATLAB:rmpath:DirNotFound');
    rmpath(fullfile(root,d{1}));
    warning('on','MATLAB:rmpath:DirNotFound');
end
addpath(fullfile(root,'app'));

clear VesselCertApp
fprintf('which VesselCertApp    -> %s\n', which('VesselCertApp'));
fprintf('which vpcDefaultConfig -> [%s]\n', which('vpcDefaultConfig'));

app = VesselCertApp();
fprintf('constructed OK\n');
fprintf('ReserveField    = %g  (expect 15)\n', app.ReserveField.Value);
fprintf('ProfileTable    = %d rows  (expect 7)\n', size(app.ProfileTable.Data,1));

fprintf('--- pressing Run verification ---\n');
cb = app.RunButton.ButtonPushedFcn;
cb([],[]);

s = struct(app);
assert(~isempty(s.Results), 'Run produced no results');
fprintf('verdict         = %s\n', s.Results.verdict);
fprintf('findings        = %d rows\n', size(app.FindingsTable.Data,1));
fprintf('report          = %d chars\n', numel(app.ReportHtml.HTMLSource));
delete(app.UIFigure);
fprintf('COLD START OK\n');
