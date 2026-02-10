#include "combined_callback_csv_model_time_capi_host.h"
static combined_callback_csv_model_time_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        combined_callback_csv_model_time_host_InitializeDataMapInfo(&(root), "combined_callback_csv_model_time");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}
