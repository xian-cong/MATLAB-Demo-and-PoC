#ifndef mul_wide_s64_h_
#define mul_wide_s64_h_
#include "rtwtypes.h"
#include "multiword_types.h"

extern void mul_wide_s64(int64_T in0, int64_T in1, uint64_T *ptrOutBitsHi,
  uint64_T *ptrOutBitsLo);

#endif
