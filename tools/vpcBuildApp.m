function mlappPath = vpcBuildApp(targetPath)
%VPCBUILDAPP Generate a round-trip-safe .mlapp from app/VesselCertApp.m.
%
%   mlappPath = VPCBUILDAPP() writes app/VesselCertApp.mlapp.
%   mlappPath = VPCBUILDAPP(targetPath) writes it somewhere else.
%
%   Unlike a plain code-text conversion, this populates App Designer's STRUCTURED
%   CODE MODEL as well as the class text, so App Designer can save the file
%   without destroying it.
%
%   WHY THAT MATTERS
%   App Designer keeps an app as (component tree + code model), where the code
%   model holds the user's editable section and callbacks separately from the
%   generated component code. Writing only the class text - which is all that
%   MLAPPSerializer.MatlabCodeText does - leaves that model empty. App Designer
%   then believes the app has no user code, and the moment it saves (its Run button
%   saves) it regenerates the class from the component tree alone and silently
%   discards every hand-written property, callback and method. The app still opens
%   and still looks right; its buttons do nothing.
%
%   So this function also sets:
%     EditableSectionCode - the user properties and helper methods, taken as the
%                           text between App Designer's two managed blocks
%     Callbacks           - each callback's name and body
%     StartupCallback     - startupFcn
%
%   This requires app/VesselCertApp.m to keep App Designer's canonical block
%   order, because that is how the parser finds the editable section:
%
%       classdef ... < matlab.apps.AppBase
%           properties (Access = public)     % components, incl. UIFigure  <-- leading
%           ...user properties...                                         <-- editable
%           methods (Access = private)  ...helper functions...             <-- editable
%           methods (Access = private)  ...callbacks...                    <-- trailing
%           methods (Access = private)  createComponents                   regenerated
%           methods (Access = public)   constructor, delete                regenerated
%
%   Callbacks must be named methods with an (app, event) signature, wired in
%   createComponents with createCallbackFcn - not anonymous handles, which App
%   Designer cannot represent.
%
%   Uses undocumented internal APIs (appdesigner.internal.*). Verified on R2026a.
%   vpcCheckAppIntegrity re-reads the result and fails loudly if anything is lost.
%
%   See also vpcCheckAppIntegrity, vpcCompileWebApp, VesselCertApp.

root = fileparts(fileparts(mfilename('fullpath')));
srcM = fullfile(root,'app','source','VesselCertApp.m');
assert(isfile(srcM), 'vpc:noSource', 'Missing app source: %s', srcM);

if nargin < 1 || isempty(targetPath)
    targetPath = fullfile(root,'app','VesselCertApp.mlapp');
end
outDir = fileparts(targetPath);
if ~isfolder(outDir); mkdir(outDir); end

className = 'VesselCertApp'; %#ok<NASGU>
codeText  = fileread(srcM);

% Which callback belongs to which component: {callbackName, componentName, property}.
% Without this association App Designer lists the callbacks as orphans
% ("... is not associated with a component"), never wires them to the controls, and
% clicking the button does nothing.
wiring = { 'ResetButtonPushed', 'ResetButton', 'ButtonPushedFcn'
           'RunButtonPushed',   'RunButton',   'ButtonPushedFcn' };

% ---------------------------------------------------------------- instantiate --
% Serialize a live figure, so the component tree is real rather than reconstructed.
% The source folder must win over any existing .mlapp of the same name.
srcDir = fullfile(root,'app','source');
if isfile(targetPath)
    % Move it aside so "VesselCertApp" resolves to the .m during instantiation.
    stash = [targetPath '.stash'];
    movefile(targetPath, stash);
    restoreStash = onCleanup(@() deleteIfPresent(stash)); %#ok<NASGU>
end
addpath(srcDir);
restoreSrcPath = onCleanup(@() rmpathQuiet(srcDir)); %#ok<NASGU>
% MATLAB caches a class by the path it was first loaded from; after moving the
% .mlapp aside and adding the source folder, force it to look again or it errors
% with "Previously accessible file ... is now inaccessible".
rehash path
clear VesselCertApp

figsBefore = findall(0,'Type','figure');
app = VesselCertApp();
fig = setdiff(findall(0,'Type','figure'), figsBefore);
assert(~isempty(fig), 'vpc:noFigure', 'Instantiating the app produced no figure.');
fig = fig(1);
closeFig = onCleanup(@() deleteIfValid(fig));

% -------------------------------------------------------------- name components --
vpcTagDesignTimeNames(app);

% ------------------------------------------------- design-time callback values --
% Replace each live callback function handle with the callback NAME as a char, which
% is how App Designer represents callbacks on a design-time component.
%
% Two things go wrong otherwise. The handle produced by createCallbackFcn closes over
% the app object, and saving that fails - "Unable to save App Designer app object.
% Save not supported for matlab.apps.AppBase objects." - so the value does not
% round-trip. App Designer then finds no callback on the component, treats the
% callback as an orphan and drops it, and the control comes back unwired.
%
% This only affects the serialized design-time tree. Running the app executes
% createComponents, which wires the real handles through createCallbackFcn.
for k = 1:size(wiring,1)
    app.(wiring{k,2}).(wiring{k,3}) = wiring{k,1};
end

% ------------------------------------------------------------------ code model --
[callbacks, startupCallback, editableSection] = ...
    vpcParseCodeModel(codeText, wiring, app);

fprintf('vpc: %d callbacks + startupFcn, %d editable-section lines\n', ...
    numel(callbacks), numel(editableSection));
assert(~any(strcmp({callbacks.Name},'startupFcn')), 'vpc:duplicateStartup', ...
    'startupFcn must live only in StartupCallback, never also in Callbacks.');
assert(~isempty(callbacks), 'vpc:noCallbacks', ...
    'No callbacks parsed - App Designer would drop them on save.');
assert(~isempty(editableSection), 'vpc:noEditable', ...
    'Editable section came back empty - check the block order in %s.', srcM);

% ---------------------------------------------------------------------- write --
s = appdesigner.internal.serialization.MLAPPSerializer(targetPath, fig);
s.MatlabCodeText       = codeText;
s.ClassName            = className;

% App metadata - the "SHARING DETAILS" fields in App Designer. Name must not be
% empty: the Application Compiler seeds the installer's ApplicationName from it, and
% packaging an app with a blank Name dies late, after mcc has already succeeded, with
%   Error using compiler.internal.validate.cliName
%   Value must be text with one or more characters.
% Spaces are allowed here, but folder-hostile characters and / \ are not.
s.Metadata.Name        = 'Vessel Electrical Power System Verification';
s.Metadata.Version     = '1.0';
s.Metadata.Author      = 'TechSource Asia';
s.Metadata.Summary     = 'Verify a vessel electrical power system against acceptance criteria.';
s.Metadata.Description = ['Select the fitted variant of each major component, enter ' ...
    'the vessel particulars and operating profile, simulate the voyage, and read a ' ...
    'pass/fail verification report. Front end for the Simulink model vesselPowerCert.'];
s.EditableSectionCode  = editableSection;
s.Callbacks            = callbacks;
s.StartupCallback      = startupCallback;
s.OverwriteTargetFile  = true;
s.save();

clear closeFig                 % release the figure before validating
if isvalid(app) && isvalid(app.UIFigure)
    delete(app.UIFigure);      % not delete(app): the class may already be cleared
end
clear app
clear VesselCertApp

vpcCheckAppIntegrity(targetPath);
mlappPath = targetPath;
end

% =========================================================================
function [callbacks, startupCallback, editableSection] = vpcParseCodeModel(codeText, wiring, app)
%VPCPARSECODEMODEL Split the class text into App Designer's code model pieces.
%
% Uses App Designer's own PlainTextCodeParser so the editable section is found the
% same way App Designer finds it: everything between the component properties block
% (the "leading" managed block, identified by the property typed matlab.ui.Figure)
% and the callbacks block (the "trailing" managed block).
%
% Callbacks are returned as appdesigner.internal.codegeneration.model.AppCallback
% objects, each carrying the CallbackComponentData that ties it to a component.
% Plain name/code structs are not enough: App Designer reports such callbacks as
% "not associated with a component", leaves them unwired, and the buttons do
% nothing when clicked.

% One string scalar containing newlines - the parser indexes it by absolute
% character position, so a string array of lines would break it.
parser = appdesigner.internal.serialization.PlainTextCodeParser(string(codeText));

% Callback names, in the order App Designer lists them.
names = wiring(:,1)';
cbNames = struct('Name', {}, 'Code', {});
for k = 1:numel(names)
    cbNames(end+1).Name = names{k}; %#ok<AGROW>
    cbNames(end).Code = '';
end

% startupFcn is modelled separately, in StartupCallback. Follow App Designer's own
% sequence (see PlainTextCodeParser.parseCodeData): include it while matching names
% and ordering, then REMOVE it from Callbacks. Leaving it in both places makes the
% regenerated class define startupFcn twice, and App Designer reports
% "'startupFcn' is already defined as a method in the 'VesselCertApp' class."
startupCallback = struct('Name','startupFcn','Code','');
startupCallback.Code = parser.getCallbackCode('startupFcn');

cbNames = [cbNames startupCallback];

% processUserChanges returns the editable section and may reorder callbacks to
% match their order of appearance in the file.
[editableSection, cbNames] = parser.processUserChanges(cbNames, "Standard");
callbacks = parser.addCallbackCode(cbNames);

callbacks(strcmp({callbacks.Name}, 'startupFcn')) = [];

% Callbacks stay PLAIN STRUCTS of Name + Code, with Code a cell array of body
% lines. That is exactly the format MathWorks' own App Designer apps use - verified
% by reading e.g. matlabroot/toolbox/matlab/datatools/.../addRuleDialog.mlapp, whose
% code model is a struct array with only those two fields. Component association is
% NOT carried here; it comes from the char callback value on the component itself.
for k = 1:numel(callbacks)
    assert(any(strcmp(wiring(:,1), callbacks(k).Name)), 'vpc:unwiredCallback', ...
        'Callback %s has no entry in the wiring table.', callbacks(k).Name);
    if ischar(callbacks(k).Code)
        callbacks(k).Code = splitlines(callbacks(k).Code);
    end
end

if ischar(startupCallback.Code)
    startupCallback.Code = splitlines(startupCallback.Code);
end

if ischar(editableSection); editableSection = splitlines(editableSection); end
end

% =========================================================================
function vpcTagDesignTimeNames(app)
%VPCTAGDESIGNTIMENAMES Stamp each component with the property name that holds it.
%
% App Designer's code generator names each line of createComponents from
% DesignTimeProperties.CodeName, not from the MATLAB property name. Components
% created by ordinary uilabel/uibutton calls carry no such tag, and without it the
% generated code reads "app. = uilabel(...)".
%
% struct() is used deliberately to reach private properties too.

warning('off','MATLAB:structOnObject');
restore = onCleanup(@() warning('on','MATLAB:structOnObject'));
s = struct(app);

for f = fieldnames(s)'
    val = s.(f{1});
    if ~isscalar(val) || ~isobject(val); continue; end
    isHandle = false;
    try
        isHandle = isvalid(val) && isgraphics(val);
    catch
        % Not a graphics handle for this type - skip.
    end
    if ~isHandle; continue; end

    if ~isprop(val,'DesignTimeProperties')
        addprop(val,'DesignTimeProperties');
    end
    dtp = appdesigner.internal.model.DesignTimeProperties;
    dtp.CodeName = f{1};
    val.DesignTimeProperties = dtp;
end
end

% =========================================================================
function deleteIfValid(h)
if ~isempty(h) && isvalid(h); delete(h); end
end

function deleteIfPresent(p)
if isfile(p); delete(p); end
end

function rmpathQuiet(d)
warning('off','MATLAB:rmpath:DirNotFound');
rmpath(d);
warning('on','MATLAB:rmpath:DirNotFound');
end
