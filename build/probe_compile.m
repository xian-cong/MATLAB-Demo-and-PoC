% probe_compile.m -- compile the variant probe with Simulink Compiler
%
% Simulink Compiler builds a Rapid Accelerator target, which needs a C compiler.
% MinGW-w64 is installed as an add-on but MW_MINGW64_LOC is not visible to MATLAB,
% so set it explicitly or the build fails with "No supported compiler detected".
loc = 'C:\ProgramData\MATLAB\SupportPackages\R2026a\3P.instrset\mingw_w64.instrset';
if isempty(getenv('MW_MINGW64_LOC')) && isfolder(loc)
    setenv('MW_MINGW64_LOC', loc);
end

cd(fileparts(mfilename('fullpath')));
outDir = fullfile(pwd,'probe_out');
if isfolder(outDir); rmdir(outDir,'s'); end

r = compiler.build.standaloneApplication( ...
        'probe_deploy_entry.m', ...
        'AdditionalFiles', {'probe_variant.slx'}, ...
        'OutputDir', outDir, ...
        'Verbose','on');

disp(r);
fprintf('PROBE_COMPILE_OK\n');
