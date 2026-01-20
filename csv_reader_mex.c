#define S_FUNCTION_NAME  csv_reader_mex
#define S_FUNCTION_LEVEL 2

#include "simstruc.h"
#include <stdio.h>

#define TICK_CTR_IDX 0  /* Discrete state for the counter */
#define DATA_VAL_IDX 1  /* Discrete state for the 3 data values */

/* Callback: mdlInitializeSizes - Setup ports and memory */
static void mdlInitializeSizes(SimStruct *S) {
    ssSetNumSFcnParams(S, 1); /* Parameter 1: Filename */
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) return;

    ssSetNumInputPorts(S, 0); /* No inputs */
    
    /* Output Port: 1 vector of size 3 */
    if (!ssSetNumOutputPorts(S, 1)) return;
    ssSetOutputPortWidth(S, 0, 3);
    ssSetOutputPortDataType(S, 0, SS_DOUBLE);

    /* Setup DWork (Memory): 1 int for counter, 3 doubles for data */
    ssSetNumDWork(S, 2);
    
    ssSetDWorkWidth(S, TICK_CTR_IDX, 1);
    ssSetDWorkDataType(S, TICK_CTR_IDX, SS_INT32);
    
    ssSetDWorkWidth(S, DATA_VAL_IDX, 3);
    ssSetDWorkDataType(S, DATA_VAL_IDX, SS_DOUBLE);

    ssSetNumSampleTimes(S, 1);
    ssSetOptions(S, SS_OPTION_EXCEPTION_FREE_CODE);
}

/* Callback: mdlInitializeSampleTimes - Set to 1 second */
static void mdlInitializeSampleTimes(SimStruct *S) {
    ssSetSampleTime(S, 0, 1.0); /* 1 second discrete step */
    ssSetOffsetTime(S, 0, 0.0);
}

/* Callback: mdlStart - Initialize states at simulation start */
#define MDL_START
static void mdlStart(SimStruct *S) {
    int32_T *tickCtr = (int32_T*) ssGetDWork(S, TICK_CTR_IDX);
    real_T  *lastData = (real_T*)  ssGetDWork(S, DATA_VAL_IDX);
    
    tickCtr[0] = 0;
    lastData[0] = 0.0; lastData[1] = 0.0; lastData[2] = 0.0;
}

/* Callback: mdlOutputs - The logic loop */
static void mdlOutputs(SimStruct *S, int_T tid) {
    int32_T *tickCtr = (int32_T*) ssGetDWork(S, TICK_CTR_IDX);
    real_T  *lastData = (real_T*)  ssGetDWork(S, DATA_VAL_IDX);
    real_T  *y = ssGetOutputPortRealSignal(S, 0);
    
    /* Get filename from block parameter */
    char filename[256];
    mxGetString(ssGetSFcnParam(S, 0), filename, 256);

    /* Increment Counter */
    tickCtr[0]++;

    /* Logic: Every 10 seconds */
    if (tickCtr[0] >= 10) {
        tickCtr[0] = 0;
        FILE *fp = fopen(filename, "r");
        if (fp != NULL) {
            double a, b, c;
            if (fscanf(fp, "%lf,%lf,%lf", &a, &b, &c) == 3) {
                lastData[0] = a;
                lastData[1] = b;
                lastData[2] = c;
            }
            fclose(fp);
        }
    }

    /* Set Outputs */
    y[0] = lastData[0];
    y[1] = lastData[1];
    y[2] = lastData[2];
}

/* Callback: mdlTerminate - Cleanup */
static void mdlTerminate(SimStruct *S) {}

/* Required S-function trailer */
#ifdef  MATLAB_MEX_FILE
#include "simulink.c"
#else
#include "cg_sfun.h"
#endif