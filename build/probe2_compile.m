% probe2_compile.m
loc = 'C:\ProgramData\MATLAB\SupportPackages\R2026a\3P.instrset\mingw_w64.instrset';
if isempty(getenv('MW_MINGW64_LOC')) && isfolder(loc)
    setenv('MW_MINGW64_LOC', loc);
end
cd(fileparts(mfilename('fullpath')));
outDir = fullfile(pwd,'probe2_out');
if isfolder(outDir); rmdir(outDir,'s'); end

compiler.build.standaloneApplication('probe2_entry.m', ...
    'AdditionalFiles', {'probe_A.slx','probe_B.slx','probe_C.slx'}, ...
    'OutputDir', outDir);

fprintf('PROBE2_COMPILE_OK\n');
