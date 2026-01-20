#ifndef modelPOC_h_
#define modelPOC_h_
#ifndef modelPOC_COMMON_INCLUDES_
#define modelPOC_COMMON_INCLUDES_
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
#include "modelPOC_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME modelPOC
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (6) 
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
typedef struct { real_T grxqxvaajm ; real_T fvikeacnp0 ; real_T puquenghkh ;
real_T f1evgwrbws ; real_T lohznyohq2 ; } B ; typedef struct { real_T
i4liaful5p ; real_T dz2bysqm4u [ 3 ] ; real_T n35xtwt1zw ; struct { void *
LoggedData ; } eyl35ts25g ; struct { void * AQHandles ; } ev4e5npa3g ; FILE *
guxskfve52 [ 20 ] ; int32_T j4k22rsdlf ; boolean_T eiklvqx4rv ; boolean_T
pcb4fzgcq2 ; boolean_T khrq23l4j3 ; boolean_T ll02nwfsag ; boolean_T
dtrbizkpbl ; boolean_T m14pj11gfx [ 20 ] ; boolean_T h21qkcgyn2 ; } DW ;
typedef struct { rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ {
real_T gain ; real_T k ; } ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR
; extern B rtB ; extern DW rtDW ; extern P rtP ; extern mxArray *
mr_modelPOC_GetDWork ( ) ; extern void mr_modelPOC_SetDWork ( const mxArray *
ssDW ) ; extern mxArray * mr_modelPOC_GetSimStateDisallowedBlocks ( ) ;
extern const rtwCAPI_ModelMappingStaticInfo * modelPOC_GetCAPIStaticMap ( void
) ; extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T
tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
