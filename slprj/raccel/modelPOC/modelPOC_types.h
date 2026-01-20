#ifndef modelPOC_types_h_
#define modelPOC_types_h_
#include "rtwtypes.h"
#ifndef struct_emxArray_char_T
#define struct_emxArray_char_T
struct emxArray_char_T { char_T * data ; int32_T * size ; int32_T
allocatedSize ; int32_T numDimensions ; boolean_T canFreeData ; } ;
#endif
#ifndef typedef_cyuzw4yqsj
#define typedef_cyuzw4yqsj
typedef struct emxArray_char_T cyuzw4yqsj ;
#endif
#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T
struct emxArray_real_T { real_T * data ; int32_T * size ; int32_T
allocatedSize ; int32_T numDimensions ; boolean_T canFreeData ; } ;
#endif
#ifndef typedef_bzjb2gtz50
#define typedef_bzjb2gtz50
typedef struct emxArray_real_T bzjb2gtz50 ;
#endif
#ifndef SS_UINT64
#define SS_UINT64 17
#endif
#ifndef SS_INT64
#define SS_INT64 18
#endif
typedef struct P_ P ;
#endif
