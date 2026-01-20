appFolder = fullfile(fileparts(mfilename("fullpath")), '..');
deployFolder = fullfile(appFolder, 'deployedDesktopApp');
assert(isfolder(deployFolder), 'Run ''ex_mass_spring_damper_appdemo_SLSimApp_AppUtils.deployDesktopApp'' first.');
system(fullfile(deployFolder, "ex_mass_spring_damper_appdemo_SLSimApp.exe"));
