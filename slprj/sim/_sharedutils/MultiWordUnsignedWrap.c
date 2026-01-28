#include "MultiWordUnsignedWrap.h"
#include "rtwtypes.h"

void MultiWordUnsignedWrap(const uint64_T u1[], int32_T n1, uint32_T n2,
  uint64_T y[])
{
  int32_T i;
  int32_T n1m1;
  n1m1 = n1 - 1;
  for (i = 0; i < n1m1; i++) {
    y[i] = u1[i];
  }

  y[n1 - 1] = ((1ULL << (64U - n2)) - 1ULL) & u1[n1 - 1];
}
