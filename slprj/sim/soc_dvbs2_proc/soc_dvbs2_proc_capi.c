#include <stddef.h>
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "soc_dvbs2_proc_capi_host.h"
#define sizeof(...) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 27
#endif
#ifndef SS_INT64
#define SS_INT64 28
#endif
#else
#include "builtin_typeid_types.h"
#include "soc_dvbs2_proc.h"
#include "soc_dvbs2_proc_capi.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) ,
0 , 0 , 0 , 0 , 0 } } ; static rtwCAPI_States rtBlockStates [ ] = { { 0 , - 1
, ( NULL ) , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 , 0 , - 1 , 0 } } ;
static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static TARGET_CONST
rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "" , "" , 0 , 0 , 0 , 0 , 0 , 0 ,
0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 0 , 0 } } ; static uint_T rtDimensionArray [ ] = { 0 } ;
static rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0 } , } ; static
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( NULL ) , ( NULL ) , 0 , 0 }
} ; static int_T rtContextSystems [ 6 ] ; static rtwCAPI_LoggingMetaInfo
loggingMetaInfo [ ] = { { 0 , 0 , "" , 0 } } ; static
rtwCAPI_ModelMapLoggingStaticInfo mmiStaticInfoLogging = { 6 ,
rtContextSystems , loggingMetaInfo , 0 , ( NULL ) , { 0 , ( NULL ) , ( NULL )
} , 0 , ( NULL ) } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { {
rtBlockSignals , 0 , ( NULL ) , 0 , ( NULL ) , 0 } , { ( NULL ) , 0 , ( NULL
) , 0 } , { rtBlockStates , 0 } , { rtDataTypeMap , rtDimensionMap ,
rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float" ,
{ 332375141U , 855895419U , 974646091U , 2060572441U } , &
mmiStaticInfoLogging , 0 , ( boolean_T ) 0 , rt_LoggedStateIdxList } ; const
rtwCAPI_ModelMappingStaticInfo * soc_dvbs2_proc_GetCAPIStaticMap ( void ) {
return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
static void soc_dvbs2_proc_InitializeSystemRan ( fryhwgz3tx * const
mrjidp21eh , sysRanDType * systemRan [ ] , int_T systemTid [ ] , void *
rootSysRanPtr , int rootTid ) { UNUSED_PARAMETER ( mrjidp21eh ) ; systemRan [
0 ] = ( sysRanDType * ) rootSysRanPtr ; systemRan [ 1 ] = ( sysRanDType * ) &
mbysufobogd . ob3drgzdeh ; systemRan [ 2 ] = ( sysRanDType * ) & mbysufobogd
. j240r3cffi ; systemRan [ 3 ] = ( NULL ) ; systemRan [ 4 ] = ( sysRanDType *
) & mbysufobogd . bymhfbq5u5 ; systemRan [ 5 ] = ( NULL ) ; systemTid [ 1 ] =
mfcazxxf5b [ 0 ] ; systemTid [ 2 ] = mfcazxxf5b [ 0 ] ; systemTid [ 3 ] =
mfcazxxf5b [ 0 ] ; systemTid [ 4 ] = mfcazxxf5b [ 1 ] ; systemTid [ 5 ] =
mfcazxxf5b [ 0 ] ; systemTid [ 0 ] = rootTid ; rtContextSystems [ 0 ] = 0 ;
rtContextSystems [ 1 ] = 1 ; rtContextSystems [ 2 ] = 2 ; rtContextSystems [
3 ] = 0 ; rtContextSystems [ 4 ] = 4 ; rtContextSystems [ 5 ] = 0 ; }
#endif
#ifndef HOST_CAPI_BUILD
void soc_dvbs2_proc_InitializeDataMapInfo ( fryhwgz3tx * const mrjidp21eh ,
void * sysRanPtr , int contextTid ) { rtwCAPI_SetVersion ( mrjidp21eh ->
DataMapInfo . mmi , 1 ) ; rtwCAPI_SetStaticMap ( mrjidp21eh -> DataMapInfo .
mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( mrjidp21eh -> DataMapInfo
. mmi , & mmiStaticInfoLogging ) ; rtwCAPI_SetPath ( mrjidp21eh ->
DataMapInfo . mmi , ( NULL ) ) ; rtwCAPI_SetFullPath ( mrjidp21eh ->
DataMapInfo . mmi , ( NULL ) ) ; rtwCAPI_SetInstanceLoggingInfo ( mrjidp21eh
-> DataMapInfo . mmi , & mrjidp21eh -> DataMapInfo . mmiLogInstanceInfo ) ;
rtwCAPI_SetChildMMIArray ( mrjidp21eh -> DataMapInfo . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( mrjidp21eh -> DataMapInfo . mmi , 0 ) ;
soc_dvbs2_proc_InitializeSystemRan ( mrjidp21eh , mrjidp21eh -> DataMapInfo .
systemRan , mrjidp21eh -> DataMapInfo . systemTid , sysRanPtr , contextTid )
; rtwCAPI_SetSystemRan ( mrjidp21eh -> DataMapInfo . mmi , mrjidp21eh ->
DataMapInfo . systemRan ) ; rtwCAPI_SetSystemTid ( mrjidp21eh -> DataMapInfo
. mmi , mrjidp21eh -> DataMapInfo . systemTid ) ; rtwCAPI_SetGlobalTIDMap ( mrjidp21eh -> DataMapInfo . mmi , & mfcazxxf5b [ 0 ] ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void soc_dvbs2_proc_host_InitializeDataMapInfo ( soc_dvbs2_proc_host_DataMapInfo_T * dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath ( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
