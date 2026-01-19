
/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#define SIMPLIFIED_RTWTYPES_COMPATIBILITY
#include "rtwtypes.h"
#undef SIMPLIFIED_RTWTYPES_COMPATIBILITY
#endif



/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define y_width 3

/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
static int tickCounter = 0;
/* Initialize with 0.0 to prevent random values at startup */
static double lastData[3] = {0.0, 0.0, 0.0};

#define POLL_TICKS 10
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Start function
 *
 */
extern void csv_reader_Start_wrapper(void);

void csv_reader_Start_wrapper(void)
{
/* %%%-SFUNWIZ_wrapper_Start_Changes_BEGIN --- EDIT HERE TO _END */
    tickCounter = 0;
    lastData[0] = 0.0;
    lastData[1] = 0.0;
    lastData[2] = 0.0;
/* %%%-SFUNWIZ_wrapper_Start_Changes_END --- EDIT HERE TO _BEGIN */
}
/*
 * Output function
 *
 */
extern void csv_reader_Outputs_wrapper(real_T *y0);

void csv_reader_Outputs_wrapper(real_T *y0)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* Increment counter every step */
    tickCounter++;

    /* Poll CSV when counter hits threshold */
    if (tickCounter >= POLL_TICKS) {
        
        /* Reset counter immediately */
        tickCounter = 0; 
        
        FILE *fp = fopen("input_data.csv", "r");
        
        /* Only proceed if file opened successfully */
        if (fp != NULL) {
            double a, b, c;
            /* Try to read 3 values. fscanf returns number of successful matches */
            if (fscanf(fp, "%lf,%lf,%lf", &a, &b, &c) == 3) {
                lastData[0] = a;
                lastData[1] = b;
                lastData[2] = c;
            }
            /* If read fails (e.g. file empty/locked), we keep old lastData values */
            
            fclose(fp);
        }
    }

    /* Output the current buffer (either fresh or old) */
    y0[0] = lastData[0];
    y0[1] = lastData[1];
    y0[2] = lastData[2];
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}


