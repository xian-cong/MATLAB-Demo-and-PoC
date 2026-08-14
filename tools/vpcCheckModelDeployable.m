function vpcCheckModelDeployable(mdlFile)
%VPCCHECKMODELDEPLOYABLE Assert the SAVED model can run inside a deployed archive.
%
%   VPCCHECKMODELDEPLOYABLE() checks models/vesselPowerCert.slx.
%   VPCCHECKMODELDEPLOYABLE(mdlFile) checks a specific file.
%
%   Checks the file ON DISK, loading it fresh, because that is what packaging
%   actually ships - and because a MATLAB session that has the model open will not
%   reload a changed root model, so an in-memory copy can silently differ from the
%   file and even be saved back over it.
%
%   The check that matters: a solver setting must be a literal number, never the
%   name of a workspace variable. FixedStep = 'dt_s' works on the desktop, survives
%   simulink.compiler.configureForDeployment, and then makes every deployed run fail
%   with a bare "Assertion failed" and no diagnostic.
%
%   See also vpcBuildModel, vpcCompileWebApp.

arguments
    mdlFile (1,:) char = ''
end

if isempty(mdlFile)
    root = fileparts(fileparts(mfilename('fullpath')));
    mdlFile = fullfile(root,'models','vesselPowerCert.slx');
end
assert(isfile(mdlFile), 'vpc:noModelFile', 'Missing %s', mdlFile);

[~, mdl] = fileparts(mdlFile);

% Load from disk, not from whatever this session happens to be holding.
wasLoaded = bdIsLoaded(mdl);
if wasLoaded
    close_system(mdl, 0);
end
load_system(mdlFile);
restore = onCleanup(@() closeQuiet(mdl));

numericSettings = {'FixedStep','StopTime','StartTime'};
bad = {};
for k = 1:numel(numericSettings)
    v = get_param(mdl, numericSettings{k});
    if strcmpi(strtrim(v), 'auto'); continue; end
    if isnan(str2double(v))
        bad{end+1} = sprintf('%s = ''%s''', numericSettings{k}, v); %#ok<AGROW>
    end
end

assert(isempty(bad), 'vpc:solverSettingNotLiteral', ...
    ['%s has solver setting(s) that name a workspace variable instead of a ' ...
     'literal number: %s.\n\n' ...
     'That works in desktop MATLAB and makes EVERY deployed simulation fail with ' ...
     'a bare "Assertion failed". Rebuild with vpcBuildModel.\n\n' ...
     'If this reappears after a rebuild, a MATLAB session holding the old model ' ...
     'has saved it back over the file - close the model there (or restart MATLAB) ' ...
     'before rebuilding or packaging.'], ...
    mdlFile, strjoin(bad, ', '));

fprintf('vpc: %s is deployment-safe (FixedStep=%s, StopTime=%s)\n', ...
    mdlFile, get_param(mdl,'FixedStep'), get_param(mdl,'StopTime'));
end

function closeQuiet(mdl)
try
    if bdIsLoaded(mdl); close_system(mdl, 0); end
catch
end
end
