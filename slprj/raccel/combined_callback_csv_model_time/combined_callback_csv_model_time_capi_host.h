#ifndef combined_callback_csv_model_time_cap_host_h__
#define combined_callback_csv_model_time_cap_host_h__
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap_simtarget.h"
typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
combined_callback_csv_model_time_host_DataMapInfo_T ;
#ifdef __cplusplus
extern "C" {
#endif
void combined_callback_csv_model_time_host_InitializeDataMapInfo ( combined_callback_csv_model_time_host_DataMapInfo_T * dataMap , const char * path ) ;
#ifdef __cplusplus
}
#endif
#endif
#endif
