#ifndef ex_mass_spring_damper_appdemo_cap_host_h__
#define ex_mass_spring_damper_appdemo_cap_host_h__
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap_simtarget.h"
typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
ex_mass_spring_damper_appdemo_host_DataMapInfo_T ;
#ifdef __cplusplus
extern "C" {
#endif
void ex_mass_spring_damper_appdemo_host_InitializeDataMapInfo ( ex_mass_spring_damper_appdemo_host_DataMapInfo_T * dataMap , const char * path ) ;
#ifdef __cplusplus
}
#endif
#endif
#endif
