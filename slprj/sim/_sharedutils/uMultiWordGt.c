#include "uMultiWordGt.h"
#include "uMultiWordCmp.h"
#include "rtwtypes.h"

boolean_T uMultiWordGt(const uint64_T u1[], const uint64_T u2[], int32_T n)
{
  return uMultiWordCmp(u1, u2, n) > 0;
}
