% vpcMlappRoundTrip.m -- prove the .mlapp survives being opened AND saved.
%
% Three bars, in increasing order of strictness:
%   1. it runs                       - execution uses the serialized components
%   2. it opens                      - App Designer's loader accepts it
%   3. its CODE MODEL is populated   - App Designer has user code to preserve when
%                                      it saves, instead of regenerating the class
%                                      from the component tree and discarding
%                                      everything hand-written
%
% Bar 3 is the one that matters and the one that was missing before.
root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root,'vpcSetup.m'));

mlapp = vpcBuildApp();
fprintf('\n--- 1. resolves and runs -------------------------------------\n');
clear VesselCertApp
w = which('VesselCertApp');
fprintf('resolves to : %s\n', w);
assert(endsWith(w,'.mlapp'), 'expected the .mlapp to resolve, got %s', w);

app = VesselCertApp();
cb  = app.RunButton.ButtonPushedFcn;
cb([],[]);
s = struct(app);
assert(~isempty(s.Results), 'the .mlapp produced no results');
fprintf('verdict     : %s (%d findings)\n', ...
    s.Results.verdict, size(app.FindingsTable.Data,1));
delete(app.UIFigure);

fprintf('\n--- 2. App Designer''s reader accepts it ----------------------\n');
reader  = appdesigner.internal.serialization.FileReader(mlapp);
appData = reader.readAppDesignerData();
fprintf('readAppDesignerData OK : components + code returned\n');
cleanupFig = onCleanup(@() delete(appData.components.UIFigure));

fprintf('\n--- 3. code model is populated -------------------------------\n');
c = appData.code;
fprintf('ClassName            : %s\n', c.ClassName);
fprintf('EditableSectionCode  : %d lines\n', numel(c.EditableSectionCode));
fprintf('Callbacks            : %d\n', numel(c.Callbacks));
for k = 1:numel(c.Callbacks)
    cb = c.Callbacks(k);
    fprintf('   %-22s %2d lines of body\n', cb.Name, numel(cellstr(cb.Code)));
end
if isfield(c,'StartupCallback') && ~isempty(c.StartupCallback)
    fprintf('StartupCallback      : %s (%d lines)\n', ...
        c.StartupCallback.Name, numel(c.StartupCallback.Code));
end

assert(~isempty(c.EditableSectionCode), 'EditableSectionCode is empty');
assert(~isempty(c.Callbacks), 'Callbacks model is empty');
names = {c.Callbacks.Name};
assert(any(strcmp(names,'RunButtonPushed')), 'RunButtonPushed missing from model');

% startupFcn must be in StartupCallback only - in both places, the class App
% Designer regenerates declares it twice and the app will not open.
assert(~any(strcmp(names,'startupFcn')), ...
    'startupFcn is in Callbacks as well as StartupCallback');
assert(isfield(c,'StartupCallback') && ~isempty(c.StartupCallback), ...
    'StartupCallback is not set');

% The editable section must actually carry the app's own logic, not just comments.
ed = strjoin(cellstr(c.EditableSectionCode), newline);
for want = {'readConfig','showResults','updatePlots','ensureDependencies','Results'}
    assert(contains(ed, want{1}), ...
        'editable section does not contain %s', want{1});
end
fprintf('editable section carries the app logic\n');

% --- 4. the component-to-callback association --------------------------------
% This is where it actually lives: the design-time component holds the callback NAME
% as a char. Confirmed against MathWorks' own apps (addRuleDialog.mlapp stores
% ButtonPushedFcn = 'okButtonPushed'). A createCallbackFcn handle closes over the app
% object, cannot be saved, and so never round-trips - which leaves the control dead.
fprintf('\n--- 4. controls carry their callback name ---------------------\n');
for b = findall(appData.components.UIFigure,'Type','uibutton')'
    fprintf('   %-14s ButtonPushedFcn = %s\n', ...
        b.DesignTimeProperties.CodeName, b.ButtonPushedFcn);
    assert(ischar(b.ButtonPushedFcn) && ~isempty(b.ButtonPushedFcn), ...
        '%s holds a %s callback, not the callback name as a char', ...
        b.DesignTimeProperties.CodeName, class(b.ButtonPushedFcn));
    assert(any(strcmp(names, b.ButtonPushedFcn)), ...
        '%s points at %s, which is not in the Callbacks model', ...
        b.DesignTimeProperties.CodeName, b.ButtonPushedFcn);
end

fprintf('\nROUND TRIP SAFE\n');
