/*
 * File: modelPOC.c
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

#include "modelPOC.h"
#include "modelPOC_private.h"

/* Block signals (default storage) */
B_modelPOC_T modelPOC_B;

/* Real-time model */
static RT_MODEL_modelPOC_T modelPOC_M_;
RT_MODEL_modelPOC_T *const modelPOC_M = &modelPOC_M_;

/* Model step function */
void modelPOC_step(void)
{
  /* S-Function (csv_reader): '<Root>/C//C++ Code Block' */
  csv_reader_Outputs_wrapper(&modelPOC_B.CCCodeBlock[0]);
}

/* Model initialize function */
void modelPOC_initialize(void)
{
  /* Start for S-Function (csv_reader): '<Root>/C//C++ Code Block' */

  /* S-Function Block: <Root>/C//C++ Code Block */
  csv_reader_Start_wrapper();
}

/* Model terminate function */
void modelPOC_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
