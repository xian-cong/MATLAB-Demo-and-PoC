#include "plook_u32u8_evencka.h"
#include "rtwtypes.h"

uint32_T plook_u32u8_evencka(uint8_T u, uint8_T bp0, uint8_T bpSpace, uint32_T
  maxIndex)
{
  uint32_T bpIndex;
  uint8_T fbpIndex;
  if (u <= bp0) {
    bpIndex = 0U;
  } else {
    fbpIndex = (uint8_T)((uint32_T)(uint8_T)((uint32_T)u - bp0) / bpSpace);
    if (fbpIndex < maxIndex) {
      bpIndex = fbpIndex;
    } else {
      bpIndex = maxIndex;
    }
  }

  return bpIndex;
}
