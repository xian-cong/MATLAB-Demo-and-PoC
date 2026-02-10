#include "callback_demo_with_callbacks_capi_host.h"
static callback_demo_with_callbacks_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        callback_demo_with_callbacks_host_InitializeDataMapInfo(&(root), "callback_demo_with_callbacks");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}
