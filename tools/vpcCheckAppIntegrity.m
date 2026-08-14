function vpcCheckAppIntegrity(mlappPath)
%VPCCHECKAPPINTEGRITY Assert that a .mlapp still contains the app's logic.
%
%   VPCCHECKAPPINTEGRITY(mlappPath) errors if the .mlapp has been reduced to UI
%   scaffolding, and also checks the two things that make it openable in App
%   Designer.
%
%   This guards a failure that is invisible from the outside: if App Designer
%   saves the file (which its Run button does), it regenerates the class from the
%   component tree and discards every hand-written property, callback and method.
%   The app still launches and still looks right - it simply does nothing when you
%   press Run. Repair with vpcBuildApp.
%
%   See also vpcBuildApp.

arguments
    mlappPath (1,:) char = ''
end

if isempty(mlappPath)
    root = fileparts(fileparts(mfilename('fullpath')));
    mlappPath = fullfile(root,'app','VesselCertApp.mlapp');
end
assert(isfile(mlappPath), 'vpc:noFile', 'Missing %s', mlappPath);

reader = appdesigner.internal.serialization.FileReader(mlappPath);
code   = reader.readMATLABCodeText();

% --- 1. the logic must be present in the class text ---------------------
required = {'RunButtonPushed','ResetButtonPushed','startupFcn','readConfig', ...
            'loadDefaults','showResults','updatePlots','Results', ...
            'vpcRunCertification','vpcBuildReport','ensureDependencies'};
missing = required(cellfun(@(k) ~contains(code,k), required));
if ~isempty(missing)
    error('vpc:appGutted', ...
        ['%s has lost its application logic (missing: %s).\n\n' ...
         'Regenerate it with vpcBuildApp.'], mlappPath, strjoin(missing,', '));
end

% --- 2. App Designer's structured code model must be populated ----------
% This is what makes the file survive being saved by App Designer. With these
% empty, App Designer concludes the app has no user code and regenerates the
% class from the component tree alone, discarding everything hand-written.
cd_ = reader.readAppDesignerData().code;

assert(isfield(cd_,'Callbacks') && ~isempty(cd_.Callbacks), 'vpc:noCallbackModel', ...
    ['%s has an empty Callbacks model. App Designer would drop its callbacks ' ...
     'the first time it saved the file.'], mlappPath);

assert(isfield(cd_,'EditableSectionCode') && ~isempty(cd_.EditableSectionCode), ...
    'vpc:noEditableModel', ...
    ['%s has an empty EditableSectionCode. App Designer would drop the app''s ' ...
     'properties and helper functions the first time it saved the file.'], mlappPath);

cbNames = {cd_.Callbacks.Name};
for want = {'RunButtonPushed','ResetButtonPushed'}
    assert(any(strcmp(cbNames, want{1})), 'vpc:missingCallback', ...
        '%s: callback %s is not in the code model.', mlappPath, want{1});
end

% startupFcn belongs in StartupCallback ONLY. If it also appears in Callbacks, the
% class App Designer regenerates defines it twice and refuses to open the app with
% "'startupFcn' is already defined as a method in the ... class."
assert(~any(strcmp(cbNames,'startupFcn')), 'vpc:duplicateStartup', ...
    ['%s: startupFcn appears in Callbacks as well as StartupCallback, which makes ' ...
     'the regenerated class define it twice.'], mlappPath);
assert(isfield(cd_,'StartupCallback') && ~isempty(cd_.StartupCallback), ...
    'vpc:noStartupCallback', '%s: StartupCallback is not set.', mlappPath);
for k = 1:numel(cd_.Callbacks)
    cb = cd_.Callbacks(k);
    assert(~isempty(cb.Code), 'vpc:emptyCallbackBody', ...
        '%s: callback %s has an empty body in the code model.', mlappPath, cb.Name);
    assert(iscell(cb.Code), 'vpc:callbackCodeNotCell', ...
        ['%s: callback %s stores Code as %s. MathWorks'' own apps store it as a ' ...
         'cell array of body lines.'], mlappPath, cb.Name, class(cb.Code));
end

% --- 3. the help block must not contain a blank comment line -------------
% App Designer's HelpCommentsParser does extractAfter(line,3) on every help
% description line; a bare "%" line is zero length and throws, which makes the
% app impossible to open at all.
helpStr = matlab.internal.help.getMFileHelpText('', @(~) code, false);
if ~isempty(helpStr)
    lines = strsplit(strip(helpStr,'right'), newline);
    if any(strlength(lines) < 1)
        error('vpc:emptyHelpLine', ...
            ['%s has an empty line in its class help block. App Designer will ' ...
             'refuse to open it with "Numeric value exceeds the number of ' ...
             'characters in element N".'], mlappPath);
    end
    stripped = extractAfter(lines, 1);
    idx = 2;
    while numel(stripped) >= idx && ~startsWith(stripped(idx), blanks(3))
        idx = idx + 1;
    end
    desc = stripped(idx:end);
    if ~isempty(desc) && any(strlength(desc) < 3)
        error('vpc:shortHelpLine', ...
            ['%s has a help description line shorter than 3 characters ' ...
             '(usually a bare "%%"). App Designer will refuse to open it.'], ...
            mlappPath);
    end
end

% --- 4. components must carry their callback as a design-time char --------
% On a design-time component App Designer stores the callback NAME, not a live
% function handle. A handle from createCallbackFcn closes over the app object, and
% saving that fails ("Save not supported for matlab.apps.AppBase objects"), so the
% value never round-trips - App Designer then sees no callback on the control, drops
% the callback as an orphan, and the button does nothing when clicked.
% This is where the component-to-callback association actually lives, confirmed
% against MathWorks' own apps: the design-time component holds the callback NAME as
% a char. A function handle from createCallbackFcn closes over the app object and
% cannot be saved ("Save not supported for matlab.apps.AppBase objects"), so it never
% round-trips and App Designer drops the callback as an orphan.
comps = reader.readAppDesignerData().components.UIFigure;
restoreComps = onCleanup(@() delete(comps));
names = {cd_.Callbacks.Name};
for k = 1:numel(names)
    h = findall(comps, '-function', ...
        @(o) isprop(o,'DesignTimeProperties') && ~isempty(o.DesignTimeProperties) && ...
             ischar(o.DesignTimeProperties.CodeName));
    wired = false;
    for i = 1:numel(h)
        for p = {'ButtonPushedFcn','ValueChangedFcn','CellEditCallback'}
            if isprop(h(i), p{1})
                v = h(i).(p{1});
                if ischar(v) && strcmp(v, names{k}); wired = true; break; end
            end
        end
        if wired; break; end
    end
    assert(wired, 'vpc:callbackNotWired', ...
        ['%s: no component holds the char ''%s'' as its callback. App Designer ' ...
         'would treat that callback as unassigned and leave the control dead.'], ...
        mlappPath, names{k});
end

% --- 5. every real component must carry a design-time name ---------------
objs = findall(reader.readAppDesignerData().components.UIFigure);
unnamed = 0;
for k = 1:numel(objs)
    try
        cn = objs(k).DesignTimeProperties.CodeName;
    catch
        continue    % axes internals and annotation panes have no such property
    end
    if isempty(cn); unnamed = unnamed + 1; end
end
assert(unnamed == 0, 'vpc:unnamedComponents', ...
    '%d components have no CodeName; App Designer Code View would show blanks.', ...
    unnamed);

fprintf('vpc: %s integrity OK (%d chars of code)\n', mlappPath, numel(code));
end
