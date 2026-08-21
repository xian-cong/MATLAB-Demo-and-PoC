function vpcSetup()
%VPCSETUP Put this demo's folders on the MATLAB path for the current session.
%
%   Run this once after opening MATLAB in the project folder, before building the
%   model or compiling. It also points MEX at the bundled MinGW-w64 compiler,
%   which Simulink Compiler needs in order to build the Rapid Accelerator target
%   that deployment depends on.
%
%   Launching the app does NOT require this: VesselCertApp puts its own
%   dependencies on the path when it starts.

root = fileparts(mfilename('fullpath'));
% src  = runtime code, packaged into the .ctf
% tools = model-authoring code, desktop only (uses add_block, sfroot, new_system
%         and friends, none of which exist in the MATLAB Runtime)
% app/ holds VesselCertApp.mlapp - the app itself. Its generator source lives in
% app/source/ and is deliberately NOT added, so that exactly one VesselCertApp is
% ever resolvable (MATLAB cannot have VesselCertApp.m and VesselCertApp.mlapp both
% on the path). Regenerate the .mlapp from that source with vpcBuildApp.
addpath(fullfile(root,'src'));
addpath(fullfile(root,'tools'));
addpath(fullfile(root,'app'));
addpath(fullfile(root,'models'));

% Keep generated code inside this project. Simulink otherwise drops an slprj
% folder next to the current working folder, which on this machine collides with a
% cache left by unrelated models built under an older release - and a cache from a
% different release is a hard error, not a warning.
% It must NOT live under a folder scripts run from: Simulink refuses to start if
% the working folder contains artifacts that could shadow the cache folder.
genDir = fullfile(root,'.slcache');
if ~isfolder(genDir); mkdir(genDir); end
Simulink.fileGenControl('set', 'CacheFolder', genDir, ...
                        'CodeGenFolder', genDir, 'createDir', true);

% Simulink Compiler builds a Rapid Accelerator target, which requires a C
% compiler. MinGW-w64 ships as a MATLAB add-on but MW_MINGW64_LOC is not always
% visible to MATLAB, in which case mex reports no compiler at all and the
% deployment build fails with "No supported compiler detected".
% Locate MinGW-w64. Both matlabshared.supportpkg.getSupportPackageRoot and the
% PROGRAMDATA environment variable come back empty when MATLAB is launched with a
% stripped environment (which is what happens under the MCP server), so try
% several roots rather than trusting either one.
if isempty(getenv('MW_MINGW64_LOC'))
    rel   = ['R' version('-release')];
    roots = {};
    try
        r = matlabshared.supportpkg.getSupportPackageRoot;
        if ~isempty(r); roots{end+1} = r; end
    catch
        % Function is absent on some installs; fall through to the fixed roots.
    end
    if ~isempty(getenv('PROGRAMDATA'))
        roots{end+1} = fullfile(getenv('PROGRAMDATA'),'MATLAB','SupportPackages',rel);
    end
    roots{end+1} = fullfile('C:','ProgramData','MATLAB','SupportPackages',rel);

    for k = 1:numel(roots)
        loc = fullfile(roots{k},'3P.instrset','mingw_w64.instrset');
        if isfolder(loc)
            setenv('MW_MINGW64_LOC', loc);
            break
        end
    end
end

fprintf('vpc: path configured (%s)\n', root);

% Selecting the compiler is persistent, but it only resolves while
% MW_MINGW64_LOC is set, so re-select whenever it is not already visible.
if isempty(mex.getCompilerConfigurations('C','Selected'))
    if isempty(getenv('MW_MINGW64_LOC'))
        fprintf('vpc: WARNING MinGW-w64 not found; install it from the Add-On Explorer\n');
    else
        evalc('mex(''-setup:mingw64'',''C'')');
    end
end

c = mex.getCompilerConfigurations('C','Selected');
if isempty(c)
    fprintf('vpc: WARNING no C compiler - Simulink Compiler deployment will fail\n');
else
    fprintf('vpc: C compiler = %s\n', c(1).Name);
end
end
