#ifndef RecvData_real_T_h_
#define RecvData_real_T_h_
#include "rtwtypes.h"
#ifndef typedef_RecvData_real_T
#define typedef_RecvData_real_T

typedef struct {
  void *host;
  void (*RecvData)(void *, real_T *, int32_T, int32_T *);
} RecvData_real_T;

#endif
#endif
