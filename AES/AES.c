#include "AES.h"

// base uint32 [1,1] Non tunable
// keySize uint8 [1,1] Non tunable
// direction uint8 [1,1] Non tunable
// opMode uint8 [1,1] Non tunable
// dataLength uint32 [1,1] Non tunable

void setupFunctionAES(uint32_T  base,int size_vector__1,uint8_T  keySize,int size_vector__2,uint8_T  direction,int size_vector__3,uint8_T  opMode,int size_vector__4,uint32_T  dataLength,int size_vector__5){
    AES_ConfigParams config;
    config.direction      = (AES_Direction)direction;
    config.keySize        = (AES_KeySize)keySize;
    config.opMode         = (AES_OpMode)opMode;
    config.ctrWidth       = AES_CTR_WIDTH_32;    // default
    config.ccmLenWidth    = AES_CCM_LEN_WIDTH_2; // default
    config.ccmAuthLenWidth = AES_CCM_AUTH_LEN_WIDTH_4; // default
    
    AES_configureModule(base, &config);
}

// destArray uint32 [4,1]
// tagArray uint32 [4,1]
// iniVector uint32 [4,1]
// status uint8 [1,1]
// srcArray uint32 [4,1]
// key1 uint32 [8,1]
// key2 uint32 [8,1]
// iniVector uint32 [4,1]
// authDataArray uint32 [4,1]
// authDataLength uint32 [1,1]


void stepFunctionAES(uint32_T * destArray,int size_vector_1,uint32_T * tagArray,int size_vector_2,uint32_T * iniVector,int size_vector_3,uint8_T * status,int size_vector_4,uint32_T * srcArray,int size_vector_a,uint32_T * key1,int size_vector_b,uint32_T * key2,int size_vector_c,uint32_T * iniVector,int size_vector_d,uint32_T * authDataArray,int size_vector_e,uint32_T authDataLength,int size_vector_f){
    // These should match setupFunctionAES parameters
    // Passed via block parameters (base, keySize, dataLength)
    extern uint32_T AES_base;
    extern uint8_T  AES_keySize;
    extern uint32_T AES_dataLength;

    // Set Key 1
    AES_setKey1(AES_base, key1, (AES_KeySize)AES_keySize);

    // Set Key 2 (used in XTS/CCM modes)
    AES_setKey2(AES_base, key2, (AES_KeySize)AES_keySize);

    // Set Initialization Vector
    AES_setInitializationVector(AES_base, iniVector_in);

    // Process data (encrypt or decrypt)
    if(authDataLength > 0U)
    {
        // CCM/GCM mode — process with authentication
        *status = (uint8_T)AES_processDatainAuthMode(
                      AES_base,
                      srcArray,
                      destArray,
                      (uint64_t)AES_dataLength,
                      authDataArray,
                      (uint32_t)authDataLength,
                      tagArray);
    }
    else
    {
        // Standard mode — encrypt/decrypt only
        *status = (uint8_T)AES_processData(
                      AES_base,
                      srcArray,
                      destArray,
                      (uint64_t)AES_dataLength);

        // Read tag if needed (CBC-MAC / CCM)
        AES_readTag(AES_base, tagArray);
    }

    // Read back updated IV for chaining
    AES_readInitializationVector(AES_base, iniVector_out);
}