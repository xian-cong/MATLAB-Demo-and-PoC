#include "uLong2MultiWord.h"
#include "rtwtypes.h"

void uLong2MultiWord(uint64_T u, uint64_T y[], int32_T n)
{
  int32_T i;
  y[0] = u;
  for (i = 1; i < n; i++) {
    y[i] = 0ULL;
  }
}
