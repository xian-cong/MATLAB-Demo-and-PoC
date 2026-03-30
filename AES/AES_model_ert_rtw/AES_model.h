/*
 * File: AES_model.h
 *
 * Code generated for Simulink model 'AES_model'.
 *
 * Model version                  : 1.2
 * Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
 * C/C++ source code generated on : Mon Mar 30 15:04:55 2026
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Texas Instruments->C2000
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef AES_model_h_
#define AES_model_h_
#ifndef AES_model_COMMON_INCLUDES_
#define AES_model_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "AES.h"
#endif                                 /* AES_model_COMMON_INCLUDES_ */

#include "AES_model_types.h"
#include <stddef.h>
#include <string.h>

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

void MW_InitSysPll(uint16_T clock_source, uint16_T imult, uint32_T refdiv,
                   uint32_T odiv, uint16_T divsel, uint32_T dccbase);

/* Block states (default storage) for system '<Root>' */
typedef struct {
  AES_AES_model_T obj;                 /* '<Root>/AES_model' */
} DW_AES_model_T;

/* Constant parameters (default storage) */
typedef struct {
  /* Computed Parameter: Constant1_Value
   * Referenced by: '<Root>/Constant1'
   */
  uint32_T Constant1_Value[8];
} ConstP_AES_model_T;

/* Real-time Model Data Structure */
struct tag_RTM_AES_model_T {
  const char_T * volatile errorStatus;
};

/* Block states (default storage) */
extern DW_AES_model_T AES_model_DW;

/* Constant parameters (default storage) */
extern const ConstP_AES_model_T AES_model_ConstP;

/* Model entry point functions */
extern void AES_model_initialize(void);
extern void AES_model_step(void);
extern void AES_model_terminate(void);

/* Real-time Model object */
extern RT_MODEL_AES_model_T *const AES_model_M;
extern volatile boolean_T stopRequested;
extern volatile boolean_T runModel;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<Root>/Display' : Unused code path elimination
 * Block '<Root>/To Workspace' : Unused code path elimination
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
 * '<Root>' : 'AES_model'
 */
#endif                                 /* AES_model_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
