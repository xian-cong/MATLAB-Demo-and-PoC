#ifndef soc_dvbs2_fpga_cap_host_h__
#define soc_dvbs2_fpga_cap_host_h__
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap_simtarget.h"
typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
soc_dvbs2_fpga_host_DataMapInfo_T ;
#ifdef __cplusplus
extern "C" {
#endif
void soc_dvbs2_fpga_host_InitializeDataMapInfo ( soc_dvbs2_fpga_host_DataMapInfo_T * dataMap , const char * path ) ;
#ifdef __cplusplus
}
#endif
#endif
#endif
