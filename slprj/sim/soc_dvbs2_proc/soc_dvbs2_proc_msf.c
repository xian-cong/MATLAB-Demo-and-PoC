#if !defined(S_FUNCTION_NAME)
#define S_FUNCTION_NAME soc_dvbs2_proc_msf
#endif
#define S_FUNCTION_LEVEL 2
#if !defined(RTW_GENERATED_S_FUNCTION)
#define RTW_GENERATED_S_FUNCTION
#endif
#define S_FUNCTION_EXPORTS_FUNCTION_CALLS
#define MODELREF_EXPORTS_FUNCTION_CALLS
#include <stdio.h>
#include <math.h>
#include "simstruc.h"
#include "fixedpoint.h"
#include "mwstringutil.h"
#define rt_logging_h
#include "soc_dvbs2_proc_types.h"
#include "soc_dvbs2_proc.h"
#include "soc_dvbs2_proc_private.h"
real_T rtP_Rsym ; const char * rt_GetMatSignalLoggingFileName ( void ) {
return NULL ; } const char * rt_GetMatSigLogSelectorFileName ( void ) {
return NULL ; } void * rt_GetOSigstreamManager ( void ) { return NULL ; }
void * rt_slioCatalogue ( void ) { return NULL ; } void *
rtwGetPointerFromUniquePtr ( void * uniquePtr ) { return NULL ; } void *
CreateDiagnosticAsVoidPtr ( const char * id , int nargs , ... ) { void *
voidPtrDiagnostic = NULL ; va_list args ; va_start ( args , nargs ) ;
slmrCreateDiagnostic ( id , nargs , args , & voidPtrDiagnostic ) ; va_end ( args
) ; return voidPtrDiagnostic ; } void rt_ssSet_slErrMsg ( void * S , void *
diag ) { SimStruct * simStrcut = ( SimStruct * ) S ; if ( !
_ssIsErrorStatusAslErrMsg ( simStrcut ) ) { _ssSet_slLocalErrMsg ( simStrcut
, diag ) ; } else { _ssDiscardDiagnostic ( simStrcut , diag ) ; } } void
rt_ssReportDiagnosticAsWarning ( void * S , void * diag ) {
_ssReportDiagnosticAsWarning ( ( SimStruct * ) S , diag ) ; } void
rt_ssReportDiagnosticAsInfo ( void * S , void * diag ) {
_ssReportDiagnosticAsInfo ( ( SimStruct * ) S , diag ) ; } const char *
rt_CreateFullPathToTop ( const char * toppath , const char * subpath ) { char
* fullpath = NULL ; slmrCreateFullPathToTop ( toppath , subpath , & fullpath
) ; return fullpath ; } boolean_T slIsRapidAcceleratorSimulating ( void ) {
return false ; } void rt_RAccelReplaceFromFilename ( SimStruct * S , const
char * blockpath , char * fileName ) { ( void ) blockpath ; ( void ) fileName
; } void rt_RAccelReplaceToFilename ( SimStruct * S , const char * blockpath
, char * fileName ) { ( void ) blockpath ; ( void ) fileName ; } void *
slsa_malloc ( size_t s ) { return malloc ( s ) ; } void slsa_free ( void *
ptr ) { free ( ptr ) ; } void slsaCacheDWorkPointerForSimTargetOP ( void * ss
, void * * ptr ) { ( void ) ss ; ( void ) ptr ; } void
slsaCacheDWorkDataForSimTargetOP ( void * ss , void * ptr , unsigned int
sizeInBytes , bool restoreRequiresSolverReset ) { ( void ) ss ; ( void ) ptr
; ( void ) sizeInBytes ; ( void ) restoreRequiresSolverReset ; } void
slsaSaveRawMemoryForSimTargetOP ( void * ss , const char * key , void * * ptr
, unsigned int sizeInBytes , void * ( * customOPSaveFcn ) ( void * dworkPtr ,
unsigned int * sizeInBytes ) , void ( * customOPRestoreFcn ) ( void *
dworkPtr , const void * data , unsigned int sizeInBytes ) ) { ( void ) ss ; ( void ) key ; ( void ) ptr ; ( void ) sizeInBytes ; ( void ) customOPSaveFcn ; ( void ) customOPRestoreFcn ; }
#define MDL_PROCESS_PARAMETERS
#if defined(MATLAB_MEX_FILE)
static void mdlProcessParameters ( SimStruct * S ) { real_T * GlobalPrm_0 = ( real_T * ) NULL ; if ( ! ssGetModelRefGlobalParamData ( S , 0 , ( void * * ) ( & GlobalPrm_0 ) ) ) return ; if ( GlobalPrm_0 != NULL ) { ( void ) memcpy ( & ( rtP_Rsym ) , GlobalPrm_0 , sizeof ( real_T ) ) ; } }
#endif
ssFcnCallErr_T lgljo4flkj_sf ( SimStruct * S , int_T el , int_T idx ) {
lgljo4flkj ( ) ; return SS_FCNCALL_NO_ERR ; } static void
mdlInitializeConditions ( SimStruct * S ) { b1jmqvb420 ( ) ; } static void
mdlReset ( SimStruct * S ) { fsugzgiy4b ( ) ; } static void
mdlPeriodicOutputUpdate ( SimStruct * S , int_T tid ) { if ( tid == 0 ) {
soc_dvbs2_proc ( ) ; jpww0mejvo ( ) ; } } static void mdlInitializeSizes ( SimStruct * S ) { if ( ( S -> mdlInfo -> genericFcn != ( NULL ) ) && ( ! ( S -> mdlInfo -> genericFcn ) ( S , GEN_FCN_CHK_MODELREF_SFUN_HAS_MODEL_BLOCK , - 1 , ( NULL ) ) ) ) { return ; } ssSetNumSFcnParams ( S , 0 ) ; ssFxpSetU32BitRegionCompliant ( S , 1 ) ; if ( S -> mdlInfo -> genericFcn != ( NULL ) ) { _GenericFcn fcn = S -> mdlInfo -> genericFcn ; } ssSetRTWGeneratedSFcn ( S , 2 ) ; ssSetNumContStates ( S , 0 ) ; ssSetNumDiscStates ( S , 0 ) ; ssSetSymbolicDimsSupport ( S , true ) ; slmrInitializeIOPortDataVectors ( S , 12 , 11 ) ; if ( ! ssSetNumInputPorts ( S , 12 ) ) return ; if ( ! ssSetInputPortVectorDimension ( S , 0 , 1 ) ) return ; ssSetInputPortDimensionsMode ( S , 0 , FIXED_DIMS_MODE ) ; ssSetInputPortFrameData ( S , 0 , FRAME_NO ) ; ssSetInputPortDataType ( S , 0 , SS_FCN_CALL ) ; if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 0 , unitIdReg ) ;
#endif
} ssSetInputPortDirectFeedThrough ( S , 0 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 0 , 1 ) ; ssSetInputPortOptimOpts ( S
, 0 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 0 , false )
; ssSetInputPortSampleTime ( S , 0 , - 1 ) ; ssSetInputPortOffsetTime ( S , 0
, rtMinusInf ) ; if ( ! ssSetInputPortVectorDimension ( S , 1 , 1 ) ) return
; ssSetInputPortDimensionsMode ( S , 1 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 1 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 1 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 1 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 1 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 1 , false ) ; ssSetInputPortDirectFeedThrough ( S , 1 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 1 , 1 ) ; ssSetInputPortOptimOpts ( S
, 1 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 1 , false )
; ssSetInputPortSampleTime ( S , 1 , - 1 ) ; ssSetInputPortOffsetTime ( S , 1
, rtMinusInf ) ; if ( ! ssSetInputPortVectorDimension ( S , 2 , 1 ) ) return
; ssSetInputPortDimensionsMode ( S , 2 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 2 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 2 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 2 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 2 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 2 , false ) ; ssSetInputPortDirectFeedThrough ( S , 2 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 2 , 1 ) ; ssSetInputPortOptimOpts ( S
, 2 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 2 , false )
; ssSetInputPortSampleTime ( S , 2 , 0.001 ) ; ssSetInputPortOffsetTime ( S ,
2 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 3 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 3 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 3 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 3 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 3 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 3 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 3 , false ) ; ssSetInputPortDirectFeedThrough ( S , 3 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 3 , 1 ) ; ssSetInputPortOptimOpts ( S
, 3 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 3 , false )
; ssSetInputPortSampleTime ( S , 3 , 0.001 ) ; ssSetInputPortOffsetTime ( S ,
3 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 4 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 4 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 4 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 4 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 4 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 4 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 4 , false ) ; ssSetInputPortDirectFeedThrough ( S , 4 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 4 , 1 ) ; ssSetInputPortOptimOpts ( S
, 4 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 4 , false )
; ssSetInputPortSampleTime ( S , 4 , 0.001 ) ; ssSetInputPortOffsetTime ( S ,
4 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 5 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 5 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 5 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 5 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 5 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 5 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 5 , false ) ; ssSetInputPortDirectFeedThrough ( S , 5 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 5 , 1 ) ; ssSetInputPortOptimOpts ( S
, 5 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 5 , false )
; ssSetInputPortSampleTime ( S , 5 , 0.001 ) ; ssSetInputPortOffsetTime ( S ,
5 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 6 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 6 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 6 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 6 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 6 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 6 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 6 , false ) ; ssSetInputPortDirectFeedThrough ( S , 6 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 6 , 1 ) ; ssSetInputPortOptimOpts ( S
, 6 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 6 , false )
; ssSetInputPortSampleTime ( S , 6 , 0.001 ) ; ssSetInputPortOffsetTime ( S ,
6 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 7 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 7 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 7 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 7 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 7 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 7 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 7 , false ) ; ssSetInputPortDirectFeedThrough ( S , 7 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 7 , 1 ) ; ssSetInputPortOptimOpts ( S
, 7 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 7 , false )
; ssSetInputPortSampleTime ( S , 7 , 0.001 ) ; ssSetInputPortOffsetTime ( S ,
7 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 8 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 8 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 8 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 8 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 8 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 8 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 8 , false ) ; ssSetInputPortDirectFeedThrough ( S , 8 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 8 , 1 ) ; ssSetInputPortOptimOpts ( S
, 8 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 8 , false )
; ssSetInputPortSampleTime ( S , 8 , 0.001 ) ; ssSetInputPortOffsetTime ( S ,
8 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 9 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 9 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 9 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 9 , SS_DOUBLE ) ;
} if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 9 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 9 , 1 ) ; slmsg_ssSetUseInternalQueue ( S
, 9 , false ) ; ssSetInputPortDirectFeedThrough ( S , 9 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 9 , 1 ) ; ssSetInputPortOptimOpts ( S
, 9 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 9 , false )
; ssSetInputPortSampleTime ( S , 9 , 0.001 ) ; ssSetInputPortOffsetTime ( S ,
9 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 10 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 10 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 10 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 10 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 10 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 10 , 1 ) ; slmsg_ssSetUseInternalQueue
( S , 10 , false ) ; ssSetInputPortDirectFeedThrough ( S , 10 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 10 , 1 ) ; ssSetInputPortOptimOpts ( S
, 10 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 10 , false
) ; ssSetInputPortSampleTime ( S , 10 , 0.001 ) ; ssSetInputPortOffsetTime ( S
, 10 , 0.0 ) ; if ( ! ssSetInputPortVectorDimension ( S , 11 , 1 ) ) return ;
ssSetInputPortDimensionsMode ( S , 11 , FIXED_DIMS_MODE ) ;
ssSetInputPortFrameData ( S , 11 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetInputPortDataType ( S , 11 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetInputPortUnit ( S , 11 , unitIdReg ) ;
#endif
} slmsg_ssSetInputPortIsMessage ( S , 11 , 1 ) ; slmsg_ssSetUseInternalQueue
( S , 11 , false ) ; ssSetInputPortDirectFeedThrough ( S , 11 , 1 ) ;
ssSetInputPortRequiredContiguous ( S , 11 , 1 ) ; ssSetInputPortOptimOpts ( S
, 11 , SS_REUSABLE_AND_LOCAL ) ; ssSetInputPortOverWritable ( S , 11 , false
) ; ssSetInputPortSampleTime ( S , 11 , 0.001 ) ; ssSetInputPortOffsetTime ( S
, 11 , 0.0 ) ; if ( ! ssSetNumOutputPorts ( S , 11 ) ) return ; if ( !
ssSetOutputPortVectorDimension ( S , 0 , 1 ) ) return ;
ssSetOutputPortDimensionsMode ( S , 0 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 0 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 0 , SS_BOOLEAN )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 0 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 0 , - 1 ) ; ssSetOutputPortOffsetTime ( S ,
0 , rtMinusInf ) ; slmsg_ssSetOutputPortIsMessage ( S , 0 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 0 , 0 ) ; ssSetOutputPortOkToMerge
( S , 0 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 0 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 0 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 1
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 1 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 1 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 1 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 1 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 1 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 1 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 1 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 1 , 0 ) ; ssSetOutputPortOkToMerge
( S , 1 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 1 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 1 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 2
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 2 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 2 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 2 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 2 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 2 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 2 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 2 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 2 , 0 ) ; ssSetOutputPortOkToMerge
( S , 2 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 2 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 2 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 3
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 3 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 3 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 3 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 3 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 3 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 3 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 3 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 3 , 0 ) ; ssSetOutputPortOkToMerge
( S , 3 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 3 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 3 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 4
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 4 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 4 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 4 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 4 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 4 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 4 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 4 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 4 , 0 ) ; ssSetOutputPortOkToMerge
( S , 4 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 4 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 4 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 5
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 5 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 5 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 5 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 5 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 5 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 5 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 5 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 5 , 0 ) ; ssSetOutputPortOkToMerge
( S , 5 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 5 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 5 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 6
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 6 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 6 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 6 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 6 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 6 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 6 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 6 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 6 , 0 ) ; ssSetOutputPortOkToMerge
( S , 6 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 6 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 6 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 7
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 7 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 7 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 7 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 7 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 7 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 7 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 7 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 7 , 0 ) ; ssSetOutputPortOkToMerge
( S , 7 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 7 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 7 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 8
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 8 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 8 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 8 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 8 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 8 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 8 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 8 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 8 , 0 ) ; ssSetOutputPortOkToMerge
( S , 8 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 8 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 8 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 9
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 9 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 9 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 9 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 9 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 9 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 9 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 9 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 9 , 0 ) ; ssSetOutputPortOkToMerge
( S , 9 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 9 , false
, false , false ) ; ssSetOutputPortOptimOpts ( S , 9 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; if ( ! ssSetOutputPortVectorDimension ( S , 10
, 1 ) ) return ; ssSetOutputPortDimensionsMode ( S , 10 , FIXED_DIMS_MODE ) ;
ssSetOutputPortFrameData ( S , 10 , FRAME_NO ) ; if ( ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { ssSetOutputPortDataType ( S , 10 , SS_DOUBLE )
; } if ( ssGetSimMode ( S ) != SS_SIMMODE_SIZES_CALL_ONLY ) {
#if defined (MATLAB_MEX_FILE)
UnitId unitIdReg ; ssRegisterUnitFromExpr ( S , "" , & unitIdReg ) ; if ( unitIdReg == INVALID_UNIT_ID ) return ; ssSetOutputPortUnit ( S , 10 , unitIdReg ) ;
#endif
} ssSetOutputPortSampleTime ( S , 10 , 0.001 ) ; ssSetOutputPortOffsetTime ( S
, 10 , 0.0 ) ; slmsg_ssSetOutputPortIsMessage ( S , 10 , 1 ) ;
ssSetOutputPortDiscreteValuedOutput ( S , 10 , 0 ) ; ssSetOutputPortOkToMerge
( S , 10 , SS_NOT_OK_TO_MERGE ) ; ssSetOutputPortICAttributes ( S , 10 ,
false , false , false ) ; ssSetOutputPortOptimOpts ( S , 10 ,
SS_NOT_REUSABLE_AND_GLOBAL ) ; ssExportOutputFcn ( S , 0 , lgljo4flkj_sf ) ;
ssSetSimStateCompliance ( S , USE_CUSTOM_SIM_STATE ) ;
mr_soc_dvbs2_proc_RegisterSimStateChecksum ( S ) ; ssSetNumSampleTimes ( S ,
3 ) ; ssSetParameterTuningCompliance ( S , true ) ; ssSetNumRWork ( S , 0 ) ;
ssSetNumIWork ( S , 0 ) ; ssSetNumPWork ( S , 0 ) ; ssSetNumModes ( S , 0 ) ;
{ int_T zcsIdx = 0 ; } ssSetOutputPortIsNonContinuous ( S , 0 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 0 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 1 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 1 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 2 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 2 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 3 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 3 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 4 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 4 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 5 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 5 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 6 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 6 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 7 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 7 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 8 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 8 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 9 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 9 , 0 ) ;
ssSetOutputPortIsNonContinuous ( S , 10 , 0 ) ;
ssSetOutputPortIsFedByBlockWithModesNoZCs ( S , 10 , 0 ) ;
ssSetInputPortIsNotDerivPort ( S , 0 , 1 ) ; ssSetInputPortIsNotDerivPort ( S
, 1 , 1 ) ; ssSetInputPortIsNotDerivPort ( S , 2 , 1 ) ;
ssSetInputPortIsNotDerivPort ( S , 3 , 1 ) ; ssSetInputPortIsNotDerivPort ( S
, 4 , 1 ) ; ssSetInputPortIsNotDerivPort ( S , 5 , 1 ) ;
ssSetInputPortIsNotDerivPort ( S , 6 , 1 ) ; ssSetInputPortIsNotDerivPort ( S
, 7 , 1 ) ; ssSetInputPortIsNotDerivPort ( S , 8 , 1 ) ;
ssSetInputPortIsNotDerivPort ( S , 9 , 1 ) ; ssSetInputPortIsNotDerivPort ( S
, 10 , 1 ) ; ssSetInputPortIsNotDerivPort ( S , 11 , 1 ) ;
ssSetModelReferenceSampleTimeInheritanceRule ( S ,
DISALLOW_SAMPLE_TIME_INHERITANCE ) ; ssSetAcceptsFcnCallInputs ( S ) ;
ssSetModelReferenceNormalModeSupport ( S ,
MDL_START_AND_MDL_PROCESS_PARAMS_OK ) ; ssSupportsMultipleExecInstances ( S ,
false ) ; ssRegisterMsgForNotSupportingMultiExecInst ( S ,
 "<diag_root><diag id=\"Simulink:blocks:BlockDoesNotSupportMultiExecInstances\" pr=\"d\"><arguments><arg type=\"encoded\">cwBvAGMAXwBkAHYAYgBzADIAXwBwAHIAbwBjAC8AZABhAHQAYQBUAGEAcwBrAAAA</arg><arg type=\"encoded\">PABfAF8AaQBpAFMAUwBfAF8APgA8AC8AXwBfAGkAaQBTAFMAXwBfAD4AAAA=</arg><arg type=\"encoded\">PABfAF8AaQB0AGUAcgBCAGwAawBfAF8APgA8AC8AXwBfAGkAdABlAHIAQgBsAGsAXwBfAD4AAAA=</arg></arguments><hs><h>AABAAdCfDEEA</h></hs></diag></diag_root>"
) ; ssHasStateInsideForEachSS ( S , false ) ; ssSetOptions ( S ,
SS_OPTION_ALLOW_CONSTANT_PORT_SAMPLE_TIME |
SS_OPTION_PORT_SAMPLE_TIMES_ASSIGNED | SS_OPTION_SUPPORTS_ALIAS_DATA_TYPES |
SS_OPTION_DISALLOW_CONSTANT_SAMPLE_TIME | SS_OPTION_EXCEPTION_FREE_CODE |
SS_OPTION_WORKS_WITH_CODE_REUSE ) ;
#if SS_SFCN_FOR_SIM
if ( S -> mdlInfo -> genericFcn != ( NULL ) && ssGetSimMode ( S ) !=
SS_SIMMODE_SIZES_CALL_ONLY ) { int_T retVal = 1 ;
mr_soc_dvbs2_proc_MdlInfoRegFcn ( S , "soc_dvbs2_proc" , & retVal ) ; if ( !
retVal ) return ; }
#endif
ssSetNumDWork ( S , 0 ) ; slmrRegisterSystemInitializeMethod ( S ,
mdlInitializeConditions ) ; slmrRegisterSystemResetMethod ( S , mdlReset ) ;
slmrRegisterPeriodicOutputUpdateMethod ( S , mdlPeriodicOutputUpdate ) ;
ssSetSimulinkVersionGeneratedIn ( S , "25.2" ) ; ssSetNeedAbsoluteTime ( S ,
1 ) ; } static void mdlInitializeSampleTimes ( SimStruct * S ) {
ssSetSampleTime ( S , 0 , 0.001 ) ; ssSetOffsetTime ( S , 0 , 0 ) ;
ssSetSampleTime ( S , 1 , INHERITED_SAMPLE_TIME ) ; ssSetOffsetTime ( S , 1 ,
rtMinusInf ) ; ssSetSampleTime ( S , 2 , mxGetInf ( ) ) ; ssSetOffsetTime ( S
, 2 , 0 ) ; return ; }
#define MDL_SET_WORK_WIDTHS
static void mdlSetWorkWidths ( SimStruct * S ) { if ( S -> mdlInfo ->
genericFcn != ( NULL ) ) { _GenericFcn fcn = S -> mdlInfo -> genericFcn ;
ssSetSignalSizesComputeType ( S , SS_VARIABLE_SIZE_FROM_INPUT_VALUE_AND_SIZE
) ; } { static const char * toFileNames [ ] = { "" } ; static const char *
fromFileNames [ ] = { "" } ; if ( ! ssSetModelRefFromFiles ( S , 0 ,
fromFileNames ) ) return ; if ( ! ssSetModelRefToFiles ( S , 0 , toFileNames
) ) return ; } }
#define MDL_SETUP_RUNTIME_RESOURCES
static void mdlSetupRuntimeResources ( SimStruct * S ) { void * sysRanPtr = ( NULL ) ; int sysTid = 0 ; ssGetContextSysRanBCPtr ( S , & sysRanPtr ) ; ssGetContextSysTid ( S , & sysTid ) ; if ( sysTid == CONSTANT_TID ) { sysTid = 0 ; } ssExecServiceInfo njluxnusps_info = ssGetInputServiceInfo ( S , 8 , "RecvData" ) ; mbysufobogd . njluxnusps . host = njluxnusps_info . host ; * ( void * * ) ( & mbysufobogd . njluxnusps . RecvData ) = njluxnusps_info . fcn ; ssExecServiceInfo fjkyv5n5hk_info = ssGetInputServiceInfo ( S , 5 , "RecvData" ) ; mbysufobogd . fjkyv5n5hk . host = fjkyv5n5hk_info . host ; * ( void * * ) ( & mbysufobogd . fjkyv5n5hk . RecvData ) = fjkyv5n5hk_info . fcn ; ssExecServiceInfo pip4b30tq4_info = ssGetOutputServiceInfo ( S , 9 , "SendData" ) ; mbysufobogd . pip4b30tq4 . host = pip4b30tq4_info . host ; * ( void * * ) ( & mbysufobogd . pip4b30tq4 . SendData ) = pip4b30tq4_info . fcn ; ssExecServiceInfo aycw0laoxu_info = ssGetInputServiceInfo ( S , 9 , "RecvData" ) ; mbysufobogd . aycw0laoxu . host = aycw0laoxu_info . host ; * ( void * * ) ( & mbysufobogd . aycw0laoxu . RecvData ) = aycw0laoxu_info . fcn ; ssExecServiceInfo g3wn4i2t0i_info = ssGetInputServiceInfo ( S , 6 , "RecvData" ) ; mbysufobogd . g3wn4i2t0i . host = g3wn4i2t0i_info . host ; * ( void * * ) ( & mbysufobogd . g3wn4i2t0i . RecvData ) = g3wn4i2t0i_info . fcn ; ssExecServiceInfo ia3mx0dyel_info = ssGetInputServiceInfo ( S , 7 , "RecvData" ) ; mbysufobogd . ia3mx0dyel . host = ia3mx0dyel_info . host ; * ( void * * ) ( & mbysufobogd . ia3mx0dyel . RecvData ) = ia3mx0dyel_info . fcn ; ssExecServiceInfo oruybvqtde_info = ssGetOutputServiceInfo ( S , 1 , "SendData" ) ; mbysufobogd . oruybvqtde . host = oruybvqtde_info . host ; * ( void * * ) ( & mbysufobogd . oruybvqtde . SendData ) = oruybvqtde_info . fcn ; ssExecServiceInfo ditz0yolu4_info = ssGetInputServiceInfo ( S , 1 , "RecvData" ) ; mbysufobogd . ditz0yolu4 . host = ditz0yolu4_info . host ; * ( void * * ) ( & mbysufobogd . ditz0yolu4 . RecvData ) = ditz0yolu4_info . fcn ; ssExecServiceInfo o13fr2shzs_info = ssGetInputServiceInfo ( S , 4 , "RecvData" ) ; mbysufobogd . o13fr2shzs . host = o13fr2shzs_info . host ; * ( void * * ) ( & mbysufobogd . o13fr2shzs . RecvData ) = o13fr2shzs_info . fcn ; ssExecServiceInfo edkpzr3qxe_info = ssGetInputServiceInfo ( S , 3 , "RecvData" ) ; mbysufobogd . edkpzr3qxe . host = edkpzr3qxe_info . host ; * ( void * * ) ( & mbysufobogd . edkpzr3qxe . RecvData ) = edkpzr3qxe_info . fcn ; ssExecServiceInfo a0hnouurzn_info = ssGetOutputServiceInfo ( S , 8 , "SendData" ) ; mbysufobogd . a0hnouurzn . host = a0hnouurzn_info . host ; * ( void * * ) ( & mbysufobogd . a0hnouurzn . SendData ) = a0hnouurzn_info . fcn ; ssExecServiceInfo avfjs1suwv_info = ssGetOutputServiceInfo ( S , 0 , "SendData" ) ; mbysufobogd . avfjs1suwv . host = avfjs1suwv_info . host ; * ( void * * ) ( & mbysufobogd . avfjs1suwv . SendData ) = avfjs1suwv_info . fcn ; ssExecServiceInfo i3zn3odncm_info = ssGetOutputServiceInfo ( S , 2 , "SendData" ) ; mbysufobogd . i3zn3odncm . host = i3zn3odncm_info . host ; * ( void * * ) ( & mbysufobogd . i3zn3odncm . SendData ) = i3zn3odncm_info . fcn ; ssExecServiceInfo fuedqp3xgk_info = ssGetOutputServiceInfo ( S , 4 , "SendData" ) ; mbysufobogd . fuedqp3xgk . host = fuedqp3xgk_info . host ; * ( void * * ) ( & mbysufobogd . fuedqp3xgk . SendData ) = fuedqp3xgk_info . fcn ; ssExecServiceInfo h114tb1oaz_info = ssGetOutputServiceInfo ( S , 5 , "SendData" ) ; mbysufobogd . h114tb1oaz . host = h114tb1oaz_info . host ; * ( void * * ) ( & mbysufobogd . h114tb1oaz . SendData ) = h114tb1oaz_info . fcn ; ssExecServiceInfo jvlk0d2dts_info = ssGetOutputServiceInfo ( S , 6 , "SendData" ) ; mbysufobogd . jvlk0d2dts . host = jvlk0d2dts_info . host ; * ( void * * ) ( & mbysufobogd . jvlk0d2dts . SendData ) = jvlk0d2dts_info . fcn ; ssExecServiceInfo lhk10ksvit_info = ssGetInputServiceInfo ( S , 2 , "RecvData" ) ; mbysufobogd . lhk10ksvit . host = lhk10ksvit_info . host ; * ( void * * ) ( & mbysufobogd . lhk10ksvit . RecvData ) = lhk10ksvit_info . fcn ; ssExecServiceInfo hshf1u1los_info = ssGetInputServiceInfo ( S , 10 , "RecvData" ) ; mbysufobogd . hshf1u1los . host = hshf1u1los_info . host ; * ( void * * ) ( & mbysufobogd . hshf1u1los . RecvData ) = hshf1u1los_info . fcn ; ssExecServiceInfo jey2ux2aqf_info = ssGetInputServiceInfo ( S , 11 , "RecvData" ) ; mbysufobogd . jey2ux2aqf . host = jey2ux2aqf_info . host ; * ( void * * ) ( & mbysufobogd . jey2ux2aqf . RecvData ) = jey2ux2aqf_info . fcn ; ssExecServiceInfo dt4zzlyqd1_info = ssGetOutputServiceInfo ( S , 7 , "SendData" ) ; mbysufobogd . dt4zzlyqd1 . host = dt4zzlyqd1_info . host ; * ( void * * ) ( & mbysufobogd . dt4zzlyqd1 . SendData ) = dt4zzlyqd1_info . fcn ; ssExecServiceInfo kc11mlaa44_info = ssGetOutputServiceInfo ( S , 3 , "SendData" ) ; mbysufobogd . kc11mlaa44 . host = kc11mlaa44_info . host ; * ( void * * ) ( & mbysufobogd . kc11mlaa44 . SendData ) = kc11mlaa44_info . fcn ; ssExecServiceInfo k1ci3uhahf_info = ssGetOutputServiceInfo ( S , 10 , "SendData" ) ; mbysufobogd . k1ci3uhahf . host = k1ci3uhahf_info . host ; * ( void * * ) ( & mbysufobogd . k1ci3uhahf . SendData ) = k1ci3uhahf_info . fcn ; anskunldgv ( S , slmrGetTopTidFromMdlRefChildTid ( S , 0 , false ) , slmrGetTopTidFromMdlRefChildTid ( S , 1 , true ) , slmrGetTopTidFromMdlRefChildTid ( S , 2 , true ) , sysRanPtr , sysTid , ( ( NULL ) ) , ( ( NULL ) ) , 0 , - 1 ) ; ssSetModelMappingInfoPtr ( S , & ( lhrolgqcl4 . rtm . DataMapInfo . mmi ) ) ; if ( S -> mdlInfo -> genericFcn != ( NULL ) ) { _GenericFcn fcn = S -> mdlInfo -> genericFcn ; } }
#define MDL_START
static void mdlStart ( SimStruct * S ) { mdlProcessParameters ( S ) ;
c0xv1qe3un ( ) ; } static void mdlOutputs ( SimStruct * S , int_T tid ) { if
( tid == PARAMETER_TUNING_TID ) { } if ( tid != CONSTANT_TID && tid !=
PARAMETER_TUNING_TID ) { soc_dvbs2_proc ( ) ; } }
#define MDL_UPDATE
static void mdlUpdate ( SimStruct * S , int_T tid ) { jpww0mejvo ( ) ; return
; } static void mdlTerminate ( SimStruct * S ) { c5jbo13s4c ( ) ; return ; }
#define MDL_CLEANUP_RUNTIME_RESOURCES
static void mdlCleanupRuntimeResources ( SimStruct * S ) { }
#if !defined(MDL_SIM_STATE)
#define MDL_SIM_STATE
#endif
static mxArray * mdlGetSimState ( SimStruct * S ) { static const char *
simStateFieldNames [ 6 ] = { "localX" , "mdlrefDW" , "disallowedStateData" ,
"tNext" , "tNextTid" , "nonContDerivSigInfoPrevVal" , } ; mxArray * ss =
mxCreateStructMatrix ( 1 , 1 , 6 , simStateFieldNames ) ; { const real_T *
localX = ( const real_T * ) ssGetContStates ( S ) ; const int_T numStates =
ssGetNumContStates ( S ) ; const size_t numBytes = numStates * sizeof ( real_T
) ; mxArray * storedX = mxCreateNumericMatrix ( 1 , numBytes , mxUINT8_CLASS
, mxREAL ) ; UINT8_T * rawData = ( UINT8_T * ) mxGetData ( storedX ) ; memcpy
( & rawData [ 0 ] , localX , numBytes ) ; mxSetFieldByNumber ( ss , 0 , 0 ,
storedX ) ; } { mxArray * mdlrefDW = mr_soc_dvbs2_proc_GetDWork ( ) ;
mxSetFieldByNumber ( ss , 0 , 1 , mdlrefDW ) ; } { mxArray * data =
mr_soc_dvbs2_proc_GetSimStateDisallowedBlocks ( ) ; mxSetFieldByNumber ( ss ,
0 , 2 , data ) ; } ; mxSetFieldByNumber ( ss , 0 , 3 , mxCreateDoubleScalar ( ( double ) ssGetTNext ( S ) ) ) ; mxSetFieldByNumber ( ss , 0 , 4 , mxCreateDoubleScalar ( ( double ) ssGetTNextTid ( S ) ) ) ; return ss ; }
#if !defined(MDL_SIM_STATE)
#define MDL_SIM_STATE
#endif
static void mdlSetSimState ( SimStruct * S , const mxArray * ss ) { { real_T
* localX = ( real_T * ) ssGetContStates ( S ) ; const int_T numStates =
ssGetNumContStates ( S ) ; const size_t numBytes = numStates * sizeof ( real_T
) ; const mxArray * storedX = mxGetFieldByNumber ( ss , 0 , 0 ) ; const
UINT8_T * rawData = ( const UINT8_T * ) mxGetData ( storedX ) ; memcpy ( localX
, & rawData [ 0 ] , numBytes ) ; } mr_soc_dvbs2_proc_SetDWork ( mxGetFieldByNumber ( ss , 0 , 1 ) ) ; ssSetTNext ( S , ( time_T ) mxGetScalar ( mxGetFieldByNumber ( ss , 0 , 3 ) ) ) ; ssSetTNextTid ( S , ( int_T ) mxGetScalar ( mxGetFieldByNumber ( ss , 0 , 4 ) ) ) ; }
#ifdef MATLAB_MEX_FILE 
#include "simulink.c"
#include "fixedpoint.c"
#else
#error Assertion failed: file must be compiled as a MEX-file
#endif
