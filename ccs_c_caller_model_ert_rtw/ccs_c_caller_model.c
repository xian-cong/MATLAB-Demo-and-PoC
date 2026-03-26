/*
 * File: ccs_c_caller_model.c
 *
 * Code generated for Simulink model 'ccs_c_caller_model'.
 *
 * Model version                  : 1.1
 * Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
 * C/C++ source code generated on : Thu Mar 26 16:33:19 2026
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Texas Instruments->C2000
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ccs_c_caller_model.h"
#include "rtwtypes.h"
#include "ccs_c_caller_model_private.h"
#include <string.h>

/* Block signals (default storage) */
B_ccs_c_caller_model_T ccs_c_caller_model_B;

/* Block states (default storage) */
DW_ccs_c_caller_model_T ccs_c_caller_model_DW;

/* Real-time model */
static RT_MODEL_ccs_c_caller_model_T ccs_c_caller_model_M_;
RT_MODEL_ccs_c_caller_model_T *const ccs_c_caller_model_M =
  &ccs_c_caller_model_M_;

#ifndef __TMS320C28XX_CLA__

uint16_T MW_adcInitFlag = 0;

#endif

/* Model step function */
void ccs_c_caller_model_step(void)
{
  /* S-Function (c2802xadc): '<Root>/ADC' */
  {
    /*  Internal Reference Voltage : Fixed scale 0 to 3.3 V range.  */
    /*  External Reference Voltage : Allowable ranges of VREFHI(ADCINA0) = 3.3 and VREFLO(tied to ground) = 0  */
    AdcRegs.ADCSOCFRC1.bit.SOC0 = 1U;

    /* Wait for the period of Sampling window and EOC result to be latched after trigger */
#ifndef __TMS320C28XX_CLA__

    asm(" RPT #44|| NOP");

#endif

#ifdef __TMS320C28XX_CLA__

    real32_T wait_index;
    for (wait_index= 7; wait_index > 0; wait_index--)
      __mnop();

#endif

    ccs_c_caller_model_B.ADC = (AdcResult.ADCRESULT0);
  }

  /* Gain: '<Root>/Gain' */
  ccs_c_caller_model_B.Gain = 54063UL * ccs_c_caller_model_B.ADC;

  /* CCaller: '<Root>/C Caller' */
  Custom_GPIO_Toggle();

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The resolution of this integer timer is 0.2, which is the step size
   * of the task. Size of "clockTick0" ensures timer will not overflow during the
   * application lifespan selected.
   */
  ccs_c_caller_model_M->Timing.clockTick0++;
}

/* Model initialize function */
void ccs_c_caller_model_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)ccs_c_caller_model_M, 0,
                sizeof(RT_MODEL_ccs_c_caller_model_T));
  rtmSetTFinal(ccs_c_caller_model_M, -1);

  /* External mode info */
  ccs_c_caller_model_M->Sizes.checksums[0] = (3886117730U);
  ccs_c_caller_model_M->Sizes.checksums[1] = (4164305855U);
  ccs_c_caller_model_M->Sizes.checksums[2] = (320541142U);
  ccs_c_caller_model_M->Sizes.checksums[3] = (3421554857U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    ccs_c_caller_model_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(ccs_c_caller_model_M->extModeInfo,
      &ccs_c_caller_model_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(ccs_c_caller_model_M->extModeInfo,
                        ccs_c_caller_model_M->Sizes.checksums);
    rteiSetTFinalTicks(ccs_c_caller_model_M->extModeInfo, -1);
  }

  /* block I/O */
  (void) memset(((void *) &ccs_c_caller_model_B), 0,
                sizeof(B_ccs_c_caller_model_T));

  /* states (dwork) */
  (void) memset((void *)&ccs_c_caller_model_DW, 0,
                sizeof(DW_ccs_c_caller_model_T));
}

/* Model terminate function */
void ccs_c_caller_model_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
