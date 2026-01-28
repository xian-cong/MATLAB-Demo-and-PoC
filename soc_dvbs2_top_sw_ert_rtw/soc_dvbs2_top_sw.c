/*
 * File: soc_dvbs2_top_sw.c
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

#include "soc_dvbs2_top_sw.h"
#include "rtwtypes.h"
#include "soc_dvbs2_top_sw_private.h"
#include "soc_dvbs2_proc.h"
#include "soc_dvbs2_top_sw_dt.h"
#include "code_profiling_utility_functions.h"

rtTimingBridge soc_dvbs2_top_sw_TimingBrdg;

/* Block signals (default storage) */
B_soc_dvbs2_top_sw_T soc_dvbs2_top_sw_B;

/* Real-time model */
static RT_MODEL_soc_dvbs2_top_sw_T soc_dvbs2_top_sw_M_;
RT_MODEL_soc_dvbs2_top_sw_T *const soc_dvbs2_top_sw_M = &soc_dvbs2_top_sw_M_;
void *ptr_streamread_mwdvbs2_ip0_s2mm0 = NULL;
void dataReadTask_fcn(void* arg)
{
  while (runModel) {
    mw_iio_poll(ptr_streamread_mwdvbs2_ip0_s2mm0);
    taskTimeStart_(6U);

    /* Call the system: <Root>/Processor - Frame based processing */
    {
      soc_dvbs2_top_sw_M->Timing.clockTick1 =
        soc_dvbs2_top_sw_M->Timing.clockTick0;

      /* S-Function (esb_task): '<S90>/S-Function1' */

      /* ModelReference: '<Root>/Processor - Frame based processing' */
      soc_dvbs2_proc_dataTask
        (&soc_dvbs2_top_sw_B.ProcessorFramebasedprocessing_o);

      /* End of Outputs for S-Function (esb_task): '<S90>/S-Function1' */
    }

    taskTimeEnd_(6U);
  }
}

/* Model step function */
void soc_dvbs2_top_sw_step(void)
{
  /* FunctionCallGenerator: '<S88>/FcnCallGen' */

  /* ModelReference: '<Root>/Processor - Frame based processing' */
  soc_dvbs2_proc(&soc_dvbs2_top_sw_B.ProcessorFramebasedprocessing_p,
                 &soc_dvbs2_top_sw_B.ProcessorFramebasedprocessin_ae);

  /* End of Outputs for FunctionCallGenerator: '<S88>/FcnCallGen' */

  /* External mode */
  rtExtModeUploadCheckTrigger(1);

  {                                    /* Sample time: [0.001s, 0.0s] */
    rtExtModeUpload(0, (real_T)soc_dvbs2_top_sw_M->Timing.taskTime0);
  }

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.001s, 0.0s] */
    if ((rtmGetTFinal(soc_dvbs2_top_sw_M)!=-1) &&
        !((rtmGetTFinal(soc_dvbs2_top_sw_M)-soc_dvbs2_top_sw_M->Timing.taskTime0)
          > soc_dvbs2_top_sw_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(soc_dvbs2_top_sw_M, "Simulation finished");
    }

    if (rtmGetStopRequested(soc_dvbs2_top_sw_M)) {
      rtmSetErrorStatus(soc_dvbs2_top_sw_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   */
  soc_dvbs2_top_sw_M->Timing.taskTime0 =
    ((time_T)(++soc_dvbs2_top_sw_M->Timing.clockTick0)) *
    soc_dvbs2_top_sw_M->Timing.stepSize0;
}

/* Model initialize function */
void soc_dvbs2_top_sw_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)soc_dvbs2_top_sw_M, 0,
                sizeof(RT_MODEL_soc_dvbs2_top_sw_T));
  rtmSetTFinal(soc_dvbs2_top_sw_M, -1);
  soc_dvbs2_top_sw_M->Timing.stepSize0 = 0.001;

  /* External mode info */
  soc_dvbs2_top_sw_M->Sizes.checksums[0] = (181657015U);
  soc_dvbs2_top_sw_M->Sizes.checksums[1] = (744541674U);
  soc_dvbs2_top_sw_M->Sizes.checksums[2] = (3967009731U);
  soc_dvbs2_top_sw_M->Sizes.checksums[3] = (1623474192U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    soc_dvbs2_top_sw_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(soc_dvbs2_top_sw_M->extModeInfo,
      &soc_dvbs2_top_sw_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(soc_dvbs2_top_sw_M->extModeInfo,
                        soc_dvbs2_top_sw_M->Sizes.checksums);
    rteiSetTPtr(soc_dvbs2_top_sw_M->extModeInfo, rtmGetTPtr(soc_dvbs2_top_sw_M));
  }

  /* block I/O */
  (void) memset(((void *) &soc_dvbs2_top_sw_B), 0,
                sizeof(B_soc_dvbs2_top_sw_T));

  {
    soc_dvbs2_top_sw_B.ProcessorFramebasedprocessing_k = 0.0;
    soc_dvbs2_top_sw_B.ProcessorFramebasedprocessing_a = 0.0;
    soc_dvbs2_top_sw_B.ProcessorFramebasedprocessin_kq = 0.0;
    soc_dvbs2_top_sw_B.ProcessorFramebasedprocessing_g = 0.0;
    soc_dvbs2_top_sw_B.ProcessorFramebasedprocessin_gn = 0.0;
    soc_dvbs2_top_sw_B.ProcessorFramebasedprocessing_f = 0.0;
    soc_dvbs2_top_sw_B.ProcessorFramebasedprocessing_l = 0.0;
    soc_dvbs2_top_sw_B.ProcessorFramebasedprocessing_j = 0.0;
  }

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    soc_dvbs2_top_sw_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 29;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;
  }

  {
    static uint32_T *clockTickPtrs[2];
    static real_T *taskTimePtrs[2];
    soc_dvbs2_top_sw_TimingBrdg.nTasks = 2;
    clockTickPtrs[0] = &(soc_dvbs2_top_sw_M->Timing.clockTick0);
    clockTickPtrs[1] = &(soc_dvbs2_top_sw_M->Timing.clockTick1);
    soc_dvbs2_top_sw_TimingBrdg.clockTick = clockTickPtrs;
    soc_dvbs2_top_sw_TimingBrdg.clockTickH = (NULL);
    taskTimePtrs[0] = &(soc_dvbs2_top_sw_M->Timing.taskTime0);
    taskTimePtrs[1] = (NULL);
    soc_dvbs2_top_sw_TimingBrdg.taskTime = taskTimePtrs;
  }

  /* Model Initialize function for ModelReference Block: '<Root>/Processor - Frame based processing' */
  soc_dvbs2_proc_initialize(rtmGetErrorStatusPointer(soc_dvbs2_top_sw_M),
    &soc_dvbs2_top_sw_TimingBrdg, 0, 1);

  /* SystemInitialize for S-Function (esb_task): '<S90>/S-Function1' */
  {
    mw_setAsyncTaskCodeGenInfo((void*) dataReadTask_fcn, "_socbAT1", 50, 0, 2, 0,
      0);
  }

  /* End of SystemInitialize for S-Function (esb_task): '<S90>/S-Function1' */

  /* SystemInitialize for ModelReference: '<Root>/Processor - Frame based processing' */
  soc_dvbs2_proc_Init();
}

/* Model terminate function */
void soc_dvbs2_top_sw_terminate(void)
{
  /* Terminate for ModelReference: '<Root>/Processor - Frame based processing' */
  soc_dvbs2_proc_Term();
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
