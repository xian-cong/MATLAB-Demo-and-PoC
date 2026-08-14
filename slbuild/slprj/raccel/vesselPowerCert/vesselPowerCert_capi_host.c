#include "vesselPowerCert_capi_host.h"
static vesselPowerCert_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        vesselPowerCert_host_InitializeDataMapInfo(&(root), "vesselPowerCert");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}
