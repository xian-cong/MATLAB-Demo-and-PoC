appFolder = fullfile(fileparts(mfilename("fullpath")), '..');
mlappFile = fullfile(appFolder, 'ex_mass_spring_damper_appdemo_SLSimApp');
run(mlappFile);
