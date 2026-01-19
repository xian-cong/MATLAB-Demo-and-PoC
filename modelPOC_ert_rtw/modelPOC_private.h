/*
 * File: modelPOC_private.h
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

#ifndef modelPOC_private_h_
#define modelPOC_private_h_
#include "rtwtypes.h"
#include "modelPOC_types.h"
#ifdef __cplusplus
#define SFB_EXTERN_C                   extern "C"
#else
#define SFB_EXTERN_C                   extern
#endif

SFB_EXTERN_C void csv_reader_Start_wrapper(void);
SFB_EXTERN_C void csv_reader_Outputs_wrapper(real_T *y0);
SFB_EXTERN_C void csv_reader_Terminate_wrapper(void);

#undef SFB_EXTERN_C
#endif                                 /* modelPOC_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
