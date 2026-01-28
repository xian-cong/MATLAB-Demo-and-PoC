#ifndef SendData_boolean_T_h_
#define SendData_boolean_T_h_
#include "rtwtypes.h"
#ifndef typedef_SendData_boolean_T
#define typedef_SendData_boolean_T

typedef struct {
  void *host;
  void (*SendData)(void *, const boolean_T *, int32_T, int32_T *);
} SendData_boolean_T;

#endif
#endif
