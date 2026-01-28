#ifndef soc_dvbs2_proc_h_
#define soc_dvbs2_proc_h_
#ifndef soc_dvbs2_proc_COMMON_INCLUDES_
#define soc_dvbs2_proc_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "math.h"
#include "soc_queue.hpp"
#endif
#include "soc_dvbs2_proc_types.h"
#include "RecvData_real_T.h"
#include "SendData_boolean_T.h"
#include "SendData_real_T.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_nonfinite.h"
#include <string.h>
#include <stddef.h>
typedef struct { real_T lgv3wxes4u ; real_T a3ng4tp5bt ; real_T k325oe5md2 ;
real_T f4y0e1u3gg ; real_T klrflc34fe ; real_T gdmjfmgndx ; real_T mh4pxrdnev
; real_T bki10tj1sr ; real_T ktzigvmbig ; real_T gnscyzxwva ; real_T
e4fczypksy ; real_T iwxxt1a55w ; real_T hqt5v3qjwd ; real_T g2vdszmfhy ;
real_T c2jgtx0brq ; real_T fsa1kw2loy ; real_T hshzlzbukf ; real_T ldisd5gl45
; real_T a0i0hcqltk ; real_T fyfm5ajedt ; real_T ocz4izpixo ; uint32_T
c0boexx1eb [ 2048 ] ; uint32_T ptaflwbe4w [ 2048 ] ; real_T d ; int32_T
asrdx3leoq ; int32_T isUsingGRT ; int32_T status ; int32_T status_mbvzarwird
; int32_T isUsingGRT_cl54gopm0x ; int32_T status_kkiq3xxxve ; int32_T
status_cxarnvbvui ; int32_T isUsingGRT_bhxxfovxdy ; int32_T status_pbm3vprmfu
; int32_T status_cv5hdgrwft ; int32_T isUsingGRT_fqdqrf4qbc ; int32_T
status_g2mlkqadfk ; int32_T status_g1smspu5ke ; int32_T isUsingGRT_merlcviukg
; int32_T status_nz4o0shxby ; int32_T status_ppxrqq0gsf ; int32_T
isUsingGRT_llw0u2ae0v ; int32_T status_jwzvbuczlb ; int32_T status_dhmrxtyqop
; int32_T isUsingGRT_guugdwf2m3 ; int32_T status_ldqodwenvz ; int32_T
status_dhamdvybc1 ; int32_T isUsingGRT_dypejvacrn ; int32_T status_lxo5edjg3c
; int32_T status_owjr1h1vqy ; int32_T status_bjbgfqrolh ; int32_T
isUsingGRT_nuebgmauvi ; int32_T status_bsqwvugooi ; int32_T
isUsingGRT_lnjdk5wtww ; int32_T status_hv2ho1zopz ; int32_T
isUsingGRT_bnlywzniup ; int32_T status_dapv3jlyq5 ; int32_T
isUsingGRT_ezqlmfzvpq ; int32_T status_bjvjhhzy4i ; int32_T
isUsingGRT_jzx3amusab ; int32_T status_fdinthrxmb ; int32_T
isUsingGRT_al00mdgrv4 ; int32_T status_ju13rw2h0m ; int32_T
isUsingGRT_jz50ptvnrg ; int32_T status_o4f35lbcvx ; uint32_T dwgv5bw1mp ;
uint32_T nbvy1uvmv3 ; uint32_T gcttugnkvy ; uint32_T lehpty0aqi [ 10 ] ;
int32_T nqyihv3fde ; uint16_T jkboxa15en ; uint16_T bbmutxyucc ; uint8_T
fh542pzytq ; uint8_T id0kcnis4s ; uint8_T f5tgzkuhn1 ; uint8_T joibukzelc ;
boolean_T kyup2ytaye ; boolean_T nzpbhdpnfv ; boolean_T fimvejt50a ;
boolean_T ff1mvvfjzy ; boolean_T hht0gzzvwg ; boolean_T lxhjpfpsqg ;
boolean_T ftna43evzw ; boolean_T ex5ugzhfcc ; boolean_T navbtq33mq ;
boolean_T n0tz42oqlv ; boolean_T eu0php32bc ; boolean_T jqyzlutbh4 ;
boolean_T evlld2s5r4 ; boolean_T kq2jbdgo4w ; boolean_T fppnt3rzix ;
boolean_T gfa01daq15 ; boolean_T ct5ppt3q5l ; boolean_T ipvcpjqnqb ;
boolean_T czutldfc0e ; boolean_T l0y3ilbibs ; boolean_T ba5tpz204h ;
boolean_T nzhzz3ofhq ; boolean_T ldkja2jofc ; boolean_T ptwad5hjaj ;
boolean_T abv4zmew4r ; boolean_T mfpmyuooxw ; boolean_T gyvt5zz0uk ;
boolean_T kupy1se1rc ; boolean_T pwlwxt43xe ; boolean_T iune0dcsp4 ;
boolean_T evavxy0ue4 ; boolean_T en5z4il0c5 ; boolean_T atrx1s1q5j ;
boolean_T ft1vxvbhmj ; boolean_T pkmmmsbguq ; } iyctansbokz ; typedef struct
{ RecvData_real_T ditz0yolu4 ; RecvData_real_T lhk10ksvit ; RecvData_real_T
edkpzr3qxe ; RecvData_real_T o13fr2shzs ; RecvData_real_T fjkyv5n5hk ;
RecvData_real_T g3wn4i2t0i ; RecvData_real_T ia3mx0dyel ; RecvData_real_T
njluxnusps ; RecvData_real_T aycw0laoxu ; RecvData_real_T hshf1u1los ;
RecvData_real_T jey2ux2aqf ; SendData_boolean_T avfjs1suwv ; SendData_real_T
oruybvqtde ; SendData_real_T i3zn3odncm ; SendData_real_T kc11mlaa44 ;
SendData_real_T fuedqp3xgk ; SendData_real_T h114tb1oaz ; SendData_real_T
jvlk0d2dts ; SendData_real_T dt4zzlyqd1 ; SendData_real_T a0hnouurzn ;
SendData_real_T pip4b30tq4 ; SendData_real_T k1ci3uhahf ; uint32_T okrpcvvxyt
[ 4096 ] ; int32_T jrwqx5pwuv ; int32_T nwhumgsldz ; struct { int_T
INITIALIZED ; } aspcs42ua3 ; struct { int_T INITIALIZED ; } drgpzeamty ;
struct { int_T INITIALIZED ; } a100ydi1yk ; struct { int_T INITIALIZED ; }
gztchq2nw1 ; struct { int_T INITIALIZED ; } gi5n2h1rbx ; struct { int_T
INITIALIZED ; } h1dornklqw ; struct { int_T INITIALIZED ; } g1a2susioz ;
struct { int_T INITIALIZED ; } nlmrvcsa2f ; struct { int_T INITIALIZED ; }
krz0zwmjcl ; struct { int_T INITIALIZED ; } im5inm40zg ; struct { int_T
INITIALIZED ; } iwukllfonw ; uint16_T o2eqjelkr5 ; uint16_T ja1yjlumaf ;
uint16_T h3qbjz1uqu ; uint16_T heuujzorus ; uint16_T b2lsa1pajc ; uint16_T
oj2dn1vkzm ; uint16_T kcibreau2p ; uint16_T pjixiuxqkx ; uint16_T fwqxyrjjfn
; uint16_T mikwhrgw1j ; int16_T pqor0iysma ; int8_T g5sarm2e1c ; int8_T
a1lbkpiqzl ; int8_T bymhfbq5u5 ; int8_T j240r3cffi ; int8_T ob3drgzdeh ;
boolean_T d1qf1es5k5 ; boolean_T nytyiaxvfw ; boolean_T l3ghwnbilx ;
boolean_T mkyoehowj5 ; uint8_T fxdyz1m0n5 ; } efk43w5xnm0 ; struct bu34wesrms
{ void * proxyFunctions [ 22 ] ; struct SimStruct_tag * _mdlRefSfcnS ; struct
{ rtwCAPI_ModelMappingInfo mmi ; rtwCAPI_ModelMapLoggingInstanceInfo
mmiLogInstanceInfo ; sysRanDType * systemRan [ 6 ] ; int_T systemTid [ 6 ] ;
} DataMapInfo ; } ; typedef struct { fryhwgz3tx rtm ; } lhrolgqcl4r ; extern
real_T rtP_Rsym ; extern void b1jmqvb420 ( void ) ; extern void fsugzgiy4b ( void ) ; extern void c0xv1qe3un ( void ) ; extern void jpww0mejvo ( void ) ; extern void soc_dvbs2_proc ( void ) ; extern void lgljo4flkj ( void ) ; extern void c5jbo13s4c ( void ) ; extern void anskunldgv ( SimStruct * _mdlRefSfcnS , int_T mdlref_TID0 , int_T mdlref_TID1 , int_T mdlref_TID2 , void * sysRanPtr , int contextTid , rtwCAPI_ModelMappingInfo * rt_ParentMMI , const char_T * rt_ChildPath , int_T rt_ChildMMIIdx , int_T rt_CSTATEIdx ) ; extern void mr_soc_dvbs2_proc_MdlInfoRegFcn ( SimStruct * mdlRefSfcnS , char_T * modelName , int_T * retVal ) ; extern mxArray * mr_soc_dvbs2_proc_GetDWork ( ) ; extern void mr_soc_dvbs2_proc_SetDWork ( const mxArray * ssDW ) ; extern void mr_soc_dvbs2_proc_RegisterSimStateChecksum ( SimStruct * S ) ; extern mxArray * mr_soc_dvbs2_proc_GetSimStateDisallowedBlocks ( ) ; extern const rtwCAPI_ModelMappingStaticInfo * soc_dvbs2_proc_GetCAPIStaticMap ( void ) ; void mr_soc_dvbs2_proc_CreateInitRestoreData ( ) ; void mr_soc_dvbs2_proc_CopyFromInitRestoreData ( ) ; void mr_soc_dvbs2_proc_DestroyInitRestoreData ( ) ; extern lhrolgqcl4r lhrolgqcl4 ; extern iyctansbokz ko2rexdkipy ; extern efk43w5xnm0 mbysufobogd ;
#endif
