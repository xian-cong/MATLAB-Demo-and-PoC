/* Copyright 2023 The MathWorks, Inc. */
#ifndef EXAMPLE_H
#define EXAMPLE_H
#if !( defined(MATLAB_MEX_FILE) || defined(RSIM_PARAMETER_LOADING) ||  defined(RSIM_WITH_SL_SOLVER))
#include "rtwtypes.h"
#ifdef __cplusplus
extern "C" {
    #endif
    void stepFunctionAES(uint32_T * destArray,int size_vector_1,uint32_T * tagArray,int size_vector_2,uint32_T * iniVector,int size_vector_3,uint8_T * status,int size_vector_4,uint32_T * srcArray,int size_vector_a,uint32_T * key1,int size_vector_b,uint32_T * key2,int size_vector_c,uint32_T * iniVector,int size_vector_d,uint32_T * authDataArray,int size_vector_e,uint32_T authDataLength,int size_vector_f);
    void setupFunctionAES(uint32_T  base,int size_vector__1,uint8_T  keySize,int size_vector__2,uint8_T  direction,int size_vector__3,uint8_T  opMode,int size_vector__4,uint32_T  dataLength,int size_vector__5);
    #ifdef __cplusplus
}
#endif
#else
#define loop(void) (0)
#define setup(void) (0)
#endif
#endif