#ifndef _CSV_READER_ACCEL_WRAPPER_H_
#define _CSV_READER_ACCEL_WRAPPER_H_
#ifdef MATLAB_MEX_FILE
#include "tmwtypes.h"
#else
#include "rtwtypes.h"
#endif
#ifdef __cplusplus
#define SFB_EXTERN_C extern "C"
#else
#define SFB_EXTERN_C extern
#endif
SFB_EXTERN_C void csv_reader_Start_wrapper_accel ( void ) ; SFB_EXTERN_C void
csv_reader_Outputs_wrapper_accel ( real_T * y0 ) ;
#undef SFB_EXTERN_C
#endif
