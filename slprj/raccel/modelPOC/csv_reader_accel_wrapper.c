#include <string.h>
#ifdef MATLAB_MEX_FILE
#include "tmwtypes.h"
#else
#include "rtwtypes.h"
#endif
#include "csv_reader_accel_wrapper.h"
#ifdef __cplusplus
#define SFB_EXTERN_C extern "C"
#else
#define SFB_EXTERN_C extern
#endif
SFB_EXTERN_C void csv_reader_Start_wrapper ( void ) ; SFB_EXTERN_C void
csv_reader_Outputs_wrapper ( real_T * y0 ) ; SFB_EXTERN_C void
csv_reader_Terminate_wrapper ( void ) ; void csv_reader_Start_wrapper_accel ( void ) { csv_reader_Start_wrapper ( ) ; } void csv_reader_Outputs_wrapper_accel ( real_T * y0 ) { csv_reader_Outputs_wrapper ( y0 ) ; }
#undef SFB_EXTERN_C
