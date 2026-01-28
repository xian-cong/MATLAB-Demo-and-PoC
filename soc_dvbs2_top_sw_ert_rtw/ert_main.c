/*
 * File: ert_main.c
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

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include "code_profiling_utility_functions.h"
#include "soc_dvbs2_top_sw.h"
#include "soc_dvbs2_top_sw_private.h"
#include "rtwtypes.h"
#include "limits.h"
#include "linuxinitialize.h"

unsigned long int _tmwrunningCoreID;
extern void uploadProfileData(void*, void*, void*);
pthread_mutex_t profilingDataStoreMutex;
void store_code_profiling_data_point(void * pData, uint32_T numMemUnits,
  uint32_T sectionId)
{
  uint32_T * pTimerValue = (uint32_T *) pData;
  size_t elNum = 0;
  size_t numEls = numMemUnits/sizeof(uint32_T);
  for (elNum=0; elNum<numEls; ++elNum) {
    uploadProfileData((void*)&sectionId, (void*)&_tmwrunningCoreID, (void*)
                      &pTimerValue[elNum]);
  }
}

void code_profiling_atomic_read_store(uint32_T sectionId)
{
  pthread_mutex_lock(&profilingDataStoreMutex);

  /* Using a timer that increments on each tick. */
  uint32_T timerValue = (uint32_T)profileReadTimer();
  store_code_profiling_data_point((void *)(&timerValue), (uint32_T)(sizeof
    (uint32_T)), sectionId);
  pthread_mutex_unlock(&profilingDataStoreMutex);
}

#define UNUSED(x)                      x = x
#define NAMELEN                        16
#define EXIT_ON_ERROR(msg, cond)       if (cond) { return(0); }

extern const char_T *TgtConnInit(int_T argc, char_T *argv[]);
extern void TgtConnTerm();
extern void TgtConnPreStep(int_T tid);
extern void TgtConnPostStep(int_T tid);
const char_T *csErrorStatus;
void exitFcn(int_T sig);
void *terminateTask(void *arg);
void *baseRateTask(void *arg);
void *subrateTask(void *arg);
void *schedulerTask(void *arg);
void *SOCB_RateCounterTask(void);
volatile boolean_T stopRequested = false;
volatile boolean_T runModel = true;
sem_t stopSem;
sem_t baserateTaskSem;
sem_t SOCB_RateSchedulerSem;
int_T SOCB_RateTriggerCounter[1] = { 0 };

pthread_t baseRateThread;
pthread_t schedulerThread;
pthread_t SOCB_RateSchedulerThread;
pthread_t backgroundThread;
void *threadJoinStatus;
int_T terminatingmodel = 0;
int_T coreAffinityBaseRate;
int_T coreAffinity[0];

#define SOCB_RATE_TASK_WAITING         0
#define SOCB_RATE_TASK_READY           1
#define SOCB_RATE_TASK_RUNNING         2

uint16_T SOCB_RateTaskState[1] = { SOCB_RATE_TASK_WAITING };

uint16_T SOCB_DropOverranRate[1] = {
  0,
};

uint16_T SOCB_RateTimerEventCounter[1] = {
  1,
};

uint16_T SOCB_RateTimerEventCounterTrigVal[1] = {
  1,
};

void *SOCB_RateCounterFcn(void)
{
  SOCB_RateTriggerCounter[0]++;
  if ((SOCB_DropOverranRate[0]) && (SOCB_RateTaskState[0])) {
    SOCB_RateTriggerCounter[0]--;
    if (runModel) {
      taskTimeStart_((3U + (0)*2));
      taskTimeEnd_((3U + (0)*2));
    }
  } else if (SOCB_RateTriggerCounter[0] > 2) {
    SOCB_RateTriggerCounter[0]--;
    if (runModel) {
      taskTimeStart_((3U + (0)*2));
      taskTimeEnd_((3U + (0)*2));
    }
  }

  sem_post(&SOCB_RateSchedulerSem);
}

void *schedulerTask(void *arg)
{
  while (runModel) {
    sem_wait(&SOCB_RateSchedulerSem);
    if ((SOCB_RateTriggerCounter[0] > 0) && (SOCB_RateTaskState[0] !=
         SOCB_RATE_TASK_RUNNING)) {
      SOCB_RateTaskState[0] = SOCB_RATE_TASK_RUNNING;
      SOCB_RateTriggerCounter[0]--;
      sem_post(&baserateTaskSem);
    }
  }
}

void *baseRateTask(void *arg)
{
  runModel = (rtmGetErrorStatus(soc_dvbs2_top_sw_M) == (NULL)) &&
    !rtmGetStopRequested(soc_dvbs2_top_sw_M);
  while (runModel) {
    sem_wait(&baserateTaskSem);

    /* External mode */
    {
      boolean_T rtmStopReq = false;
      rtExtModePauseIfNeeded(soc_dvbs2_top_sw_M->extModeInfo, 1, &rtmStopReq);
      if (rtmStopReq) {
        rtmSetStopRequested(soc_dvbs2_top_sw_M, true);
      }

      if (rtmGetStopRequested(soc_dvbs2_top_sw_M) == true) {
        rtmSetErrorStatus(soc_dvbs2_top_sw_M, "Simulation finished");
        break;
      }
    }

    taskTimeStart_(2U);
    soc_dvbs2_top_sw_step();
    taskTimeEnd_(2U);

    /* Get model outputs here */
    rtExtModeCheckEndTrigger();
    stopRequested = !((rtmGetErrorStatus(soc_dvbs2_top_sw_M) == (NULL)) &&
                      !rtmGetStopRequested(soc_dvbs2_top_sw_M));
    runModel = !stopRequested;
    SOCB_RateTaskState[0] = SOCB_RATE_TASK_WAITING;
    sem_post(&SOCB_RateSchedulerSem);
  }

  runModel = 0;
  terminateTask(arg);
  pthread_exit((void *)0);
  return NULL;
}

void exitFcn(int_T sig)
{
  UNUSED(sig);
  rtmSetErrorStatus(soc_dvbs2_top_sw_M, "stopping the model");
}

void *terminateTask(void *arg)
{
  UNUSED(arg);
  terminatingmodel = 1;

  {
    runModel = 0;

    /* Wait for background task to complete */
    CHECK_STATUS(pthread_join(backgroundThread, &threadJoinStatus), 0,
                 "pthread_join");
  }

  /* Terminate model */
  taskTimeStart_(4U);
  soc_dvbs2_top_sw_terminate();
  taskTimeEnd_(4U);
  rtExtModeShutdown(1);
  TgtConnTerm();
  sem_post(&stopSem);
  return NULL;
}

void *backgroundTask(void *arg)
{
  while (runModel) {
    /* External mode */
    {
      boolean_T rtmStopReq = false;
      rtExtModeOneStep(soc_dvbs2_top_sw_M->extModeInfo, 1, &rtmStopReq);
      if (rtmStopReq) {
        rtmSetStopRequested(soc_dvbs2_top_sw_M, true);
      }
    }
  }

  return NULL;
}

int main(int argc, char **argv)
{
  coreAffinityBaseRate = 0;
  rtmSetErrorStatus(soc_dvbs2_top_sw_M, 0);
  rtExtModeParseArgs(argc, (const char_T **)argv, NULL);

  /* Target connectivity initialization */
  csErrorStatus = TgtConnInit(argc, argv);
  EXIT_ON_ERROR("Error initializing target connectivity: %s\n", csErrorStatus);

  /* Initialize model */
  taskTimeStart_(1U);
  soc_dvbs2_top_sw_initialize();
  taskTimeEnd_(1U);

  /* External mode */
  rtSetTFinalForExtMode(&rtmGetTFinal(soc_dvbs2_top_sw_M));
  rtExtModeCheckInit(1);

  {
    boolean_T rtmStopReq = false;
    rtExtModeWaitForStartPkt(soc_dvbs2_top_sw_M->extModeInfo, 1, &rtmStopReq);
    if (rtmStopReq) {
      rtmSetStopRequested(soc_dvbs2_top_sw_M, true);
    }
  }

  rtERTExtModeStartMsg();

  /* Call RTOS Initialization function */
  myRTOSInit(0.001, 0);

  /* Wait for stop semaphore */
  sem_wait(&stopSem);

#if (MW_NUMBER_TIMER_DRIVEN_TASKS > 0)

  {
    int_T i;
    for (i=0; i < MW_NUMBER_TIMER_DRIVEN_TASKS; i++) {
      CHECK_STATUS(sem_destroy(&timerTaskSem[i]), 0, "sem_destroy");
    }
  }

#endif

  pthread_mutex_destroy(&profilingDataStoreMutex);
  CHECK_STATUS(sem_destroy(&SOCB_RateSchedulerSem), 0, "sem_destroy");
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
