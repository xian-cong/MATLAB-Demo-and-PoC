/*
 * File: modelPOC.h
 *
 * Code generated for Simulink model 'modelPOC'.
 *
 * Model version                  : 1.25
 * Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
 * C/C++ source code generated on : Mon Jan 19 16:35:53 2026
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef modelPOC_h_
#define modelPOC_h_
#ifndef modelPOC_COMMON_INCLUDES_
#define modelPOC_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "math.h"
#endif                                 /* modelPOC_COMMON_INCLUDES_ */

#include "modelPOC_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

/* Block signals (default storage) */
typedef struct {
  real_T CCCodeBlock[3];               /* '<Root>/C//C++ Code Block' */
} B_modelPOC_T;

/* Real-time Model Data Structure */
struct tag_RTM_modelPOC_T {
  const char_T * volatile errorStatus;
};

/* Block signals (default storage) */
extern B_modelPOC_T modelPOC_B;

/* Model entry point functions */
extern void modelPOC_initialize(void);
extern void modelPOC_step(void);
extern void modelPOC_terminate(void);

/* Real-time Model object */
extern RT_MODEL_modelPOC_T *const modelPOC_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<Root>/Add' : Unused code path elimination
 * Block '<Root>/Constant' : Unused code path elimination
 * Block '<Root>/Display' : Unused code path elimination
 * Block '<Root>/Display1' : Unused code path elimination
 * Block '<Root>/Display2' : Unused code path elimination
 * Block '<Root>/Gain' : Unused code path elimination
 * Block '<Root>/Scope' : Unused code path elimination
 * Block '<Root>/Sum of Elements' : Unused code path elimination
 * Block '<Root>/Trigonometric Function' : Unused code path elimination
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
 * '<Root>' : 'modelPOC'
 */
#endif                                 /* modelPOC_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
