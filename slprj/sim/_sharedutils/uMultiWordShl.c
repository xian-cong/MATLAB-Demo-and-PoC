#include "uMultiWordShl.h"
#include "rtwtypes.h"

void uMultiWordShl(const uint64_T u1[], int32_T n1, uint32_T n2, uint64_T y[],
                   int32_T n)
{
  uint64_T u1i;
  uint64_T yi;
  uint64_T ys;
  int32_T i;
  int32_T nb;
  int32_T nc;
  uint32_T nl;
  nb = (int32_T)(n2 >> 6);
  ys = (u1[n1 - 1] & 9223372036854775808ULL) != 0ULL ? MAX_uint64_T : 0ULL;
  nc = nb > n ? n : nb;
  u1i = 0ULL;
  for (i = 0; i < nc; i++) {
    y[i] = 0ULL;
  }

  if (nb < n) {
    nl = n2 - ((uint32_T)nb << 6);
    nb += n1;
    if (nb > n) {
      nb = n;
    }

    nb -= i;
    if (nl > 0U) {
      for (nc = 0; nc < nb; nc++) {
        yi = u1i >> (64U - nl);
        u1i = u1[nc];
        y[i] = u1i << nl | yi;
        i++;
      }

      if (i < n) {
        y[i] = u1i >> (64U - nl) | ys << nl;
        i++;
      }
    } else {
      for (nc = 0; nc < nb; nc++) {
        y[i] = u1[nc];
        i++;
      }
    }
  }

  while (i < n) {
    y[i] = ys;
    i++;
  }
}
