#include "mul_wide_s64.h"
#include "rtwtypes.h"

void mul_wide_s64(int64_T in0, int64_T in1, uint64_T *ptrOutBitsHi, uint64_T
                  *ptrOutBitsLo)
{
  uint64_T absIn0;
  uint64_T absIn1;
  uint64_T in0Hi;
  uint64_T in0Lo;
  uint64_T in1Hi;
  uint64_T productHiLo;
  uint64_T productLoHi;
  absIn0 = in0 < 0LL ? ~(uint64_T)in0 + 1ULL : (uint64_T)in0;
  absIn1 = in1 < 0LL ? ~(uint64_T)in1 + 1ULL : (uint64_T)in1;
  in0Hi = absIn0 >> 32ULL;
  in0Lo = absIn0 & 4294967295ULL;
  in1Hi = absIn1 >> 32ULL;
  absIn0 = absIn1 & 4294967295ULL;
  productHiLo = in0Hi * absIn0;
  productLoHi = in0Lo * in1Hi;
  absIn0 *= in0Lo;
  absIn1 = 0ULL;
  in0Lo = (productLoHi << 32ULL) + absIn0;
  if (in0Lo < absIn0) {
    absIn1 = 1ULL;
  }

  absIn0 = in0Lo;
  in0Lo += productHiLo << 32ULL;
  if (in0Lo < absIn0) {
    absIn1++;
  }

  absIn0 = (((productLoHi >> 32ULL) + (productHiLo >> 32ULL)) + in0Hi * in1Hi) +
    absIn1;
  if ((in0 != 0LL) && ((in1 != 0LL) && ((in0 > 0LL) != (in1 > 0LL)))) {
    absIn0 = ~absIn0;
    in0Lo = ~in0Lo;
    in0Lo++;
    if (in0Lo == 0ULL) {
      absIn0++;
    }
  }

  *ptrOutBitsHi = absIn0;
  *ptrOutBitsLo = in0Lo;
}
