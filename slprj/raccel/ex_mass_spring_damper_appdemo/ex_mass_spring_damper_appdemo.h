#ifndef ex_mass_spring_damper_appdemo_h_
#define ex_mass_spring_damper_appdemo_h_
#ifndef ex_mass_spring_damper_appdemo_COMMON_INCLUDES_
#define ex_mass_spring_damper_appdemo_COMMON_INCLUDES_
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
#include "ex_mass_spring_damper_appdemo_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#include "rtGetInf.h"
#define MODEL_NAME ex_mass_spring_damper_appdemo
#define NSAMPLE_TIMES (2) 
#define NINPUTS (1)       
#define NOUTPUTS (0)     
#define NBLOCKIO (6) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (2)   
#elif NCSTATES != 2
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
typedef struct { real_T oixnewwmzh ; real_T ks4ezanlyc ; real_T kb3mh0zcfj ;
real_T f2pdb3lhrp ; real_T ahfva3cpdk ; real_T hougw1gy15 ; } B ; typedef
struct { struct { void * AQHandles ; } bfbel10olh ; struct { void * AQHandles
; } oldmdbjs1r ; struct { void * AQHandles ; } fyjfufhnwn ; struct { void *
LoggedData ; } izrdodcpto ; } DW ; typedef struct { real_T nnmrj1tmah ;
real_T i41kv0u5az ; } X ; typedef struct { real_T nnmrj1tmah ; real_T
i41kv0u5az ; } XDot ; typedef struct { boolean_T nnmrj1tmah ; boolean_T
i41kv0u5az ; } XDis ; typedef struct { real_T nnmrj1tmah ; real_T i41kv0u5az
; } CStateAbsTol ; typedef struct { real_T nnmrj1tmah ; real_T i41kv0u5az ; }
CXPtMin ; typedef struct { real_T nnmrj1tmah ; real_T i41kv0u5az ; } CXPtMax
; typedef struct { real_T mqrudzltlm ; } ExtU ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T b ; real_T
k ; real_T m ; real_T Integrator1_IC ; real_T Integrator2_IC ; } ; extern
const char_T * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ;
extern DW rtDW ; extern ExtU rtU ; extern P rtP ; extern mxArray *
mr_ex_mass_spring_damper_appdemo_GetDWork ( ) ; extern void
mr_ex_mass_spring_damper_appdemo_SetDWork ( const mxArray * ssDW ) ; extern
mxArray * mr_ex_mass_spring_damper_appdemo_GetSimStateDisallowedBlocks ( ) ;
extern const rtwCAPI_ModelMappingStaticInfo *
ex_mass_spring_damper_appdemo_GetCAPIStaticMap ( void ) ; extern SimStruct *
const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ; extern
rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid )
; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T
tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
