#ifndef combined_callback_csv_model_time_h_
#define combined_callback_csv_model_time_h_
#ifndef combined_callback_csv_model_time_COMMON_INCLUDES_
#define combined_callback_csv_model_time_COMMON_INCLUDES_
#include <stdlib.h>
#include <stdio.h>
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "rt_nonfinite.h"
#include "math.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "combined_callback_csv_model_time_types.h"
#include "rtGetInf.h"
#include "rtGetNaN.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME combined_callback_csv_model_time
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (5) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (0)   
#elif NCSTATES != 0
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T poxri3wtke ; real_T etgsmphc5e ; real_T ncp5gyco2d ;
real_T lcvd0aicnn ; } B ; typedef struct { cd2dzkdecn nj0lv2gakn ; real_T
afbjd3fcyw ; struct { void * LoggedData ; } ffw3heaqse ; struct { void *
AQHandles ; } ks2x0wirea ; struct { void * AQHandles ; } feygycuvor ; FILE *
lzx2ujr2wx [ 20 ] ; int32_T n2pshw2rq4 ; boolean_T k0v1i1vvzi ; boolean_T
bcsdplrxv3 ; boolean_T obcwuqe35e ; boolean_T anayeprvvy ; boolean_T
h4d1qqr3xt [ 20 ] ; boolean_T lpsf3olmxz ; } DW ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
amplitude_param ; real_T frequency_param ; real_T Gain1_Gain ; real_T
Gain2_Gain ; real_T Gain3_Gain ; real_T SineWave_Bias ; real_T SineWave_Phase
; } ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ;
extern DW rtDW ; extern P rtP ; extern mxArray *
mr_combined_callback_csv_model_time_GetDWork ( ) ; extern void
mr_combined_callback_csv_model_time_SetDWork ( const mxArray * ssDW ) ;
extern mxArray *
mr_combined_callback_csv_model_time_GetSimStateDisallowedBlocks ( ) ; extern
const rtwCAPI_ModelMappingStaticInfo *
combined_callback_csv_model_time_GetCAPIStaticMap ( void ) ; extern SimStruct
* const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ; extern
rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid )
; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T
tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
