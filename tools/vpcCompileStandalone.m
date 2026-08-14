function outDir = vpcCompileStandalone(varargin)
%VPCCOMPILESTANDALONE Package the app as a desktop .exe, optionally with an installer.
%
%   outDir = VPCCOMPILESTANDALONE() builds dist/standalone/VesselCertApp.exe.
%   outDir = VPCCOMPILESTANDALONE('Installer', true) also builds a self-extracting
%   installer next to it.
%
%   Use this instead of the Application Compiler GUI (deploytool). The GUI seeds the
%   installer's ApplicationName from the app's metadata Name, so if that is blank the
%   packaging step fails LATE - after mcc has already succeeded - with
%
%       Error using compiler.internal.validate.cliName
%       Value must be text with one or more characters.
%       Error in compiler.package.InstallerOptions/set.ApplicationName
%
%   Here every name is passed explicitly, so it cannot happen. vpcBuildApp also sets
%   the metadata Name, which fixes the GUI path as well.
%
%   For MATLAB Web App Server use vpcCompileWebApp instead - that produces the .ctf.
%
%   See also vpcCompileWebApp, vpcBuildApp.

p = inputParser;
p.addParameter('Installer', false, @(x) islogical(x) || isnumeric(x));
p.parse(varargin{:});
makeInstaller = logical(p.Results.Installer);

root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root,'vpcSetup.m'));

if isempty(mex.getCompilerConfigurations('C','Selected'))
    error('vpc:noCompiler', ...
        ['No C compiler is selected. Simulink Compiler must build a Rapid ' ...
         'Accelerator target, which needs one. Run "mex -setup:mingw64 C".']);
end

% Rebuild the model and the .mlapp so the artifact can never be stale.
vpcBuildModel();
appFile = vpcBuildApp();

outDir  = fullfile(root,'dist','standalone');
mdlFile = fullfile(root,'models','vesselPowerCert.slx');

srcFiles = dir(fullfile(root,'src','*.m'));
extra    = [{mdlFile}, fullfile({srcFiles.folder}, {srcFiles.name})];

fprintf('vpc: building standalone application\n');
buildResults = compiler.build.standaloneApplication(appFile, ...
    'ExecutableName',    'VesselCertApp', ...
    'ExecutableVersion', '1.0', ...
    'AdditionalFiles',   extra, ...
    'OutputDir',         outDir, ...
    'Verbose',           'on');

fprintf('vpc: built %s\n', strjoin(buildResults.Files, ', '));

if makeInstaller
    fprintf('vpc: building installer\n');
    % ApplicationName is given explicitly - this is the value the GUI leaves empty.
    compiler.package.installer(buildResults, ...
        'ApplicationName', 'Vessel Electrical Power System Verification', ...
        'AuthorName',      'TechSource Asia', ...
        'Version',         '1.0', ...
        'OutputDir',       fullfile(outDir,'installer'));
    fprintf('vpc: installer in %s\n', fullfile(outDir,'installer'));
end
end
