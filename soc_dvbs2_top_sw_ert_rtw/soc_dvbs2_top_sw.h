/*
 * File: soc_dvbs2_top_sw.h
 *
 * Code generated for Simulink model 'soc_dvbs2_top_sw'.
 *
 * Model version                  : 1.2
 * Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
 * C/C++ source code generated on : Fri Dec  5 09:39:50 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-A (64-bit)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef soc_dvbs2_top_sw_h_
#define soc_dvbs2_top_sw_h_
#ifndef soc_dvbs2_top_sw_COMMON_INCLUDES_
#define soc_dvbs2_top_sw_COMMON_INCLUDES_
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <pthread.h>
#include <sched.h>
#include <semaphore.h>
#include <errno.h>
#include <stdio.h>
#include <limits.h>
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "dt_info.h"
#include "ext_work.h"
#include "code_profiling_utility_functions.h"
#endif                                 /* soc_dvbs2_top_sw_COMMON_INCLUDES_ */

#include "soc_dvbs2_top_sw_types.h"
#include "model_reference_types.h"
#include <stddef.h>
#include <float.h>
#include <string.h>

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWExtModeInfo
#define rtmGetRTWExtModeInfo(rtm)      ((rtm)->extModeInfo)
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetErrorStatusPointer
#define rtmGetErrorStatusPointer(rtm)  ((const char_T **)(&((rtm)->errorStatus)))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                (&(rtm)->Timing.taskTime0)
#endif

/* Block signals (default storage) */
typedef struct {
  real_T ProcessorFramebasedprocessing_o;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessing_k;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessing_a;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessin_kq;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessing_g;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessin_gn;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessing_f;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessing_l;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessing_j;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessing_p;
                               /* '<Root>/Processor - Frame based processing' */
  real_T ProcessorFramebasedprocessin_ae;
                               /* '<Root>/Processor - Frame based processing' */
} B_soc_dvbs2_top_sw_T;

/* Real-time Model Data Structure */
struct tag_RTM_soc_dvbs2_top_sw_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    time_T stepSize0;
    uint32_T clockTick1;
    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block signals (default storage) */
extern B_soc_dvbs2_top_sw_T soc_dvbs2_top_sw_B;

/* Model entry point functions */
extern void soc_dvbs2_top_sw_initialize(void);
extern void soc_dvbs2_top_sw_step(void);
extern void soc_dvbs2_top_sw_terminate(void);

/* Real-time Model object */
extern RT_MODEL_soc_dvbs2_top_sw_T *const soc_dvbs2_top_sw_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S22>/Constant' : Unused code path elimination
 * Block '<S25>/Constant' : Unused code path elimination
 * Block '<S28>/Constant' : Unused code path elimination
 * Block '<S31>/Constant' : Unused code path elimination
 * Block '<S34>/Constant' : Unused code path elimination
 * Block '<S37>/Constant' : Unused code path elimination
 * Block '<S40>/Constant' : Unused code path elimination
 * Block '<S43>/Constant' : Unused code path elimination
 * Block '<S46>/Constant' : Unused code path elimination
 * Block '<S49>/Constant' : Unused code path elimination
 * Block '<S52>/Constant' : Unused code path elimination
 * Block '<S55>/Constant' : Unused code path elimination
 * Block '<S58>/Constant' : Unused code path elimination
 * Block '<S61>/Constant' : Unused code path elimination
 * Block '<S64>/Constant' : Unused code path elimination
 * Block '<S67>/Constant' : Unused code path elimination
 * Block '<S70>/Constant' : Unused code path elimination
 * Block '<S73>/Constant' : Unused code path elimination
 * Block '<S76>/Constant' : Unused code path elimination
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
 * '<Root>' : 'soc_dvbs2_top_sw'
 * '<S1>'   : 'soc_dvbs2_top_sw/IODataSink_Register'
 * '<S2>'   : 'soc_dvbs2_top_sw/IODataSink_Register1'
 * '<S3>'   : 'soc_dvbs2_top_sw/IODataSink_Register2'
 * '<S4>'   : 'soc_dvbs2_top_sw/IODataSink_Register3'
 * '<S5>'   : 'soc_dvbs2_top_sw/IODataSink_Register4'
 * '<S6>'   : 'soc_dvbs2_top_sw/IODataSink_Register5'
 * '<S7>'   : 'soc_dvbs2_top_sw/IODataSink_Register6'
 * '<S8>'   : 'soc_dvbs2_top_sw/IODataSink_Register7'
 * '<S9>'   : 'soc_dvbs2_top_sw/IODataSource_Register'
 * '<S10>'  : 'soc_dvbs2_top_sw/IODataSource_Register1'
 * '<S11>'  : 'soc_dvbs2_top_sw/IODataSource_Register2'
 * '<S12>'  : 'soc_dvbs2_top_sw/IODataSource_Register3'
 * '<S13>'  : 'soc_dvbs2_top_sw/IODataSource_Register4'
 * '<S14>'  : 'soc_dvbs2_top_sw/IODataSource_Register5'
 * '<S15>'  : 'soc_dvbs2_top_sw/IODataSource_Register6'
 * '<S16>'  : 'soc_dvbs2_top_sw/IODataSource_Register7'
 * '<S17>'  : 'soc_dvbs2_top_sw/IODataSource_Register8'
 * '<S18>'  : 'soc_dvbs2_top_sw/IODataSource_Register9'
 * '<S19>'  : 'soc_dvbs2_top_sw/IODataSource_Stream'
 * '<S20>'  : 'soc_dvbs2_top_sw/Task Manager'
 * '<S21>'  : 'soc_dvbs2_top_sw/IODataSink_Register/Variant'
 * '<S22>'  : 'soc_dvbs2_top_sw/IODataSink_Register/Variant/CODEGEN'
 * '<S23>'  : 'soc_dvbs2_top_sw/IODataSink_Register/Variant/CODEGEN/Create rteEvent'
 * '<S24>'  : 'soc_dvbs2_top_sw/IODataSink_Register1/Variant'
 * '<S25>'  : 'soc_dvbs2_top_sw/IODataSink_Register1/Variant/CODEGEN'
 * '<S26>'  : 'soc_dvbs2_top_sw/IODataSink_Register1/Variant/CODEGEN/Create rteEvent'
 * '<S27>'  : 'soc_dvbs2_top_sw/IODataSink_Register2/Variant'
 * '<S28>'  : 'soc_dvbs2_top_sw/IODataSink_Register2/Variant/CODEGEN'
 * '<S29>'  : 'soc_dvbs2_top_sw/IODataSink_Register2/Variant/CODEGEN/Create rteEvent'
 * '<S30>'  : 'soc_dvbs2_top_sw/IODataSink_Register3/Variant'
 * '<S31>'  : 'soc_dvbs2_top_sw/IODataSink_Register3/Variant/CODEGEN'
 * '<S32>'  : 'soc_dvbs2_top_sw/IODataSink_Register3/Variant/CODEGEN/Create rteEvent'
 * '<S33>'  : 'soc_dvbs2_top_sw/IODataSink_Register4/Variant'
 * '<S34>'  : 'soc_dvbs2_top_sw/IODataSink_Register4/Variant/CODEGEN'
 * '<S35>'  : 'soc_dvbs2_top_sw/IODataSink_Register4/Variant/CODEGEN/Create rteEvent'
 * '<S36>'  : 'soc_dvbs2_top_sw/IODataSink_Register5/Variant'
 * '<S37>'  : 'soc_dvbs2_top_sw/IODataSink_Register5/Variant/CODEGEN'
 * '<S38>'  : 'soc_dvbs2_top_sw/IODataSink_Register5/Variant/CODEGEN/Create rteEvent'
 * '<S39>'  : 'soc_dvbs2_top_sw/IODataSink_Register6/Variant'
 * '<S40>'  : 'soc_dvbs2_top_sw/IODataSink_Register6/Variant/CODEGEN'
 * '<S41>'  : 'soc_dvbs2_top_sw/IODataSink_Register6/Variant/CODEGEN/Create rteEvent'
 * '<S42>'  : 'soc_dvbs2_top_sw/IODataSink_Register7/Variant'
 * '<S43>'  : 'soc_dvbs2_top_sw/IODataSink_Register7/Variant/CODEGEN'
 * '<S44>'  : 'soc_dvbs2_top_sw/IODataSink_Register7/Variant/CODEGEN/Create rteEvent'
 * '<S45>'  : 'soc_dvbs2_top_sw/IODataSource_Register/Variant'
 * '<S46>'  : 'soc_dvbs2_top_sw/IODataSource_Register/Variant/CODEGEN'
 * '<S47>'  : 'soc_dvbs2_top_sw/IODataSource_Register/Variant/CODEGEN/Create rteEvent'
 * '<S48>'  : 'soc_dvbs2_top_sw/IODataSource_Register1/Variant'
 * '<S49>'  : 'soc_dvbs2_top_sw/IODataSource_Register1/Variant/CODEGEN'
 * '<S50>'  : 'soc_dvbs2_top_sw/IODataSource_Register1/Variant/CODEGEN/Create rteEvent'
 * '<S51>'  : 'soc_dvbs2_top_sw/IODataSource_Register2/Variant'
 * '<S52>'  : 'soc_dvbs2_top_sw/IODataSource_Register2/Variant/CODEGEN'
 * '<S53>'  : 'soc_dvbs2_top_sw/IODataSource_Register2/Variant/CODEGEN/Create rteEvent'
 * '<S54>'  : 'soc_dvbs2_top_sw/IODataSource_Register3/Variant'
 * '<S55>'  : 'soc_dvbs2_top_sw/IODataSource_Register3/Variant/CODEGEN'
 * '<S56>'  : 'soc_dvbs2_top_sw/IODataSource_Register3/Variant/CODEGEN/Create rteEvent'
 * '<S57>'  : 'soc_dvbs2_top_sw/IODataSource_Register4/Variant'
 * '<S58>'  : 'soc_dvbs2_top_sw/IODataSource_Register4/Variant/CODEGEN'
 * '<S59>'  : 'soc_dvbs2_top_sw/IODataSource_Register4/Variant/CODEGEN/Create rteEvent'
 * '<S60>'  : 'soc_dvbs2_top_sw/IODataSource_Register5/Variant'
 * '<S61>'  : 'soc_dvbs2_top_sw/IODataSource_Register5/Variant/CODEGEN'
 * '<S62>'  : 'soc_dvbs2_top_sw/IODataSource_Register5/Variant/CODEGEN/Create rteEvent'
 * '<S63>'  : 'soc_dvbs2_top_sw/IODataSource_Register6/Variant'
 * '<S64>'  : 'soc_dvbs2_top_sw/IODataSource_Register6/Variant/CODEGEN'
 * '<S65>'  : 'soc_dvbs2_top_sw/IODataSource_Register6/Variant/CODEGEN/Create rteEvent'
 * '<S66>'  : 'soc_dvbs2_top_sw/IODataSource_Register7/Variant'
 * '<S67>'  : 'soc_dvbs2_top_sw/IODataSource_Register7/Variant/CODEGEN'
 * '<S68>'  : 'soc_dvbs2_top_sw/IODataSource_Register7/Variant/CODEGEN/Create rteEvent'
 * '<S69>'  : 'soc_dvbs2_top_sw/IODataSource_Register8/Variant'
 * '<S70>'  : 'soc_dvbs2_top_sw/IODataSource_Register8/Variant/CODEGEN'
 * '<S71>'  : 'soc_dvbs2_top_sw/IODataSource_Register8/Variant/CODEGEN/Create rteEvent'
 * '<S72>'  : 'soc_dvbs2_top_sw/IODataSource_Register9/Variant'
 * '<S73>'  : 'soc_dvbs2_top_sw/IODataSource_Register9/Variant/CODEGEN'
 * '<S74>'  : 'soc_dvbs2_top_sw/IODataSource_Register9/Variant/CODEGEN/Create rteEvent'
 * '<S75>'  : 'soc_dvbs2_top_sw/IODataSource_Stream/Variant'
 * '<S76>'  : 'soc_dvbs2_top_sw/IODataSource_Stream/Variant/CODEGEN'
 * '<S77>'  : 'soc_dvbs2_top_sw/IODataSource_Stream/Variant/CODEGEN/Create rteEvent'
 * '<S78>'  : 'soc_dvbs2_top_sw/Task Manager/Core Task Manager'
 * '<S79>'  : 'soc_dvbs2_top_sw/Task Manager/Task Blocks'
 * '<S80>'  : 'soc_dvbs2_top_sw/Task Manager/Core Task Manager/Variant Subsystem'
 * '<S81>'  : 'soc_dvbs2_top_sw/Task Manager/Core Task Manager/Variant Subsystem/HSBON'
 * '<S82>'  : 'soc_dvbs2_top_sw/Task Manager/Core Task Manager/Variant Subsystem/HSBON/Task Manager'
 * '<S83>'  : 'soc_dvbs2_top_sw/Task Manager/Core Task Manager/Variant Subsystem/HSBON/Task Manager/NOP'
 * '<S84>'  : 'soc_dvbs2_top_sw/Task Manager/Task Blocks/Variant Subsystem'
 * '<S85>'  : 'soc_dvbs2_top_sw/Task Manager/Task Blocks/Variant Subsystem/HSBON'
 * '<S86>'  : 'soc_dvbs2_top_sw/Task Manager/Task Blocks/Variant Subsystem/HSBON/PeriodicSubsystem'
 * '<S87>'  : 'soc_dvbs2_top_sw/Task Manager/Task Blocks/Variant Subsystem/HSBON/dataReadTaskSubsystem'
 * '<S88>'  : 'soc_dvbs2_top_sw/Task Manager/Task Blocks/Variant Subsystem/HSBON/PeriodicSubsystem/FcnCallGenPart'
 * '<S89>'  : 'soc_dvbs2_top_sw/Task Manager/Task Blocks/Variant Subsystem/HSBON/dataReadTaskSubsystem/TaskBlkPart'
 * '<S90>'  : 'soc_dvbs2_top_sw/Task Manager/Task Blocks/Variant Subsystem/HSBON/dataReadTaskSubsystem/TaskBlkPart/dataReadTaskBlk'
 */
#endif                                 /* soc_dvbs2_top_sw_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
