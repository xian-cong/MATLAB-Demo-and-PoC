/*
 * File: soc_dvbs2_proc.h
 *
 * Code generated for Simulink model 'soc_dvbs2_proc'.
 *
 * Model version                  : 11.0
 * Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
 * C/C++ source code generated on : Fri Dec  5 09:39:30 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-A (64-bit)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef soc_dvbs2_proc_h_
#define soc_dvbs2_proc_h_
#ifndef soc_dvbs2_proc_COMMON_INCLUDES_
#define soc_dvbs2_proc_COMMON_INCLUDES_
#include <stdio.h>
#include "rtwtypes.h"
#include "mw_axi_register_lct.h"
#include "MW_linuxUDP.h"
#include "mw_udp.h"
#include "iio.h"
#include "iio_helper.h"
#endif                                 /* soc_dvbs2_proc_COMMON_INCLUDES_ */

#include "soc_dvbs2_proc_types.h"
#include "model_reference_types.h"
#include <string.h>

extern void soc_dvbs2_proc_Init(void);
extern void soc_dvbs2_proc(real_T *rty_RxData, real_T *rty_statusUDPReport);
extern void soc_dvbs2_proc_dataTask(real_T *rty_done);
extern void soc_dvbs2_proc_Term(void);

/* Model reference registration function */
extern void soc_dvbs2_proc_initialize(const char_T **rt_errorStatus, const
  rtTimingBridge *timingBridge, int_T mdlref_TID0, int_T mdlref_TID1);

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<Root>/Manual Switch' : Eliminated due to constant selection input
 * Block '<Root>/Manual Switch2' : Eliminated due to constant selection input
 * Block '<Root>/Manual Switch3' : Eliminated due to constant selection input
 * Block '<Root>/Manual Switch6' : Eliminated due to constant selection input
 * Block '<S3>/Data Type Conversion13' : Eliminate redundant data type conversion
 * Block '<S19>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<S25>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<S27>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<Root>/Constant3' : Unused code path elimination
 * Block '<Root>/Constant4' : Unused code path elimination
 * Block '<Root>/Constant7' : Unused code path elimination
 * Block '<Root>/Constant8' : Unused code path elimination
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'soc_dvbs2_proc'
 * '<S1>'   : 'soc_dvbs2_proc/Processor Algorithm Periodic'
 * '<S2>'   : 'soc_dvbs2_proc/Read Event'
 * '<S3>'   : 'soc_dvbs2_proc/Processor Algorithm Periodic/Decode Status Signals'
 * '<S4>'   : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters'
 * '<S5>'   : 'soc_dvbs2_proc/Processor Algorithm Periodic/RxUDPData'
 * '<S6>'   : 'soc_dvbs2_proc/Processor Algorithm Periodic/Subsystem'
 * '<S7>'   : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters'
 * '<S8>'   : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read'
 * '<S9>'   : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read1'
 * '<S10>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read10'
 * '<S11>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read11'
 * '<S12>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read2'
 * '<S13>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read3'
 * '<S14>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read4'
 * '<S15>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read5'
 * '<S16>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read6'
 * '<S17>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read9'
 * '<S18>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read/Variant'
 * '<S19>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read/Variant/CODEGEN'
 * '<S20>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read1/Variant'
 * '<S21>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read1/Variant/CODEGEN'
 * '<S22>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read10/Variant'
 * '<S23>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read10/Variant/CODEGEN'
 * '<S24>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read11/Variant'
 * '<S25>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read11/Variant/CODEGEN'
 * '<S26>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read2/Variant'
 * '<S27>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read2/Variant/CODEGEN'
 * '<S28>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read3/Variant'
 * '<S29>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read3/Variant/CODEGEN'
 * '<S30>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read4/Variant'
 * '<S31>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read4/Variant/CODEGEN'
 * '<S32>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read5/Variant'
 * '<S33>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read5/Variant/CODEGEN'
 * '<S34>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read6/Variant'
 * '<S35>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read6/Variant/CODEGEN'
 * '<S36>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read9/Variant'
 * '<S37>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/ReadRegisters/Register Read9/Variant/CODEGEN'
 * '<S38>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/RxUDPData/UDP Write'
 * '<S39>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/RxUDPData/UDP Write/Variant'
 * '<S40>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/RxUDPData/UDP Write/Variant/CODEGEN'
 * '<S41>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/Subsystem/UDP Write'
 * '<S42>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/Subsystem/UDP Write/Variant'
 * '<S43>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/Subsystem/UDP Write/Variant/CODEGEN'
 * '<S44>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write'
 * '<S45>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write1'
 * '<S46>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write10'
 * '<S47>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write2'
 * '<S48>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write3'
 * '<S49>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write4'
 * '<S50>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write6'
 * '<S51>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write8'
 * '<S52>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write/Variant'
 * '<S53>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write/Variant/CODEGEN'
 * '<S54>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write1/Variant'
 * '<S55>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write1/Variant/CODEGEN'
 * '<S56>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write10/Variant'
 * '<S57>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write10/Variant/CODEGEN'
 * '<S58>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write2/Variant'
 * '<S59>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write2/Variant/CODEGEN'
 * '<S60>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write3/Variant'
 * '<S61>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write3/Variant/CODEGEN'
 * '<S62>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write4/Variant'
 * '<S63>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write4/Variant/CODEGEN'
 * '<S64>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write6/Variant'
 * '<S65>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write6/Variant/CODEGEN'
 * '<S66>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write8/Variant'
 * '<S67>'  : 'soc_dvbs2_proc/Processor Algorithm Periodic/WriteRegisters/Register Write8/Variant/CODEGEN'
 * '<S68>'  : 'soc_dvbs2_proc/Read Event/Stream Read'
 * '<S69>'  : 'soc_dvbs2_proc/Read Event/Stream Read/Variant'
 * '<S70>'  : 'soc_dvbs2_proc/Read Event/Stream Read/Variant/CODEGEN'
 */
#endif                                 /* soc_dvbs2_proc_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
