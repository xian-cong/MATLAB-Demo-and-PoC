#include "ex_mass_spring_damper_appdemo_capi_host.h"
static ex_mass_spring_damper_appdemo_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        ex_mass_spring_damper_appdemo_host_InitializeDataMapInfo(&(root), "ex_mass_spring_damper_appdemo");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}
