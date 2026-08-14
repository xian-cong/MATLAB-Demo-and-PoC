function outDir = vpcCompileWebApp()
%VPCCOMPILEWEBAPP Package the app as a .ctf for MATLAB Web App Server.
%
%   outDir = VPCCOMPILEWEBAPP() builds dist/VesselCertApp.ctf and returns the
%   output folder. Requires MATLAB Compiler and Simulink Compiler, plus a C
%   compiler for the Rapid Accelerator target (vpcSetup wires up MinGW-w64).
%
%   Deploy by copying the .ctf into the Web App Server apps folder, or by
%   uploading it through the server's home page.
%
%   Notes that matter for this particular archive:
%     * The .slx must be listed in AdditionalFiles. Dependency analysis follows
%       .m files but will not pull in the model on its own.
%     * Every variant choice is compiled in, because the model's Variant
%       Subsystems use 'startup' activation. The active choice is then selected
%       per run from a plain numeric variant control, which is all a deployed
%       archive is permitted to set.
%     * Do not run this from a folder containing .slx/.slxc artifacts: Simulink
%       refuses to start when the working folder can shadow the cache folder.

root = fileparts(fileparts(mfilename('fullpath')));
run(fullfile(root,'vpcSetup.m'));

if isempty(mex.getCompilerConfigurations('C','Selected'))
    error('vpc:noCompiler', ...
        ['No C compiler is selected. Simulink Compiler must build a Rapid ' ...
         'Accelerator target, which needs one. Install MATLAB Support for ' ...
         'MinGW-w64 from the Add-On Explorer, then run "mex -setup:mingw64 C".']);
end

% Rebuild the model and the .mlapp so the archive can never contain a stale one,
% and verify the saved model is deployment-safe before packaging it.
vpcBuildModel();
vpcCheckModelDeployable();
appFile = vpcBuildApp();

outDir  = fullfile(root,'dist');
mdlFile = fullfile(root,'models','vesselPowerCert.slx');

assert(isfile(appFile), 'vpc:noApp', 'Missing %s', appFile);
assert(isfile(mdlFile), 'vpc:noModel','Missing %s', mdlFile);

% The .mlapp is the only VesselCertApp on the path - the source .m lives in
% app/source/, which is deliberately not on it - so no path juggling is needed.

% Only src/ is packaged. tools/ holds the model-authoring code, which calls
% add_block, new_system, sfroot and similar - none of which exist in the MATLAB
% Runtime. Packaging it would put functions in the archive that error if reached.
srcFiles = dir(fullfile(root,'src','*.m'));
extra    = [{mdlFile}, fullfile({srcFiles.folder}, {srcFiles.name})];

fprintf('vpc: packaging %d additional files\n', numel(extra));

results = compiler.build.webAppArchive(appFile, ...
    'ArchiveName',    'VesselCertApp', ...
    'AdditionalFiles', extra, ...
    'OutputDir',       outDir, ...
    'Verbose',         'on');

disp(results);
fprintf('vpc: built %s\n', fullfile(outDir,'VesselCertApp.ctf'));
end

