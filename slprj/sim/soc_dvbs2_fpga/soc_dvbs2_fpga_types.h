#ifndef soc_dvbs2_fpga_types_h_
#define soc_dvbs2_fpga_types_h_
#include "rtwtypes.h"
#ifndef DEFINED_TYPEDEF_FOR_StreamM2SBusObj_
#define DEFINED_TYPEDEF_FOR_StreamM2SBusObj_
typedef struct { boolean_T valid ; boolean_T tlast ; uint8_T sl_padding0 [ 6
] ; } StreamM2SBusObj ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_StreamS2MBusObj_
#define DEFINED_TYPEDEF_FOR_StreamS2MBusObj_
typedef struct { boolean_T ready ; uint8_T sl_padding0 [ 7 ] ; }
StreamS2MBusObj ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_samplecontrol_
#define DEFINED_TYPEDEF_FOR_samplecontrol_
typedef struct { boolean_T start ; boolean_T end ; boolean_T valid ; uint8_T
sl_padding0 [ 5 ] ; } samplecontrol ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_OeOCCDwdIiOer3oC9zPPiC_
#define DEFINED_TYPEDEF_FOR_struct_OeOCCDwdIiOer3oC9zPPiC_
typedef struct { real_T RAMCapacity ; real_T ShortFrameLen ; real_T
NormalFrameLen ; } struct_OeOCCDwdIiOer3oC9zPPiC ;
#endif
#ifndef DEFINED_TYPEDEF_FOR_struct_qlBrzpsoLxnjdd5BpP9LzC_
#define DEFINED_TYPEDEF_FOR_struct_qlBrzpsoLxnjdd5BpP9LzC_
typedef struct { real_T NumInputStreams ; real_T RolloffFactor ; real_T
FilterSpanInSymbols ; real_T SamplesPerSymbol ; real_T SOFLength ; real_T
PLSCLength ; real_T RRCImpulseResponse [ 41 ] ; creal_T refSOF [ 25 ] ;
creal_T refPLSC [ 63 ] ; uint16_T Threshold ; uint8_T sl_padding0 [ 6 ] ;
real_T refSOFE ; real_T refPLSCE ; real_T SSKp ; real_T SSK0 ; real_T
SSLoopFilterPropGain ; real_T SSLoopFilterIntegGain ; real_T PilotBlkFreq ;
real_T SlotLength ; real_T nPilot ; creal_T Pilot ; real_T PilotMinIdx ;
real_T PilotMaxIdx ; real_T CFCLoopFilterIntegGain ; real_T
FFCAveragingLength ; real_T FPCLoopFilterIntegGain ; int8_T PLSCDescramLUT [
64 ] ; uint32_T intColAllCodeWords1to32 [ 32 ] ; uint32_T
intColAllCodeWords33to64 [ 32 ] ; uint8_T s2xGenMatRowMask [ 32 ] ; }
struct_qlBrzpsoLxnjdd5BpP9LzC ;
#endif
#ifndef struct_tag_tvLKSW7RSXJSucJjDEqJuF
#define struct_tag_tvLKSW7RSXJSucJjDEqJuF
struct tag_tvLKSW7RSXJSucJjDEqJuF { int32_T isInitialized ; boolean_T
processMsg ; boolean_T padZero ; boolean_T tStartOut ; boolean_T tEndOut ;
boolean_T startOutReg ; boolean_T endOutReg ; boolean_T validOutReg ;
boolean_T yOutReg ; boolean_T F [ 64 ] ; boolean_T reg [ 8 ] ; boolean_T
crcoutreg [ 8 ] ; boolean_T mReg [ 8 ] ; boolean_T dm ; boolean_T xorValue [
8 ] ; boolean_T initVector [ 8 ] ; boolean_T validIn_delay ; boolean_T
endIn_delay ; boolean_T startOutbuffer [ 8 ] ; boolean_T validInReg [ 8 ] ;
boolean_T sysenb ; boolean_T processCRC ; boolean_T outputCRC ; real_T
counter1 ; real_T counter2 ; } ;
#endif
#ifndef typedef_nnqtbxkvfo
#define typedef_nnqtbxkvfo
typedef struct tag_tvLKSW7RSXJSucJjDEqJuF nnqtbxkvfo ;
#endif
#ifndef struct_tag_ubaCIYGFciUngl5OorL0G
#define struct_tag_ubaCIYGFciUngl5OorL0G
struct tag_ubaCIYGFciUngl5OorL0G { int32_T isInitialized ; nnqtbxkvfo
cHDLCRCGenerator ; boolean_T crcInBufEn ; boolean_T mReg [ 8 ] ; boolean_T
csuminReg [ 8 ] ; boolean_T startInReg [ 8 ] ; boolean_T validInReg [ 8 ] ;
boolean_T endInReg ; boolean_T outputCRC ; boolean_T outputCRCReg ; boolean_T
sysenb ; boolean_T processCRC ; real_T counter1 ; real_T counter2 ; real_T
counter3 ; real_T counter4 ; boolean_T counter1En ; boolean_T counter4En ;
boolean_T crcInBuf [ 8 ] ; boolean_T yReg [ 8 ] ; boolean_T yIni ; boolean_T
startOutReg [ 8 ] ; boolean_T validOutReg [ 8 ] ; } ;
#endif
#ifndef typedef_jwypqahxtj
#define typedef_jwypqahxtj
typedef struct tag_ubaCIYGFciUngl5OorL0G jwypqahxtj ;
#endif
#ifndef struct_tag_GIzxQQOlnSNmSz3f954LIH
#define struct_tag_GIzxQQOlnSNmSz3f954LIH
struct tag_GIzxQQOlnSNmSz3f954LIH { int32_T __dummy ; } ;
#endif
#ifndef typedef_a1l3uxgfvb
#define typedef_a1l3uxgfvb
typedef struct tag_GIzxQQOlnSNmSz3f954LIH a1l3uxgfvb ;
#endif
#ifndef struct_tag_nYbp4mVyaocZ6OkJ3lUcaE
#define struct_tag_nYbp4mVyaocZ6OkJ3lUcaE
struct tag_nYbp4mVyaocZ6OkJ3lUcaE { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; boolean_T W1_IC_BUFF [ 2 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; boolean_T P0_IC ; } ;
#endif
#ifndef typedef_lofhmsmwkx
#define typedef_lofhmsmwkx
typedef struct tag_nYbp4mVyaocZ6OkJ3lUcaE lofhmsmwkx ;
#endif
#ifndef struct_tag_F6rDhN1kBn4RJWVVzmVtBF
#define struct_tag_F6rDhN1kBn4RJWVVzmVtBF
struct tag_F6rDhN1kBn4RJWVVzmVtBF { int32_T __dummy ; } ;
#endif
#ifndef typedef_ih50nepoc4
#define typedef_ih50nepoc4
typedef struct tag_F6rDhN1kBn4RJWVVzmVtBF ih50nepoc4 ;
#endif
#ifndef struct_tag_IvAQFgpfuRaK22ZSX1EvyG
#define struct_tag_IvAQFgpfuRaK22ZSX1EvyG
struct tag_IvAQFgpfuRaK22ZSX1EvyG { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; uint16_T W1_IC_BUFF [ 45 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; uint16_T P0_IC ; } ;
#endif
#ifndef typedef_ft4mmzycq0
#define typedef_ft4mmzycq0
typedef struct tag_IvAQFgpfuRaK22ZSX1EvyG ft4mmzycq0 ;
#endif
#ifndef struct_tag_tkTW9BlumxyUKnUMEeYCqH
#define struct_tag_tkTW9BlumxyUKnUMEeYCqH
struct tag_tkTW9BlumxyUKnUMEeYCqH { int32_T S0_isInitialized ; boolean_T
W0_IC_BUFF ; int32_T W1_PrevNumChan ; boolean_T W2_NeedsToInit ; boolean_T
P0_IC ; } ;
#endif
#ifndef typedef_hrstjofi5d
#define typedef_hrstjofi5d
typedef struct tag_tkTW9BlumxyUKnUMEeYCqH hrstjofi5d ;
#endif
#ifndef struct_tag_yZyRPInmSqZlNR5Oq4zIFF
#define struct_tag_yZyRPInmSqZlNR5Oq4zIFF
struct tag_yZyRPInmSqZlNR5Oq4zIFF { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; boolean_T W1_IC_BUFF [ 2 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; boolean_T P0_IC ; } ;
#endif
#ifndef typedef_ipvraypll3
#define typedef_ipvraypll3
typedef struct tag_yZyRPInmSqZlNR5Oq4zIFF ipvraypll3 ;
#endif
#ifndef struct_tag_hBI1hjUcf5zo5uQHTe9yUG
#define struct_tag_hBI1hjUcf5zo5uQHTe9yUG
struct tag_hBI1hjUcf5zo5uQHTe9yUG { int32_T __dummy ; } ;
#endif
#ifndef typedef_i3owf1jks2
#define typedef_i3owf1jks2
typedef struct tag_hBI1hjUcf5zo5uQHTe9yUG i3owf1jks2 ;
#endif
#ifndef struct_tag_WNHtB7vwWhMPeKgGVD8BdF
#define struct_tag_WNHtB7vwWhMPeKgGVD8BdF
struct tag_WNHtB7vwWhMPeKgGVD8BdF { boolean_T SystemObjectStructType ; } ;
#endif
#ifndef typedef_hkwn4eu25h
#define typedef_hkwn4eu25h
typedef struct tag_WNHtB7vwWhMPeKgGVD8BdF hkwn4eu25h ;
#endif
#ifndef struct_tag_Riu9rrYv0zPfQ795ULB0NB
#define struct_tag_Riu9rrYv0zPfQ795ULB0NB
struct tag_Riu9rrYv0zPfQ795ULB0NB { boolean_T SystemObjectStructType ; } ;
#endif
#ifndef typedef_jzokrg3b41
#define typedef_jzokrg3b41
typedef struct tag_Riu9rrYv0zPfQ795ULB0NB jzokrg3b41 ;
#endif
#ifndef struct_tag_s0TKkNrHclMDric8Krs8VjH
#define struct_tag_s0TKkNrHclMDric8Krs8VjH
struct tag_s0TKkNrHclMDric8Krs8VjH { boolean_T start ; boolean_T end ;
boolean_T valid ; } ;
#endif
#ifndef typedef_nbbe51cjmp
#define typedef_nbbe51cjmp
typedef struct tag_s0TKkNrHclMDric8Krs8VjH nbbe51cjmp ;
#endif
#ifndef struct_tag_bcTu4J7XEIjHcRwVRbq5GH
#define struct_tag_bcTu4J7XEIjHcRwVRbq5GH
struct tag_bcTu4J7XEIjHcRwVRbq5GH { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; boolean_T W1_IC_BUFF [ 15 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; boolean_T P0_IC ; } ;
#endif
#ifndef typedef_jzokrg3b41l
#define typedef_jzokrg3b41l
typedef struct tag_bcTu4J7XEIjHcRwVRbq5GH jzokrg3b41l ;
#endif
#ifndef struct_tag_xlshmQWNyrD8WX5YOWfBNH
#define struct_tag_xlshmQWNyrD8WX5YOWfBNH
struct tag_xlshmQWNyrD8WX5YOWfBNH { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; boolean_T W1_IC_BUFF [ 15 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; boolean_T P0_IC ; } ;
#endif
#ifndef typedef_f155nsdw4l
#define typedef_f155nsdw4l
typedef struct tag_xlshmQWNyrD8WX5YOWfBNH f155nsdw4l ;
#endif
#ifndef struct_tag_LO5oJ9VOjs3C5nuVIvzcRH
#define struct_tag_LO5oJ9VOjs3C5nuVIvzcRH
struct tag_LO5oJ9VOjs3C5nuVIvzcRH { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; boolean_T W1_IC_BUFF [ 15 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; boolean_T P0_IC ; } ;
#endif
#ifndef typedef_c0yjun5d3f
#define typedef_c0yjun5d3f
typedef struct tag_LO5oJ9VOjs3C5nuVIvzcRH c0yjun5d3f ;
#endif
#ifndef struct_tag_pz9EqJvATsXeQhy7iLpCzG
#define struct_tag_pz9EqJvATsXeQhy7iLpCzG
struct tag_pz9EqJvATsXeQhy7iLpCzG { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; boolean_T W1_IC_BUFF [ 15 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; boolean_T P0_IC ; } ;
#endif
#ifndef typedef_ivctdv5dtx
#define typedef_ivctdv5dtx
typedef struct tag_pz9EqJvATsXeQhy7iLpCzG ivctdv5dtx ;
#endif
#ifndef struct_tag_BlgwLpgj2bjudmbmVKWwDE
#define struct_tag_BlgwLpgj2bjudmbmVKWwDE
struct tag_BlgwLpgj2bjudmbmVKWwDE { uint32_T f1 [ 8 ] ; } ;
#endif
#ifndef typedef_iiczx52afi
#define typedef_iiczx52afi
typedef struct tag_BlgwLpgj2bjudmbmVKWwDE iiczx52afi ;
#endif
#ifndef struct_tag_pKy3nlx0p6elseJlW4chqF
#define struct_tag_pKy3nlx0p6elseJlW4chqF
struct tag_pKy3nlx0p6elseJlW4chqF { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint32_T
pOutputBuffer [ 336 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 42
] ; cint64_T pAccReg [ 70 ] ; } ;
#endif
#ifndef typedef_hjop4kvaf2
#define typedef_hjop4kvaf2
typedef struct tag_pKy3nlx0p6elseJlW4chqF hjop4kvaf2 ;
#endif
#ifndef struct_tag_mVUq1z9g33suWlaun5K6u
#define struct_tag_mVUq1z9g33suWlaun5K6u
struct tag_mVUq1z9g33suWlaun5K6u { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint16_T
pOutputBuffer [ 336 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 42
] ; cint64_T pAccReg [ 70 ] ; } ;
#endif
#ifndef typedef_hjop4kvaf21
#define typedef_hjop4kvaf21
typedef struct tag_mVUq1z9g33suWlaun5K6u hjop4kvaf21 ;
#endif
#ifndef struct_tag_Om5o3t0We1pN1ED20ddPbB
#define struct_tag_Om5o3t0We1pN1ED20ddPbB
struct tag_Om5o3t0We1pN1ED20ddPbB { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint32_T
pOutputBuffer [ 960 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 30
] ; cint64_T pAccReg [ 96 ] ; } ;
#endif
#ifndef typedef_hjop4kvaf212
#define typedef_hjop4kvaf212
typedef struct tag_Om5o3t0We1pN1ED20ddPbB hjop4kvaf212 ;
#endif
#ifndef struct_tag_inpjwbp9xam9N5WuS0ape
#define struct_tag_inpjwbp9xam9N5WuS0ape
struct tag_inpjwbp9xam9N5WuS0ape { int32_T isInitialized ; hjop4kvaf212 *
phFIR ; real_T pSimTime ; cint16_T pDlyLine [ 3 ] ; boolean_T pDlyLineVld [ 3
] ; cint16_T pOutputReg ; boolean_T pVldOut ; real_T pState2 ; real_T
pRdyCycleCnt ; real_T pNumCycles ; boolean_T pResetStart ; boolean_T
pCoeffDTCheck ; boolean_T pInputDlyVld ; hjop4kvaf212 coder_buffer_pobj0 ; }
;
#endif
#ifndef typedef_imn4j23e1q
#define typedef_imn4j23e1q
typedef struct tag_inpjwbp9xam9N5WuS0ape imn4j23e1q ;
#endif
#ifndef struct_tag_8IGcY0OPtJ6mS9jrdKk3w
#define struct_tag_8IGcY0OPtJ6mS9jrdKk3w
struct tag_8IGcY0OPtJ6mS9jrdKk3w { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint32_T
pOutputBuffer [ 224 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 28
] ; cint64_T pAccReg [ 41 ] ; } ;
#endif
#ifndef typedef_hjop4kvaf212b
#define typedef_hjop4kvaf212b
typedef struct tag_8IGcY0OPtJ6mS9jrdKk3w hjop4kvaf212b ;
#endif
#ifndef struct_tag_0J5koMES3612GEB2FMKXsB
#define struct_tag_0J5koMES3612GEB2FMKXsB
struct tag_0J5koMES3612GEB2FMKXsB { cint32_T buffer [ 4 ] ; uint32_T
popAddress ; uint32_T entryCount ; } ;
#endif
#ifndef typedef_nvvg0joss0
#define typedef_nvvg0joss0
typedef struct tag_0J5koMES3612GEB2FMKXsB nvvg0joss0 ;
#endif
#ifndef struct_tag_uYoNCJv4yTGNZl3TJ7palH
#define struct_tag_uYoNCJv4yTGNZl3TJ7palH
struct tag_uYoNCJv4yTGNZl3TJ7palH { int32_T isInitialized ; boolean_T
TunablePropsChanged ; cint32_T W [ 25 ] ; cint32_T X [ 25 ] ; boolean_T v [
14 ] ; cint32_T Y ; nvvg0joss0 * outputQueue ; real_T sharingCount ;
boolean_T validLastPhase ; real_T pReadyState ; cint32_T pSavedData ;
cint32_T pSavedCoeff [ 25 ] ; cint32_T pDoutReg ; cint32_T pDoutReg1 ;
boolean_T pRdyReg ; boolean_T pSavedDataVld ; real_T resetCount ; real_T
rstREG ; boolean_T resetCountEn ; real_T pChannelCount ; real_T pFilterLength
; boolean_T pVldOutReg ; boolean_T pVldOutReg1 ; boolean_T pResetStart ;
boolean_T pCoeffDTCheck ; boolean_T pTransientPad ; boolean_T pInitialize ;
boolean_T pProcRst ; nvvg0joss0 coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_n5ly3warxp
#define typedef_n5ly3warxp
typedef struct tag_uYoNCJv4yTGNZl3TJ7palH n5ly3warxp ;
#endif
#ifndef struct_tag_flj0e3I1dhi8auu9RJWtYD
#define struct_tag_flj0e3I1dhi8auu9RJWtYD
struct tag_flj0e3I1dhi8auu9RJWtYD { cint32_T buffer [ 6 ] ; uint32_T
popAddress ; uint32_T entryCount ; } ;
#endif
#ifndef typedef_nvvg0joss0r
#define typedef_nvvg0joss0r
typedef struct tag_flj0e3I1dhi8auu9RJWtYD nvvg0joss0r ;
#endif
#ifndef struct_tag_z6GaJJfKHPiRbI91AK40qG
#define struct_tag_z6GaJJfKHPiRbI91AK40qG
struct tag_z6GaJJfKHPiRbI91AK40qG { int32_T isInitialized ; boolean_T
TunablePropsChanged ; cint32_T W [ 63 ] ; cint32_T X [ 63 ] ; boolean_T v [
23 ] ; cint32_T Y ; nvvg0joss0r * outputQueue ; real_T sharingCount ;
boolean_T validLastPhase ; real_T pReadyState ; cint32_T pSavedData ;
cint32_T pSavedCoeff [ 63 ] ; cint32_T pDoutReg ; cint32_T pDoutReg1 ;
boolean_T pRdyReg ; boolean_T pSavedDataVld ; real_T resetCount ; real_T
rstREG ; boolean_T resetCountEn ; real_T pChannelCount ; real_T pFilterLength
; boolean_T pVldOutReg ; boolean_T pVldOutReg1 ; boolean_T pResetStart ;
boolean_T pCoeffDTCheck ; boolean_T pTransientPad ; boolean_T pInitialize ;
boolean_T pProcRst ; nvvg0joss0r coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_n5ly3warxp1
#define typedef_n5ly3warxp1
typedef struct tag_z6GaJJfKHPiRbI91AK40qG n5ly3warxp1 ;
#endif
#ifndef struct_tag_cipHPoDJCjAaidcCGsxRaC
#define struct_tag_cipHPoDJCjAaidcCGsxRaC
struct tag_cipHPoDJCjAaidcCGsxRaC { int32_T isInitialized ; int32_T phaseInc
; int32_T phaseOff ; int32_T tmpAcc ; int32_T tmpAcc2 ; uint8_T dither ;
int16_T phaseQuant ; int32_T acc ; uint16_T phaseOutReg [ 6 ] ; boolean_T
validReg [ 6 ] ; int16_T sineReg [ 6 ] ; int16_T cosReg [ 6 ] ; } ;
#endif
#ifndef typedef_gqwcooavjp
#define typedef_gqwcooavjp
typedef struct tag_cipHPoDJCjAaidcCGsxRaC gqwcooavjp ;
#endif
#ifndef struct_tag_OFiatYMXRa1IRHs8BDaJbE
#define struct_tag_OFiatYMXRa1IRHs8BDaJbE
struct tag_OFiatYMXRa1IRHs8BDaJbE { int32_T isInitialized ; boolean_T
TunablePropsChanged ; int64_T xPipeline [ 44 ] ; int64_T yPipeline [ 44 ] ;
int64_T zPipeline [ 44 ] ; boolean_T validPipeline [ 47 ] ; uint8_T
pQuadrantIn [ 44 ] ; uint8_T pXYReversed [ 44 ] ; int64_T pQuadrantOut ;
int64_T pPipeout ; int64_T pXAbsolute ; int64_T pYAbsolute ; int64_T
realInReg [ 3 ] ; int64_T imagInReg [ 3 ] ; } ;
#endif
#ifndef typedef_aqb2y2bukd
#define typedef_aqb2y2bukd
typedef struct tag_OFiatYMXRa1IRHs8BDaJbE aqb2y2bukd ;
#endif
#ifndef struct_tag_Kzj5XEAEarG8XZzK5UtPfG
#define struct_tag_Kzj5XEAEarG8XZzK5UtPfG
struct tag_Kzj5XEAEarG8XZzK5UtPfG { int32_T isInitialized ; boolean_T
TunablePropsChanged ; int32_T xPipeline [ 18 ] ; int32_T yPipeline [ 18 ] ;
int32_T zPipeline [ 18 ] ; boolean_T validPipeline [ 21 ] ; uint8_T
pQuadrantIn [ 18 ] ; uint8_T pXYReversed [ 18 ] ; int32_T pQuadrantOut ;
int32_T pPipeout ; int32_T pXAbsolute ; int32_T pYAbsolute ; int32_T
realInReg [ 3 ] ; int32_T imagInReg [ 3 ] ; } ;
#endif
#ifndef typedef_aqb2y2bukdf
#define typedef_aqb2y2bukdf
typedef struct tag_Kzj5XEAEarG8XZzK5UtPfG aqb2y2bukdf ;
#endif
#ifndef struct_tag_osIzaxL3gk6167CrwJBKyB
#define struct_tag_osIzaxL3gk6167CrwJBKyB
struct tag_osIzaxL3gk6167CrwJBKyB { int32_T isInitialized ; boolean_T
TunablePropsChanged ; int16_T xPipeline [ 13 ] ; int16_T yPipeline [ 13 ] ;
int16_T zPipeline [ 13 ] ; boolean_T validPipeline [ 16 ] ; int16_T
pPostScale ; uint8_T pQuadrantIn [ 13 ] ; uint8_T pXYReversed [ 13 ] ;
int16_T pQuadrantOut ; int16_T pPipeout ; int16_T pXAbsolute ; int16_T
pYAbsolute ; int16_T realInReg [ 3 ] ; int16_T imagInReg [ 3 ] ; } ;
#endif
#ifndef typedef_aqb2y2bukdf1
#define typedef_aqb2y2bukdf1
typedef struct tag_osIzaxL3gk6167CrwJBKyB aqb2y2bukdf1 ;
#endif
#ifndef struct_tag_9ECDr3Zbt7I0rvIPzeusOB
#define struct_tag_9ECDr3Zbt7I0rvIPzeusOB
struct tag_9ECDr3Zbt7I0rvIPzeusOB { int32_T isInitialized ; boolean_T validIn
; int32_T dataInReal ; int32_T dataInImag ; boolean_T evenSymFlag ; int16_T
twoRootTwo ; int64_T dataOut [ 5 ] ; boolean_T validOut ; } ;
#endif
#ifndef typedef_olf2snm1ra
#define typedef_olf2snm1ra
typedef struct tag_9ECDr3Zbt7I0rvIPzeusOB olf2snm1ra ;
#endif
#ifndef struct_tag_NRwGni0kO7bd5AKMZUmhSD
#define struct_tag_NRwGni0kO7bd5AKMZUmhSD
struct tag_NRwGni0kO7bd5AKMZUmhSD { int32_T isInitialized ; boolean_T validIn
; int32_T dataInReal ; int32_T dataInImag ; int16_T twoRootTwo ; int64_T
dataOut [ 5 ] ; boolean_T validOut ; } ;
#endif
#ifndef typedef_i20rzp01zs
#define typedef_i20rzp01zs
typedef struct tag_NRwGni0kO7bd5AKMZUmhSD i20rzp01zs ;
#endif
#ifndef struct_tag_QNIduhT4idbCjepKLRxoXF
#define struct_tag_QNIduhT4idbCjepKLRxoXF
struct tag_QNIduhT4idbCjepKLRxoXF { int32_T isInitialized ; boolean_T validIn
; int32_T dataInReal ; int32_T dataInImag ; uint16_T sqroot2 ; uint16_T one ;
int64_T dataOut [ 5 ] ; boolean_T validOut ; } ;
#endif
#ifndef typedef_jsuex4dxqu
#define typedef_jsuex4dxqu
typedef struct tag_QNIduhT4idbCjepKLRxoXF jsuex4dxqu ;
#endif
#ifndef struct_tag_0FBto5uaozTuiNQkk9X8uG
#define struct_tag_0FBto5uaozTuiNQkk9X8uG
struct tag_0FBto5uaozTuiNQkk9X8uG { int32_T isInitialized ; boolean_T validIn
; int32_T dataInReal ; int32_T dataInImag ; uint8_T lutIdx ; uint16_T sqroot2
; uint16_T one ; uint16_T sqrt3Plus1BySqrt2 ; uint16_T sqrt3Minus1BySqrt2 ;
uint16_T lut16 [ 12 ] ; int64_T dataOut [ 5 ] ; boolean_T validOut ; } ;
#endif
#ifndef typedef_dfltsowwfu
#define typedef_dfltsowwfu
typedef struct tag_0FBto5uaozTuiNQkk9X8uG dfltsowwfu ;
#endif
#ifndef struct_tag_x8D7F9wi2JSoIejwmwn6DG
#define struct_tag_x8D7F9wi2JSoIejwmwn6DG
struct tag_x8D7F9wi2JSoIejwmwn6DG { int32_T isInitialized ; boolean_T validIn
; int32_T dataInReal ; int32_T dataInImag ; uint8_T lutIdx ; uint16_T sqroot2
; uint16_T one ; uint16_T twoCosPiBy8 ; uint16_T twoCos3PiBy8 ; uint16_T
lut32 [ 30 ] ; int64_T dataOut [ 5 ] ; boolean_T validOut ; } ;
#endif
#ifndef typedef_dynahaxmc2
#define typedef_dynahaxmc2
typedef struct tag_x8D7F9wi2JSoIejwmwn6DG dynahaxmc2 ;
#endif
#ifndef struct_tag_NsaX6A2APgNkemq5aeRd7B
#define struct_tag_NsaX6A2APgNkemq5aeRd7B
struct tag_NsaX6A2APgNkemq5aeRd7B { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; int32_T W1_IC_BUFF [ 15 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; int32_T P0_IC ; } ;
#endif
#ifndef typedef_hkwn4eu25hs
#define typedef_hkwn4eu25hs
typedef struct tag_NsaX6A2APgNkemq5aeRd7B hkwn4eu25hs ;
#endif
#ifndef struct_tag_IwYC6EzQDIEDLzqU0hBwKD
#define struct_tag_IwYC6EzQDIEDLzqU0hBwKD
struct tag_IwYC6EzQDIEDLzqU0hBwKD { int32_T isInitialized ; olf2snm1ra
SymDemodPiBy2BPSKObj ; i20rzp01zs SymDemodQPSKObj ; jsuex4dxqu
SymDemod8PSKObj ; dfltsowwfu SymDemod16APSKObj ; dynahaxmc2 SymDemod32APSKObj
; cint32_T dataIn ; nbbe51cjmp ctrl ; boolean_T startInFlag ; boolean_T
endInFlag ; boolean_T evenSymFlag ; uint8_T bitsPerSym ; uint8_T lutIdx ;
uint8_T bitsPerSymReg ; uint8_T modIndx ; uint8_T codeRateIndx ; int32_T
buffVec1 [ 5 ] ; int32_T buffVec2 [ 8 ] ; uint8_T countVecElem ; uint8_T
countSym ; hkwn4eu25hs delayBalDataOut ; jzokrg3b41l delayBalStartOut ;
f155nsdw4l delayBalEndOut ; c0yjun5d3f delayBalValidOut ; ivctdv5dtx
delayBalScalarValidOut ; int32_T dataOutDelay ; int32_T dataOut ; boolean_T
validOut ; boolean_T readyReg ; uint8_T countBitsPerSym ; uint8_T
numBitsPerSym ; boolean_T inputReceiveFlag ; boolean_T scalarValid ;
boolean_T scalarValidOut ; boolean_T outputReadyFlag ; } ;
#endif
#ifndef typedef_iwyyheywfz
#define typedef_iwyyheywfz
typedef struct tag_IwYC6EzQDIEDLzqU0hBwKD iwyyheywfz ;
#endif
#ifndef struct_tag_PkZc5c4zqulPdrCSzx2bc
#define struct_tag_PkZc5c4zqulPdrCSzx2bc
struct tag_PkZc5c4zqulPdrCSzx2bc { int32_T isInitialized ; uint16_T dataCount
; boolean_T parityInd ; boolean_T frameValid ; boolean_T endInd ; boolean_T
endIndReg ; boolean_T endReg ; boolean_T validReg ; int8_T dataOut ;
boolean_T validOut ; boolean_T frameValidOut ; boolean_T resetOut ; boolean_T
endIndOut ; uint8_T numIterOut ; boolean_T parityIndOut ; } ;
#endif
#ifndef typedef_lpxic24f00
#define typedef_lpxic24f00
typedef struct tag_PkZc5c4zqulPdrCSzx2bc lpxic24f00 ;
#endif
#ifndef struct_tag_Qkh8ZEqRjmAqJmV2ILGwgH
#define struct_tag_Qkh8ZEqRjmAqJmV2ILGwgH
struct tag_Qkh8ZEqRjmAqJmV2ILGwgH { int32_T isInitialized ; iiczx52afi
inputVarSize [ 4 ] ; int16_T pRAM [ 92160 ] ; int16_T pOutReadData [ 45 ] ; }
;
#endif
#ifndef typedef_ckyin0cieh
#define typedef_ckyin0cieh
typedef struct tag_Qkh8ZEqRjmAqJmV2ILGwgH ckyin0cieh ;
#endif
#ifndef struct_tag_IimgyFSxMAaGFhD0wK5IlF
#define struct_tag_IimgyFSxMAaGFhD0wK5IlF
struct tag_IimgyFSxMAaGFhD0wK5IlF { int32_T isInitialized ; uint16_T colVal ;
uint8_T shiftVal ; uint16_T parVal ; boolean_T ddsmInd ; uint16_T prevColLUT
[ 32 ] ; uint8_T prevShiftLUT [ 32 ] ; uint16_T nextColLUT [ 32 ] ; uint8_T
nextShiftLUT [ 32 ] ; } ;
#endif
#ifndef typedef_ez32bhropr
#define typedef_ez32bhropr
typedef struct tag_IimgyFSxMAaGFhD0wK5IlF ez32bhropr ;
#endif
#ifndef struct_tag_9IpUKt1rj6CmPsilEwDtUE
#define struct_tag_9IpUKt1rj6CmPsilEwDtUE
struct tag_9IpUKt1rj6CmPsilEwDtUE { int32_T isInitialized ; iiczx52afi
inputVarSize [ 4 ] ; uint16_T pRAM [ 32 ] ; uint16_T pOutReadData ; } ;
#endif
#ifndef typedef_azkgchuw1x
#define typedef_azkgchuw1x
typedef struct tag_9IpUKt1rj6CmPsilEwDtUE azkgchuw1x ;
#endif
#ifndef struct_tag_BxDi9B8Z7LYBV0pRWDzDsG
#define struct_tag_BxDi9B8Z7LYBV0pRWDzDsG
struct tag_BxDi9B8Z7LYBV0pRWDzDsG { int32_T isInitialized ; iiczx52afi
inputVarSize [ 4 ] ; uint16_T pRAM [ 8 ] ; uint16_T pOutReadData ; } ;
#endif
#ifndef typedef_jkvcpbajbq
#define typedef_jkvcpbajbq
typedef struct tag_BxDi9B8Z7LYBV0pRWDzDsG jkvcpbajbq ;
#endif
#ifndef struct_tag_YPIeAR3v5szbwKam5jLvnH
#define struct_tag_YPIeAR3v5szbwKam5jLvnH
struct tag_YPIeAR3v5szbwKam5jLvnH { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; uint16_T W1_IC_BUFF [ 2 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; uint16_T P0_IC ; } ;
#endif
#ifndef typedef_l4cza2kzfo
#define typedef_l4cza2kzfo
typedef struct tag_YPIeAR3v5szbwKam5jLvnH l4cza2kzfo ;
#endif
#ifndef struct_tag_7lSIEYuEp9eMvyyHqlIIfH
#define struct_tag_7lSIEYuEp9eMvyyHqlIIfH
struct tag_7lSIEYuEp9eMvyyHqlIIfH { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; uint16_T W1_IC_BUFF [ 2 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; uint16_T P0_IC ; } ;
#endif
#ifndef typedef_kh2vp1ehg4
#define typedef_kh2vp1ehg4
typedef struct tag_7lSIEYuEp9eMvyyHqlIIfH kh2vp1ehg4 ;
#endif
#ifndef struct_tag_k4xa4qJdnYyTjyTpYH1rhE
#define struct_tag_k4xa4qJdnYyTjyTpYH1rhE
struct tag_k4xa4qJdnYyTjyTpYH1rhE { int32_T isInitialized ; ckyin0cieh
infoVNRAM ; ckyin0cieh parityVNRAM ; ez32bhropr checkMatrixLUT ; azkgchuw1x
vDInfoCol ; jkvcpbajbq vDParityCol ; int16_T dataIn ; boolean_T validIn ;
boolean_T frameValid ; boolean_T softReset ; boolean_T parInd ; boolean_T
gParValid ; boolean_T gParValidReg ; uint16_T readAddrLUT [ 58320 ] ;
uint16_T layerIdx ; boolean_T pValid ; boolean_T pValidReg ; uint16_T
shiftVal ; lofhmsmwkx delayBalancer1 ; l4cza2kzfo delayBalancer2 ; kh2vp1ehg4
delayBalancer3 ; uint8_T degreeVal ; uint8_T degreeValTmp ; uint8_T
degreeValTmp1 ; boolean_T gValidReg ; uint16_T countLayer ; boolean_T
layerDone ; boolean_T iterDone ; uint16_T iwrAddr ; boolean_T iwrEnb [ 45 ] ;
int16_T iwrData [ 45 ] ; uint8_T ivalidCount ; uint16_T pwrAddr ; boolean_T
pwrEnb [ 45 ] ; int16_T pwrData [ 45 ] ; uint8_T pvalidCount ; uint8_T
pVCount ; boolean_T noOp ; boolean_T dataSel ; uint8_T icount ; uint16_T
icolCount ; uint16_T iaCount ; uint16_T pcount ; uint16_T pcolCount ;
uint16_T paCount ; uint16_T pqCount ; uint16_T pcountTmp ; boolean_T rdEnb ;
boolean_T rdValid ; boolean_T parityRead ; uint16_T rdAddr ; boolean_T
finalEnb ; uint16_T rdCount ; boolean_T betaRead ; uint8_T iterCount ;
boolean_T rdValidR ; uint8_T countR ; int16_T rdDataR [ 45 ] ; uint8_T
iwrAddrV ; boolean_T iwrValidV ; uint8_T irdAddrV ; uint8_T pwrAddrV ;
boolean_T pwrValidV ; uint8_T prdAddrV ; int16_T colDataO [ 45 ] ; uint16_T
sValO ; boolean_T rdValidO ; boolean_T ddsmIndO ; boolean_T parValidO ;
uint16_T layerIdxO ; boolean_T betaReadO ; uint8_T degreeO ; boolean_T
iterDoneO ; uint16_T rdCountO ; int16_T irdDataO [ 45 ] ; uint16_T pAddrTmp ;
uint8_T iterOut ; } ;
#endif
#ifndef typedef_axfvdnntwp
#define typedef_axfvdnntwp
typedef struct tag_k4xa4qJdnYyTjyTpYH1rhE axfvdnntwp ;
#endif
#ifndef struct_tag_pmFIN0UvrWhLT4IypQj21
#define struct_tag_pmFIN0UvrWhLT4IypQj21
struct tag_pmFIN0UvrWhLT4IypQj21 { int32_T isInitialized ; iiczx52afi
inputVarSize [ 4 ] ; int16_T pRAM [ 11520 ] ; int16_T pOutReadData [ 45 ] ; }
;
#endif
#ifndef typedef_dr12sln1ke
#define typedef_dr12sln1ke
typedef struct tag_pmFIN0UvrWhLT4IypQj21 dr12sln1ke ;
#endif
#ifndef struct_tag_43wWQm1F21FwFuOni4REHE
#define struct_tag_43wWQm1F21FwFuOni4REHE
struct tag_43wWQm1F21FwFuOni4REHE { int32_T isInitialized ; int16_T gammaOut
[ 45 ] ; boolean_T validOut ; uint64_T betaCompress1 [ 45 ] ; uint16_T
betaCompress2 [ 45 ] ; uint16_T bcomp2 [ 45 ] ; boolean_T betaValidOut ;
uint8_T countTo1 ; boolean_T enb ; int16_T alpha [ 45 ] ; int16_T alphaD [ 45
] ; uint8_T countTo2 ; uint8_T countTo3 ; boolean_T enb1 ; boolean_T rdvalid
; uint8_T wrAddr ; uint8_T rdAddr ; boolean_T valid ; uint8_T minVal1 [ 45 ]
; uint8_T minVal2 [ 45 ] ; uint8_T minIdx [ 45 ] ; int8_T prodSign [ 45 ] ;
uint8_T prodSignBit [ 45 ] ; int8_T signsBeta1 [ 1350 ] ; int8_T signsBeta2 [
1350 ] ; uint8_T signsAll [ 1350 ] ; int16_T dataMax [ 45 ] ; dr12sln1ke
variableDelay ; } ;
#endif
#ifndef typedef_ee22jylnqq
#define typedef_ee22jylnqq
typedef struct tag_43wWQm1F21FwFuOni4REHE ee22jylnqq ;
#endif
#ifndef struct_tag_t2SpL6YlPDu7ajvKaNtalF
#define struct_tag_t2SpL6YlPDu7ajvKaNtalF
struct tag_t2SpL6YlPDu7ajvKaNtalF { int32_T isInitialized ; uint64_T beta1 [
48600 ] ; uint16_T beta2 [ 48600 ] ; uint64_T betaOut1 [ 45 ] ; uint16_T
betaOut2 [ 45 ] ; boolean_T validOut ; } ;
#endif
#ifndef typedef_oznjtkrvcp
#define typedef_oznjtkrvcp
typedef struct tag_t2SpL6YlPDu7ajvKaNtalF oznjtkrvcp ;
#endif
#ifndef struct_tag_KeZ0bLb9HKCTJdEidG6GMG
#define struct_tag_KeZ0bLb9HKCTJdEidG6GMG
struct tag_KeZ0bLb9HKCTJdEidG6GMG { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; uint64_T W1_IC_BUFF [ 45 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; uint64_T P0_IC ; } ;
#endif
#ifndef typedef_k25ki3ui0r
#define typedef_k25ki3ui0r
typedef struct tag_KeZ0bLb9HKCTJdEidG6GMG k25ki3ui0r ;
#endif
#ifndef struct_tag_IJBMX2teFgblux8Ohc3ehD
#define struct_tag_IJBMX2teFgblux8Ohc3ehD
struct tag_IJBMX2teFgblux8Ohc3ehD { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; int16_T W1_IC_BUFF [ 90 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; int16_T P0_IC ; } ;
#endif
#ifndef typedef_a5x315hlfj
#define typedef_a5x315hlfj
typedef struct tag_IJBMX2teFgblux8Ohc3ehD a5x315hlfj ;
#endif
#ifndef struct_tag_eageTRTrRw0tTsq1KQpsV
#define struct_tag_eageTRTrRw0tTsq1KQpsV
struct tag_eageTRTrRw0tTsq1KQpsV { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; uint8_T W1_IC_BUFF [ 2 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; uint8_T P0_IC ; } ;
#endif
#ifndef typedef_eebcc4flvg
#define typedef_eebcc4flvg
typedef struct tag_eageTRTrRw0tTsq1KQpsV eebcc4flvg ;
#endif
#ifndef struct_tag_3CZsmaBuaeTpT50GG1h1oH
#define struct_tag_3CZsmaBuaeTpT50GG1h1oH
struct tag_3CZsmaBuaeTpT50GG1h1oH { int32_T S0_isInitialized ; int32_T
W0_CIRC_BUF_IDX ; int16_T W1_IC_BUFF [ 135 ] ; int32_T W2_PrevNumChan ;
boolean_T W3_NeedsToInit ; int16_T P0_IC ; } ;
#endif
#ifndef typedef_kayat1h5tk
#define typedef_kayat1h5tk
typedef struct tag_3CZsmaBuaeTpT50GG1h1oH kayat1h5tk ;
#endif
#ifndef struct_tag_dLqvxDDyiH9bG0Q7uYw1X
#define struct_tag_dLqvxDDyiH9bG0Q7uYw1X
struct tag_dLqvxDDyiH9bG0Q7uYw1X { int32_T isInitialized ; iiczx52afi
inputVarSize [ 4 ] ; uint16_T pRAM [ 32 ] ; uint16_T pOutReadData ; } ;
#endif
#ifndef typedef_mmldisqxie
#define typedef_mmldisqxie
typedef struct tag_dLqvxDDyiH9bG0Q7uYw1X mmldisqxie ;
#endif
#ifndef struct_tag_egi4Yb9INDkZLVQdteiFnB
#define struct_tag_egi4Yb9INDkZLVQdteiFnB
struct tag_egi4Yb9INDkZLVQdteiFnB { int32_T isInitialized ; iiczx52afi
inputVarSize [ 4 ] ; uint8_T pRAM [ 32 ] ; uint8_T pOutReadData ; } ;
#endif
#ifndef typedef_hczoy12iot
#define typedef_hczoy12iot
typedef struct tag_egi4Yb9INDkZLVQdteiFnB hczoy12iot ;
#endif
#ifndef struct_tag_usrSa8l5vUAXaMIWhnb9zD
#define struct_tag_usrSa8l5vUAXaMIWhnb9zD
struct tag_usrSa8l5vUAXaMIWhnb9zD { int32_T isInitialized ; ee22jylnqq
functionalUnit ; oznjtkrvcp betaMemory ; k25ki3ui0r betaDecompDelayBalancer1
; ft4mmzycq0 betaDecompDelayBalancer2 ; hrstjofi5d betaDecompDelayBalancer3 ;
a5x315hlfj delayBalancer1 ; ipvraypll3 delayBalancer2 ; eebcc4flvg
delayBalancer3 ; kayat1h5tk delayBalancer4 ; mmldisqxie vDShift ; hczoy12iot
vDValid ; i3owf1jks2 vDDDSM ; uint64_T betaDecomp1 [ 45 ] ; uint16_T
betaDecomp2 [ 45 ] ; boolean_T betaValid ; boolean_T ddsmInd ; int16_T sData
[ 45 ] ; boolean_T sValid ; uint8_T wrAddr ; uint8_T rdAddr ; boolean_T
wrValid ; boolean_T wrEnbReg ; int16_T gammaOut [ 45 ] ; boolean_T gammaValid
; boolean_T gParValid ; int16_T sDataOut [ 45 ] ; } ;
#endif
#ifndef typedef_h4srrqu1lw
#define typedef_h4srrqu1lw
typedef struct tag_usrSa8l5vUAXaMIWhnb9zD h4srrqu1lw ;
#endif
#ifndef struct_tag_43jTdwIM227rpeCJSw9Y3G
#define struct_tag_43jTdwIM227rpeCJSw9Y3G
struct tag_43jTdwIM227rpeCJSw9Y3G { int32_T isInitialized ; a1l3uxgfvb
interleaver ; axfvdnntwp iterationController ; ih50nepoc4
iterationControllerVec ; h4srrqu1lw metricCalculator ; hkwn4eu25h
delayBalancer1 ; jzokrg3b41 delayBalancer2 ; boolean_T gParValid ; int16_T
gammaOut [ 45 ] ; boolean_T gammaValid ; uint16_T layerIdxReg ; boolean_T
ddsmInd ; uint16_T rdCount ; boolean_T iterDone ; int16_T fData [ 45 ] ;
boolean_T termPass ; int16_T gOutReg [ 45 ] ; boolean_T gValidReg ; boolean_T
gParValidReg ; boolean_T iValid ; boolean_T parValid ; uint8_T count ;
int16_T rdData [ 45 ] ; boolean_T wrEn [ 45 ] ; int16_T rdDataE [ 45 ] ;
boolean_T iterDoneF ; boolean_T dataOutF ; boolean_T startOutF ; boolean_T
endOutF ; boolean_T validOutF ; uint16_T countF ; uint8_T countZ ; uint16_T
rdCountF ; boolean_T readF ; boolean_T startEnb ; boolean_T dataOut ;
samplecontrol ctrlOut ; uint8_T iterOut ; boolean_T parCheck ; } ;
#endif
#ifndef typedef_m5v2waj1ov
#define typedef_m5v2waj1ov
typedef struct tag_43jTdwIM227rpeCJSw9Y3G m5v2waj1ov ;
#endif
#ifndef struct_tag_hKTvt6NNT1H2vKzdiE9brH
#define struct_tag_hKTvt6NNT1H2vKzdiE9brH
struct tag_hKTvt6NNT1H2vKzdiE9brH { int32_T isInitialized ; lpxic24f00
codeParameters ; m5v2waj1ov ldpcDecoderCore ; uint8_T refIter ; uint8_T
blkLenIdx ; uint8_T codeRateIdx ; uint16_T nLayers ; uint16_T infoCol ;
uint16_T outLen ; boolean_T invalidCodeRateIdx ; boolean_T frameValid ;
uint16_T countData ; boolean_T invalidLength ; uint16_T maxCount ; int8_T
dataReg ; samplecontrol ctrlReg ; samplecontrol ctrlOutReg ; uint8_T
nmsScaling ; boolean_T dataOut ; samplecontrol ctrlOut ; boolean_T nextFrame
; } ;
#endif
#ifndef typedef_av0uciy0rp
#define typedef_av0uciy0rp
typedef struct tag_hKTvt6NNT1H2vKzdiE9brH av0uciy0rp ;
#endif
#ifndef struct_tag_HU0LRPlhdZYbUUJbrTEBTH
#define struct_tag_HU0LRPlhdZYbUUJbrTEBTH
struct tag_HU0LRPlhdZYbUUJbrTEBTH { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint32_T
pOutputBuffer [ 224 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 28
] ; cint64_T pAccReg [ 41 ] ; } ;
#endif
#ifndef typedef_hjop4kvaf212by
#define typedef_hjop4kvaf212by
typedef struct tag_HU0LRPlhdZYbUUJbrTEBTH hjop4kvaf212by ;
#endif
#ifndef struct_tag_xfkV4gzXacmnQzRUeMFc3F
#define struct_tag_xfkV4gzXacmnQzRUeMFc3F
struct tag_xfkV4gzXacmnQzRUeMFc3F { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint16_T
pOutputBuffer [ 304 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 38
] ; cint64_T pAccReg [ 32 ] ; } ;
#endif
#ifndef typedef_hjop4kvaf212by5
#define typedef_hjop4kvaf212by5
typedef struct tag_xfkV4gzXacmnQzRUeMFc3F hjop4kvaf212by5 ;
#endif
#ifndef struct_tag_0nH5p8TB4neL9NiAzjasgF
#define struct_tag_0nH5p8TB4neL9NiAzjasgF
struct tag_0nH5p8TB4neL9NiAzjasgF { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint16_T
pOutputBuffer [ 304 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 38
] ; cint64_T pAccReg [ 32 ] ; } ;
#endif
#ifndef typedef_fyxcr4xpr3
#define typedef_fyxcr4xpr3
typedef struct tag_0nH5p8TB4neL9NiAzjasgF fyxcr4xpr3 ;
#endif
#ifndef struct_tag_0btOOtMtaRsRxaEElhHmyF
#define struct_tag_0btOOtMtaRsRxaEElhHmyF
struct tag_0btOOtMtaRsRxaEElhHmyF { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint16_T
pOutputBuffer [ 184 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 23
] ; cint64_T pAccReg [ 32 ] ; } ;
#endif
#ifndef typedef_cikl3a0401
#define typedef_cikl3a0401
typedef struct tag_0btOOtMtaRsRxaEElhHmyF cikl3a0401 ;
#endif
#ifndef struct_tag_19KQlAs7rLWDAMh9joyoRE
#define struct_tag_19KQlAs7rLWDAMh9joyoRE
struct tag_19KQlAs7rLWDAMh9joyoRE { int32_T isInitialized ; boolean_T
pWrOutBuffer_roll ; boolean_T pRdOutBuffer_roll ; boolean_T pResetStart ;
boolean_T pOutputVld ; boolean_T pDinVldReg1 ; boolean_T pDinVldReg2 ; real_T
pWrOutBuffer_index ; real_T pRdOutBuffer_index ; real_T pSimTime ; cint16_T
pOutputBuffer [ 304 ] ; real_T pFilterBankIndex ; real_T pVldInPipeline [ 38
] ; cint64_T pAccReg [ 32 ] ; } ;
#endif
#ifndef typedef_dhjs1kaowh
#define typedef_dhjs1kaowh
typedef struct tag_19KQlAs7rLWDAMh9joyoRE dhjs1kaowh ;
#endif
#ifndef struct_emxArray_uint32_T
#define struct_emxArray_uint32_T
struct emxArray_uint32_T { uint32_T * data ; int32_T * size ; int32_T
allocatedSize ; int32_T numDimensions ; boolean_T canFreeData ; } ;
#endif
#ifndef typedef_ecdphjlsik
#define typedef_ecdphjlsik
typedef struct emxArray_uint32_T ecdphjlsik ;
#endif
#ifndef struct_emxArray_int32_T
#define struct_emxArray_int32_T
struct emxArray_int32_T { int32_T * data ; int32_T * size ; int32_T
allocatedSize ; int32_T numDimensions ; boolean_T canFreeData ; } ;
#endif
#ifndef typedef_n3g1w1thfe
#define typedef_n3g1w1thfe
typedef struct emxArray_int32_T n3g1w1thfe ;
#endif
#ifndef struct_tag_jnYTbj8b4w6jhBl3rTHjDD
#define struct_tag_jnYTbj8b4w6jhBl3rTHjDD
struct tag_jnYTbj8b4w6jhBl3rTHjDD { int32_T isInitialized ; uint32_T tCorr ;
uint16_T Latency ; uint32_T N ; uint32_T K ; uint32_T N_long ; boolean_T
cheinDone ; boolean_T DataRAM [ 131070 ] ; uint32_T RAMWriteAddr ; uint8_T
PacketWriteAddr ; uint32_T RAMReadAddr ; uint8_T PacketReadAddr ; uint32_T
sampleCounter ; boolean_T InPacket ; ecdphjlsik * syndrome ; ecdphjlsik *
syndrometemp ; ecdphjlsik * syntemp ; ecdphjlsik * eleIdx ; real_T eleVal ;
uint32_T gfTable1_16 [ 65535 ] ; uint32_T gfTable2_16 [ 65535 ] ; uint32_T
gfTable1_14 [ 65535 ] ; uint32_T gfTable2_14 [ 65535 ] ; uint32_T GFTable1 [
65535 ] ; uint32_T GFTable2 [ 65535 ] ; uint8_T codeRateIndex ; boolean_T
frameType ; uint32_T doubleCorr ; n3g1w1thfe * errPos ; int8_T cnumerrInt ;
ecdphjlsik * errLocatorPoly ; int8_T L ; boolean_T dataOut ; boolean_T dataIn
; boolean_T startIn ; boolean_T startInput ; boolean_T endInput ; boolean_T
endIn ; boolean_T validIn ; boolean_T validInput ; boolean_T nextFrame ;
boolean_T syndromeEnd ; uint16_T sampCounter ; boolean_T inStart ; boolean_T
startOut ; boolean_T validOut ; boolean_T endOut ; boolean_T nextFrameOut ;
uint16_T latencyCount ; boolean_T latencyEnb ; } ;
#endif
#ifndef typedef_oczo2g13ig
#define typedef_oczo2g13ig
typedef struct tag_jnYTbj8b4w6jhBl3rTHjDD oczo2g13ig ;
#endif
#ifndef struct_emxArray_int16_T
#define struct_emxArray_int16_T
struct emxArray_int16_T { int16_T * data ; int32_T * size ; int32_T
allocatedSize ; int32_T numDimensions ; boolean_T canFreeData ; } ;
#endif
#ifndef typedef_j5kxlkaiv0
#define typedef_j5kxlkaiv0
typedef struct emxArray_int16_T j5kxlkaiv0 ;
#endif
#ifndef struct_tag_7A9W1ZiCP8n1rjHBe7h3sC
#define struct_tag_7A9W1ZiCP8n1rjHBe7h3sC
struct tag_7A9W1ZiCP8n1rjHBe7h3sC { int32_T isInitialized ; boolean_T
TunablePropsChanged ; hjop4kvaf212b * phFIR ; boolean_T pResetStart ;
boolean_T pCoeffDTCheck ; boolean_T pInitialize ; boolean_T pProcRst ;
hjop4kvaf212b coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_n5ly3warxp12
#define typedef_n5ly3warxp12
typedef struct tag_7A9W1ZiCP8n1rjHBe7h3sC n5ly3warxp12 ;
#endif
#ifndef struct_tag_Is8XZ5Pn9niy5d5ZJAS9cC
#define struct_tag_Is8XZ5Pn9niy5d5ZJAS9cC
struct tag_Is8XZ5Pn9niy5d5ZJAS9cC { int32_T isInitialized ; boolean_T
TunablePropsChanged ; hjop4kvaf212by * phFIR ; boolean_T pResetStart ;
boolean_T pCoeffDTCheck ; boolean_T pInitialize ; boolean_T pProcRst ;
hjop4kvaf212by coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_n5ly3warxp12e
#define typedef_n5ly3warxp12e
typedef struct tag_Is8XZ5Pn9niy5d5ZJAS9cC n5ly3warxp12e ;
#endif
#ifndef struct_tag_sI7TxKcgRZBD1wJquxMa6C
#define struct_tag_sI7TxKcgRZBD1wJquxMa6C
struct tag_sI7TxKcgRZBD1wJquxMa6C { int32_T isInitialized ; boolean_T
TunablePropsChanged ; hjop4kvaf21 * phFIR ; boolean_T pResetStart ; boolean_T
pCoeffDTCheck ; boolean_T pInitialize ; boolean_T pProcRst ; hjop4kvaf21
coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_n5ly3warxp12ec
#define typedef_n5ly3warxp12ec
typedef struct tag_sI7TxKcgRZBD1wJquxMa6C n5ly3warxp12ec ;
#endif
#ifndef struct_tag_64ZcmR3JvUEmHmeIP22OwB
#define struct_tag_64ZcmR3JvUEmHmeIP22OwB
struct tag_64ZcmR3JvUEmHmeIP22OwB { int32_T isInitialized ; boolean_T
TunablePropsChanged ; hjop4kvaf2 * phFIR ; boolean_T pResetStart ; boolean_T
pCoeffDTCheck ; boolean_T pInitialize ; boolean_T pProcRst ; hjop4kvaf2
coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_n5ly3warxp12ec5
#define typedef_n5ly3warxp12ec5
typedef struct tag_64ZcmR3JvUEmHmeIP22OwB n5ly3warxp12ec5 ;
#endif
#ifndef struct_tag_RIfWxThAwDaXHWpJE5JvAD
#define struct_tag_RIfWxThAwDaXHWpJE5JvAD
struct tag_RIfWxThAwDaXHWpJE5JvAD { int32_T isInitialized ; boolean_T
TunablePropsChanged ; hjop4kvaf212by5 * phFIR ; boolean_T pResetStart ;
boolean_T pCoeffDTCheck ; boolean_T pInitialize ; boolean_T pProcRst ;
hjop4kvaf212by5 coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_opfilscah0
#define typedef_opfilscah0
typedef struct tag_RIfWxThAwDaXHWpJE5JvAD opfilscah0 ;
#endif
#ifndef struct_tag_cSzDQOGmdvW5oNUG1twxpH
#define struct_tag_cSzDQOGmdvW5oNUG1twxpH
struct tag_cSzDQOGmdvW5oNUG1twxpH { int32_T isInitialized ; boolean_T
TunablePropsChanged ; fyxcr4xpr3 * phFIR ; boolean_T pResetStart ; boolean_T
pCoeffDTCheck ; boolean_T pInitialize ; boolean_T pProcRst ; fyxcr4xpr3
coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_gt0emzovcn
#define typedef_gt0emzovcn
typedef struct tag_cSzDQOGmdvW5oNUG1twxpH gt0emzovcn ;
#endif
#ifndef struct_tag_KyCEy5Rp6Mn1JLvXo7cn0G
#define struct_tag_KyCEy5Rp6Mn1JLvXo7cn0G
struct tag_KyCEy5Rp6Mn1JLvXo7cn0G { int32_T isInitialized ; boolean_T
TunablePropsChanged ; cikl3a0401 * phFIR ; boolean_T pResetStart ; boolean_T
pCoeffDTCheck ; boolean_T pInitialize ; boolean_T pProcRst ; cikl3a0401
coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_gcaf5whysh
#define typedef_gcaf5whysh
typedef struct tag_KyCEy5Rp6Mn1JLvXo7cn0G gcaf5whysh ;
#endif
#ifndef struct_tag_GqSyfF8yilE8th6iEZHsUH
#define struct_tag_GqSyfF8yilE8th6iEZHsUH
struct tag_GqSyfF8yilE8th6iEZHsUH { int32_T isInitialized ; boolean_T
TunablePropsChanged ; dhjs1kaowh * phFIR ; boolean_T pResetStart ; boolean_T
pCoeffDTCheck ; boolean_T pInitialize ; boolean_T pProcRst ; dhjs1kaowh
coder_buffer_pobj0 ; } ;
#endif
#ifndef typedef_lwokbvkeuv
#define typedef_lwokbvkeuv
typedef struct tag_GqSyfF8yilE8th6iEZHsUH lwokbvkeuv ;
#endif
#ifndef struct_tag_5mmE2SeF90lpOJRvDPujbC
#define struct_tag_5mmE2SeF90lpOJRvDPujbC
struct tag_5mmE2SeF90lpOJRvDPujbC { opfilscah0 * f1 ; gt0emzovcn * f2 ;
gcaf5whysh * f3 ; lwokbvkeuv * f4 ; } ;
#endif
#ifndef typedef_jm42ewxmgu
#define typedef_jm42ewxmgu
typedef struct tag_5mmE2SeF90lpOJRvDPujbC jm42ewxmgu ;
#endif
#ifndef struct_tag_Lc4yRqo8YH6WwkZL65FCaD
#define struct_tag_Lc4yRqo8YH6WwkZL65FCaD
struct tag_Lc4yRqo8YH6WwkZL65FCaD { int32_T isInitialized ; cint16_T
pOutputReg [ 4 ] ; boolean_T pVldOut ; jm42ewxmgu pFilterArray ; cint64_T
pDelayBalanceREG [ 64 ] ; real_T pFIRDelay [ 4 ] ; cint64_T pFilterOutput [ 4
] ; boolean_T pValidOutput [ 4 ] ; real_T pFIRMaxDelay ; real_T sharingCount
; boolean_T pRdyReg ; real_T resetCount ; boolean_T resetCountEn ; boolean_T
pTransientPad ; boolean_T pTransientPadREG ; boolean_T pResetStart ;
boolean_T pCoeffDTCheck ; boolean_T pInitialize ; lwokbvkeuv
coder_buffer_pobj0 ; gcaf5whysh coder_buffer_pobj1 ; gt0emzovcn
coder_buffer_pobj2 ; opfilscah0 coder_buffer_pobj3 ; } ;
#endif
#ifndef typedef_lfkfwlgp10
#define typedef_lfkfwlgp10
typedef struct tag_Lc4yRqo8YH6WwkZL65FCaD lfkfwlgp10 ;
#endif
#ifndef SS_UINT64
#define SS_UINT64 206
#endif
#ifndef SS_INT64
#define SS_INT64 207
#endif
typedef struct mtvx5hh5cj_ mtvx5hh5cj ; typedef struct mtvx5hh5cjf_
mtvx5hh5cjf ; typedef struct fncl3dbxwr_ fncl3dbxwr ; typedef struct
f5p2uvi2azu_ f5p2uvi2azu ; typedef struct gkc43afjjd gfinvvzb5m ;
#endif
