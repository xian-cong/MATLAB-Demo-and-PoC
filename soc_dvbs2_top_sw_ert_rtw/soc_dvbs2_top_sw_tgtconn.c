/*
 * soc_dvbs2_top_sw_tgtconn.c
 *
 * Code generation for model "soc_dvbs2_top_sw".
 *
 * Model version              : 1.2
 * Simulink Coder version : 25.2 (R2025b) 28-Jul-2025
 * C source code generated on : Fri Dec  5 09:39:50 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-A (64-bit)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "rtwtypes.h"
#define EXTERN_C
#include <stdio.h>
#include "soc/StreamingProfilerTgtAppSvc/StreamingProfilerTgtAppSvcCIntrf.h"

extern void initializeCommService(uint16_t);
extern void terminateCommService();
EXTERN_C void TgtConnBackgroundTask()
{
}

EXTERN_C const char_T *TgtConnInit(int_T argc, char_T *argv[])
{
  const char_T *result = (NULL);       /* assume success */
  initializeCommService(17726);
  return(result);
}

EXTERN_C void TgtConnTerm()
{
  terminateCommService();
}

EXTERN_C void TgtConnPreStep(int_T tid)
{
}

EXTERN_C void TgtConnPostStep(int_T tid)
{
}

/* EOF: soc_dvbs2_top_sw_tgtconn.c */
