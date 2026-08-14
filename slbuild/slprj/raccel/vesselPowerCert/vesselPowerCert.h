#ifndef vesselPowerCert_h_
#define vesselPowerCert_h_
#ifndef vesselPowerCert_COMMON_INCLUDES_
#define vesselPowerCert_COMMON_INCLUDES_
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
#include "vesselPowerCert_types.h"
#include <stddef.h>
#include "rtw_modelmap.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME vesselPowerCert
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (18)     
#define NBLOCKIO (18) 
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
typedef struct { real_T gl50hilnqp ; real_T hilqji5gdq ; real_T gz14omdwtw ;
real_T mb1xtmltkg ; real_T lfpq1utjp4 ; real_T p5wotw520i ; real_T fvv4zlotiq
; real_T cnrxqg2uvw ; real_T dfqk3bpfgn ; real_T m5uiaez0ba ; real_T
kcrik4xstr ; real_T kdhagxpynr ; real_T onrcgyijti ; real_T d230kxrswf ;
real_T pnskaoz2i1 ; real_T f0ezfwtglf ; real_T cil41qsm0q ; real_T ei0bd1hzho
; } B ; typedef struct { real_T apgyxiu2m5 ; real_T ghghfedje2 ; real_T
g004hjplcr ; real_T ld1wedliu1 ; struct { void * AQHandles ; } i3cbnclgmi ;
struct { void * AQHandles ; } bzr5wpcu0u ; struct { void * AQHandles ; }
gcdtfu0izy ; struct { void * AQHandles ; } hc0g1bqvax ; struct { void *
AQHandles ; } otwyczwnk0 ; struct { void * AQHandles ; } aolimedzpg ; struct
{ void * AQHandles ; } akocgqojsa ; struct { void * AQHandles ; } hsuwofnuzj
; struct { void * AQHandles ; } mo4o1k35kz ; struct { void * AQHandles ; }
erpmxjhqfn ; struct { void * AQHandles ; } aju3s5wvn5 ; struct { void *
AQHandles ; } a5pbjf2bco ; struct { void * AQHandles ; } gb43qecqrq ; struct
{ void * AQHandles ; } bq1xwm5x5t ; struct { void * AQHandles ; } p21fayabmj
; struct { void * AQHandles ; } b3vtdgkjwj ; struct { void * AQHandles ; }
kyikgzluuk ; struct { void * AQHandles ; } gjxcvl33ck ; int32_T gopcmvzwzo ;
int32_T d4xn1qmcjz ; int32_T j5pupmqvzj ; int32_T kfsmy5nhrg ; int32_T
bb4a2et044 ; int32_T epkx35rzyu ; int32_T l2pdw0mk3h ; int32_T hh4ni0qlqp ;
int32_T l0gphmoarx ; int32_T cqnkjxqv55 ; int32_T bg1h5lko0y ; int32_T
fjbkmfbslj ; int32_T dgkuxrxtje ; int32_T a31hhvnwsj ; int32_T ngajz25ekh ;
int32_T kexgmrrezp ; int32_T iw3qrmz15r ; int32_T fulurhbitn ; int32_T
jaftjltlef ; int32_T ikflqi0zlu ; int32_T g5mytuiu4o ; int32_T duw1k53fc3 ;
int32_T m2uc1isopw ; int32_T gx02mobzma ; int32_T h0g2x3id0c ; int32_T
bca10yuhrm ; int32_T a3s43c33t1 ; int32_T glsziqwr0g ; int32_T dfjcrbvan3 ;
int32_T hxeiachyfn ; int32_T hwko3b3qnq ; boolean_T lpsgu5es3j ; boolean_T
c04c2c1uz5 ; boolean_T ow4ngcq1yw ; boolean_T mtizrmosmh ; boolean_T
mha25ovryl ; boolean_T eh2goxj3mp ; boolean_T lkz5h5cj2b ; boolean_T
kagccggrko ; boolean_T dvphm5yvsu ; boolean_T de0zcndrz0 ; boolean_T
nfuqnvdmny ; boolean_T m105bjvj2y ; boolean_T inpj01j1ka ; boolean_T
azz1zaskew ; boolean_T nztbhmwd2k ; boolean_T hwa2ccbpez ; boolean_T
ezajqet5fh ; } DW ; typedef struct { real_T kxcmswz2ru ; real_T dq0rxsgzf2 ;
real_T a5ypr5w2ck ; real_T kt0sc0sk5g ; real_T bfzz1ji0iw ; real_T nberaf5pgx
; real_T brijnedqd0 ; real_T n4lkgzzabc ; real_T ensip1ktkl ; real_T
hxpzovnkso ; real_T ivbwctlinr ; real_T bj4mnj2eh2 ; real_T d4eidzsse1 ;
real_T lqlaifpnxv ; real_T juflmuhinu ; real_T nmuhoalc0y ; real_T lf2j4yaror
; real_T n5eryqsam1 ; } ExtY ; typedef struct { rtwCAPI_ModelMappingInfo mmi
; } DataMapInfo ; struct P_ { real_T VAR_ESS ; real_T VAR_GEN ; real_T
VAR_PROP_ARCH ; real_T VAR_SHORE ; real_T capEnergy_kWh ; real_T capPower_kW
; real_T designSpeed_kn ; real_T dpBase_kW ; real_T dpRippleAmp_kW ; real_T
dt_s ; real_T essEnergy_kWh ; real_T essEtaRT ; real_T essPower_kW ; real_T
essSocInit ; real_T etaDrive ; real_T etaGearbox ; real_T etaMotor ; real_T
etaShaftMach ; real_T genLoadMax ; real_T genSfocLoadOpt ; real_T genSfocMin
; real_T genUnitPower_kW ; real_T hotelTab_kW [ 7 ] ; real_T mePower_kW ;
real_T meSfocLoadOpt ; real_T meSfocMin ; real_T modeTab [ 7 ] ; real_T
propPower_kW ; real_T seaMargin ; real_T seaTab [ 7 ] ; real_T shorePower_kW
; real_T tBreak_s [ 7 ] ; real_T vTab_kn [ 7 ] ; } ; extern const char_T *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern DW rtDW ; extern ExtY rtY
; extern P rtP ; extern mxArray * mr_vesselPowerCert_GetDWork ( ) ; extern
void mr_vesselPowerCert_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_vesselPowerCert_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * vesselPowerCert_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T
tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
