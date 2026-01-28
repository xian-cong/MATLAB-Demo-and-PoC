#include "mul_s64_loSR.h"
#include "mul_wide_s64.h"
#include "rtwtypes.h"

int64_T mul_s64_loSR(int64_T a, int64_T b, uint64_T aShift)
{
  uint64_T u64_chi;
  uint64_T u64_clo;
  mul_wide_s64(a, b, &u64_chi, &u64_clo);
  u64_clo = u64_chi << (64ULL - aShift) | u64_clo >> aShift;
  return (int64_T)u64_clo;
}
