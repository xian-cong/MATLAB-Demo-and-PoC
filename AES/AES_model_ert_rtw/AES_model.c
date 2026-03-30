/*
 * File: AES_model.c
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

#include "AES_model.h"
#include "rtwtypes.h"
#include <string.h>

/* Block states (default storage) */
DW_AES_model_T AES_model_DW;

/* Real-time model */
static RT_MODEL_AES_model_T AES_model_M_;
RT_MODEL_AES_model_T *const AES_model_M = &AES_model_M_;

/* Model step function */
void AES_model_step(void)
{
  uint32_T b_key1[8];
  uint32_T b_key2[8];
  uint32_T b_authDataArray[4];
  uint32_T b_srcArray[4];
  uint32_T c_iniVector[4];
  uint32_T tmp[4];
  uint32_T tmp_0[4];
  uint32_T tmp_1[4];
  int16_T i;
  uint16_T b_varargout_4;

  /* MATLABSystem: '<Root>/AES_model' */
  if (AES_model_DW.obj.SampleTime != -1.0) {
    AES_model_DW.obj.SampleTime = -1.0;
  }

  /*         %% Define output properties */
  b_varargout_4 = 0U;

  /* Start for MATLABSystem: '<Root>/AES_model' */
  tmp[0] = 0UL;

  /* MATLABSystem: '<Root>/AES_model' incorporates:
   *  Constant: '<Root>/Constant'
   */
  tmp_0[0] = 0UL;
  tmp_1[0] = 0UL;
  b_srcArray[0] = 843314856UL;

  /* Start for MATLABSystem: '<Root>/AES_model' */
  tmp[1] = 0UL;

  /* MATLABSystem: '<Root>/AES_model' incorporates:
   *  Constant: '<Root>/Constant'
   */
  tmp_0[1] = 0UL;
  tmp_1[1] = 0UL;
  b_srcArray[1] = 2287612045UL;

  /* Start for MATLABSystem: '<Root>/AES_model' */
  tmp[2] = 0UL;

  /* MATLABSystem: '<Root>/AES_model' incorporates:
   *  Constant: '<Root>/Constant'
   */
  tmp_0[2] = 0UL;
  tmp_1[2] = 0UL;
  b_srcArray[2] = 825333922UL;

  /* Start for MATLABSystem: '<Root>/AES_model' */
  tmp[3] = 0UL;

  /* MATLABSystem: '<Root>/AES_model' incorporates:
   *  Constant: '<Root>/Constant'
   *  Constant: '<Root>/Constant1'
   *  Constant: '<Root>/Constant4'
   *  Constant: '<Root>/Constant5'
   */
  tmp_0[3] = 0UL;
  tmp_1[3] = 0UL;
  b_srcArray[3] = 3761702708UL;
  for (i = 0; i < 8; i++) {
    b_key1[i] = AES_model_ConstP.Constant1_Value[i];
    b_key2[i] = 0UL;
  }

  c_iniVector[0] = 0UL;
  b_authDataArray[0] = 0UL;
  c_iniVector[1] = 0UL;
  b_authDataArray[1] = 0UL;
  c_iniVector[2] = 0UL;
  b_authDataArray[2] = 0UL;
  c_iniVector[3] = 0UL;
  b_authDataArray[3] = 0UL;
  stepFunctionAES(&tmp[0], 4.0, &tmp_0[0], 4.0, &tmp_1[0], 4.0, &b_varargout_4,
                  1.0, &b_srcArray[0], 4.0, &b_key1[0], 8.0, &b_key2[0], 8.0,
                  &c_iniVector[0], 4.0, &b_authDataArray[0], 4.0, 0UL, 1.0);
}

/* Model initialize function */
void AES_model_initialize(void)
{
  /* Registration code */

  /* initialize error status */
  rtmSetErrorStatus(AES_model_M, (NULL));

  /* states (dwork) */
  (void) memset((void *)&AES_model_DW, 0,
                sizeof(DW_AES_model_T));

  /* Start for MATLABSystem: '<Root>/AES_model' */
  /*  Constructor */
  AES_model_DW.obj.matlabCodegenIsDeleted = false;
  AES_model_DW.obj.SampleTime = -1.0;
  AES_model_DW.obj.isInitialized = 1L;

  /*         %% Define output properties */
  /*   Check the input size */
  setupFunctionAES(0UL, 1.0, 1U, 1.0, 0U, 1.0, 0U, 1.0, 16UL, 1.0);
  AES_model_DW.obj.isSetupComplete = true;
}

/* Model terminate function */
void AES_model_terminate(void)
{
  /* Terminate for MATLABSystem: '<Root>/AES_model' */
  if (!AES_model_DW.obj.matlabCodegenIsDeleted) {
    AES_model_DW.obj.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<Root>/AES_model' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
