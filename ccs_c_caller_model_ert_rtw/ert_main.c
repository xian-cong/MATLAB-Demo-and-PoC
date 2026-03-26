/*
 * File: ert_main.c
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
#include "xcp.h"
#include "ext_mode.h"
#include "MW_target_hardware_resources.h"

volatile int IsrOverrun = 0;
static boolean_T OverrunFlag = 0;
void rt_OneStep(void)
{
  extmodeSimulationTime_T currentTime = (extmodeSimulationTime_T) 0;

  /* Check for overrun. Protect OverrunFlag against preemption */
  if (OverrunFlag++) {
    IsrOverrun = 1;
    OverrunFlag--;
    return;
  }

  enableTimer0Interrupt();
  currentTime = (extmodeSimulationTime_T)
    ccs_c_caller_model_M->Timing.clockTick0;
  ccs_c_caller_model_step();

  /* Get model outputs here */

  /* Trigger External Mode event */
  extmodeEvent(0, currentTime);
  disableTimer0Interrupt();
  OverrunFlag--;
}

volatile boolean_T stopRequested;
volatile boolean_T runModel;
int main(void)
{
  float modelBaseRate = 0.2;
  float systemClock = 90;
  extmodeErrorCode_T errorCode = EXTMODE_SUCCESS;

  /* Initialize variables */
  stopRequested = false;
  runModel = false;
  c2000_flash_init();
  init_board();

#if defined(MW_EXEC_PROFILER_ON) || (defined(MW_EXTMODE_RUNNING) && !defined(XCP_TIMESTAMP_BASED_ON_SIMULATION_TIME))

  hardwareTimer1Init();

#endif

  ;
  bootloaderInit();
  rtmSetErrorStatus(ccs_c_caller_model_M, 0);

  /* Set Final Simulation Time in Ticks */
  errorCode = extmodeSetFinalSimulationTime((extmodeSimulationTime_T) -1);

  /* Parse External Mode command line arguments */
  errorCode = extmodeParseArgs(0, NULL);
  if (errorCode != EXTMODE_SUCCESS) {
    return (errorCode);
  }

  ccs_c_caller_model_initialize();
  globalInterruptDisable();
  globalInterruptEnable();

  /* External Mode initialization */
  errorCode = extmodeInit(ccs_c_caller_model_M->extModeInfo,
    (extmodeSimulationTime_T *)rteiGetPtrTFinalTicks
    (ccs_c_caller_model_M->extModeInfo));
  if (errorCode != EXTMODE_SUCCESS) {
    /* Code to handle External Mode initialization errors
       may be added here */
  }

  if (errorCode == EXTMODE_SUCCESS) {
    /* Wait until a Start or Stop Request has been received from the Host */
    extmodeWaitForHostRequest(EXTMODE_WAIT_FOREVER);
    if (extmodeStopRequested()) {
      rtmSetStopRequested(ccs_c_caller_model_M, true);
    }
  }

  globalInterruptDisable();
  configureTimer0(modelBaseRate, systemClock);
  runModel =
    !extmodeSimulationComplete()&& !extmodeStopRequested()&&
    !rtmGetStopRequested(ccs_c_caller_model_M);
  enableTimer0Interrupt();
  globalInterruptEnable();
  while (runModel) {
    /* Run External Mode background activities */
    errorCode = extmodeBackgroundRun();
    if (errorCode != EXTMODE_SUCCESS && errorCode != EXTMODE_EMPTY) {
      /* Code to handle External Mode background task errors
         may be added here */
    }

    stopRequested = !(
                      !extmodeSimulationComplete()&& !extmodeStopRequested()&&
                      !rtmGetStopRequested(ccs_c_caller_model_M));
    runModel = !(stopRequested);
    if (stopRequested)
      disableTimer0Interrupt();
  }

  /* Terminate model */
  ccs_c_caller_model_terminate();

  /* External Mode reset */
  extmodeReset();
  globalInterruptDisable();
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
