#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "combined_callback_csv_model_time_capi_host.h"
#define sizeof(...) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 18
#endif
#ifndef SS_INT64
#define SS_INT64 19
#endif
#else
#include "builtin_typeid_types.h"
#include "combined_callback_csv_model_time.h"
#include "combined_callback_csv_model_time_capi.h"
#include "combined_callback_csv_model_time_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 1 , TARGET_STRING ( "combined_callback_csv_model_time/api_fetch" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 1 , 1 , TARGET_STRING ( "combined_callback_csv_model_time/api_fetch" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 2 , 1 , TARGET_STRING ( "combined_callback_csv_model_time/api_fetch" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 3 , 0 , TARGET_STRING ( "combined_callback_csv_model_time/Add" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 4 , TARGET_STRING ( "combined_callback_csv_model_time/Gain1" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 5 , TARGET_STRING ( "combined_callback_csv_model_time/Gain2" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 6 , TARGET_STRING ( "combined_callback_csv_model_time/Gain3" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 7 , TARGET_STRING ( "combined_callback_csv_model_time/Sine Wave" ) , TARGET_STRING ( "Bias" ) , 0 , 0 , 0 } , { 8 , TARGET_STRING ( "combined_callback_csv_model_time/Sine Wave" ) , TARGET_STRING ( "Phase" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 } } ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 9 , TARGET_STRING ( "amplitude_param" ) , 0 , 0 , 0 } , { 10 , TARGET_STRING ( "frequency_param" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . etgsmphc5e , & rtB . ncp5gyco2d ,
& rtB . lcvd0aicnn , & rtB . poxri3wtke , & rtP . Gain1_Gain , & rtP .
Gain2_Gain , & rtP . Gain3_Gain , & rtP . SineWave_Bias , & rtP .
SineWave_Phase , & rtP . amplitude_param , & rtP . frequency_param , } ;
static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 } ; static const
rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0 } , } ; static const
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , ( int8_T ) 0 , ( uint8_T ) 0 } } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 4 , rtRootInputs , 0 , rtRootOutputs , 0 } , { rtBlockParameters , 5 , rtModelParameters , 2 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float" , { 365172563U , 477103443U , 2589984022U , 1647268195U } , ( NULL ) , 0 , ( boolean_T ) 0 , rt_LoggedStateIdxList } ; const rtwCAPI_ModelMappingStaticInfo * combined_callback_csv_model_time_GetCAPIStaticMap ( void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void combined_callback_csv_model_time_InitializeDataMapInfo ( void ) {
rtwCAPI_SetVersion ( ( * rt_dataMapInfoPtr ) . mmi , 1 ) ;
rtwCAPI_SetStaticMap ( ( * rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ;
rtwCAPI_SetLoggingStaticMap ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetDataAddressMap ( ( * rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ;
rtwCAPI_SetVarDimsAddressMap ( ( * rt_dataMapInfoPtr ) . mmi ,
rtVarDimsAddrMap ) ; rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr )
. mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi
, ( NULL ) ) ; rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi ,
0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void combined_callback_csv_model_time_host_InitializeDataMapInfo ( combined_callback_csv_model_time_host_DataMapInfo_T * dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath ( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
