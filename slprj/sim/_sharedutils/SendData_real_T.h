#ifndef SendData_real_T_h_
#define SendData_real_T_h_
#include "rtwtypes.h"
#ifndef typedef_SendData_real_T
#define typedef_SendData_real_T

typedef struct {
  void *host;
  void (*SendData)(void *, const real_T *, int32_T, int32_T *);
} SendData_real_T;

#endif
#endif
