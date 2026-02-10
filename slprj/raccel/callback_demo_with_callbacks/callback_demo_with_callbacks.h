#ifndef callback_demo_with_callbacks_h_
#define callback_demo_with_callbacks_h_
#ifndef callback_demo_with_callbacks_COMMON_INCLUDES_
#define callback_demo_with_callbacks_COMMON_INCLUDES_
#include <stdlib.h>
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
#include "callback_demo_with_callbacks_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME callback_demo_with_callbacks
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (2) 
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
typedef struct { real_T mi20eog3jc ; real_T cdt5x2jgx1 ; } B ; typedef struct
{ real_T fpqj25wsrt ; real_T pokkkafnbh ; struct { void * LoggedData ; }
jl0jjtrsso ; struct { void * AQHandles ; } kj5mlmmepk ; struct { void *
AQHandles ; } euoyjpwryv ; } DW ; typedef struct { rtwCAPI_ModelMappingInfo
mmi ; } DataMapInfo ; struct P_ { real_T amplitude_param ; real_T
frequency_param ; real_T gain_param ; real_T SineWave_Bias ; real_T
SineWave_Phase ; real_T Filter_NumCoef ; real_T Filter_DenCoef [ 2 ] ; real_T
Filter_InitialStates ; } ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR ;
extern B rtB ; extern DW rtDW ; extern P rtP ; extern mxArray *
mr_callback_demo_with_callbacks_GetDWork ( ) ; extern void
mr_callback_demo_with_callbacks_SetDWork ( const mxArray * ssDW ) ; extern
mxArray * mr_callback_demo_with_callbacks_GetSimStateDisallowedBlocks ( ) ;
extern const rtwCAPI_ModelMappingStaticInfo *
callback_demo_with_callbacks_GetCAPIStaticMap ( void ) ; extern SimStruct *
const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ; extern
rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid )
; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T
tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
