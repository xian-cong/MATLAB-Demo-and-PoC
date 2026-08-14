function logFile = vpcWriteDiagnostics(err, cfg)
%VPCWRITEDIAGNOSTICS Write a diagnostics file after a failed verification run.
%
%   logFile = VPCWRITEDIAGNOSTICS(err, cfg) records everything needed to diagnose a
%   failure that happened inside a packaged application, and returns the path.
%
%   A deployed failure usually surfaces as a bare "Assertion failed" with no stack
%   and no diagnostic, and there is no command window to inspect. This writes the
%   surrounding facts to a file the user can send back: whether the app is deployed,
%   where its archive is, whether the model resolves, and the full error report.
%
%   Never throws - diagnostics must not fail on top of a failure.

logFile = '';
try
    logFile = fullfile(tempdir, sprintf('VesselCertApp_diagnostics_%s.txt', ...
        char(datetime('now','Format','yyyyMMdd_HHmmss'))));
    fid = fopen(logFile, 'w');
    if fid < 0
        logFile = '';
        return
    end
    closer = onCleanup(@() fclose(fid));

    p = @(varargin) fprintf(fid, varargin{:});

    p('Vessel Electrical Power System Verification - diagnostics\n');
    p('=========================================================\n');
    p('time            : %s\n', char(datetime('now')));
    p('isdeployed      : %d\n', isdeployed);
    p('MATLAB version  : %s\n', version);
    try, p('computer        : %s\n', computer); catch, end

    p('\n-- locations --------------------------------------------\n');
    try, p('pwd             : %s\n', pwd); catch, end
    try, p('tempdir         : %s\n', tempdir); catch, end
    if isdeployed
        try, p('ctfroot         : %s\n', ctfroot); catch, end
    end

    p('\n-- model --------------------------------------------------\n');
    mdl = 'vesselPowerCert';
    try, p('which(''%s'')  : %s\n', mdl, which(mdl)); catch, end
    try, p('exist(''%s'')  : %d  (4 = Simulink model)\n', mdl, exist(mdl,'file')); catch, end
    try, p('which %s.slx : %s\n', mdl, which([mdl '.slx'])); catch, end
    if isdeployed
        % The model travels inside the archive; list what actually arrived.
        try
            d = dir(fullfile(ctfroot, '**', [mdl '.slx']));
            if isempty(d)
                p('archive search  : %s.slx NOT FOUND under ctfroot\n', mdl);
            else
                for k = 1:numel(d)
                    p('archive copy    : %s (%d bytes, %s)\n', ...
                        fullfile(d(k).folder, d(k).name), d(k).bytes, d(k).date);
                end
            end
        catch ME2
            p('archive search  : failed (%s)\n', ME2.message);
        end
    end

    if nargin > 1 && ~isempty(cfg)
        p('\n-- configuration ------------------------------------------\n');
        try
            p('variants        : arch=%d ess=%d gen=%d shore=%d\n', ...
                cfg.variants.propulsionArch, cfg.variants.energyStorage, ...
                cfg.variants.genSetConfig, cfg.variants.shorePower);
            p('profile legs    : %d\n', numel(cfg.profile.hours));
        catch
        end
    end

    p('\n-- error --------------------------------------------------\n');
    if nargin > 0 && ~isempty(err)
        try, p('identifier      : %s\n', err.identifier); catch, end
        try, p('message         : %s\n', err.message); catch, end
        try
            p('\nreport:\n%s\n', err.getReport('extended','hyperlinks','off'));
        catch
        end
        try
            for k = 1:numel(err.cause)
                p('cause %d         : %s\n', k, err.cause{k}.message);
            end
        catch
        end
    end

    p('\n-- most likely causes -------------------------------------\n');
    p(['1. The model was packaged from a STALE copy held in memory by the MATLAB\n' ...
       '   session that did the packaging. Close the model (or restart MATLAB)\n' ...
       '   before packaging; Simulink will not reload a changed root model.\n']);
    p(['2. models\\%s.slx was not added under "Files required for the app to run".\n'], mdl);
    p(['3. The model uses a workspace variable name for a solver setting such as\n' ...
       '   FixedStep. That works on the desktop and fails in every deployed run.\n']);
catch
    % Diagnostics are best effort only.
end
end
