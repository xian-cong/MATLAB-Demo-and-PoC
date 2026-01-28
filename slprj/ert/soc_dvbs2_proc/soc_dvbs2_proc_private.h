/*
 * File: soc_dvbs2_proc_private.h
 *
 * Code generated for Simulink model 'soc_dvbs2_proc'.
 *
 * Model version                  : 11.0
 * Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
 * C/C++ source code generated on : Fri Dec  5 09:39:30 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-A (64-bit)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef soc_dvbs2_proc_private_h_
#define soc_dvbs2_proc_private_h_
#include "rtwtypes.h"
#include "model_reference_types.h"
#include "iio.h"
#include "soc_dvbs2_proc_types.h"
#include "soc_dvbs2_proc.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmIsSampleHit
#define rtmIsSampleHit(sti)            (soc_dvbs2_proc_TimingBrdg->taskCounter[soc_dvbs2_proc_GlobalTID[sti]] == 0)
#endif

#ifndef UCHAR_MAX
#include <limits.h>
#endif

#if ( UCHAR_MAX != (0xFFU) ) || ( SCHAR_MAX != (0x7F) )
#error Code was generated for compiler with different sized uchar/char. \
Consider adjusting Test hardware word size settings on the \
Hardware Implementation pane to match your compiler word sizes as \
defined in limits.h of the compiler. Alternatively, you can \
select the Test hardware is the same as production hardware option and \
select the Enable portable word sizes option on the Code Generation > \
Verification pane for ERT based targets, which will disable the \
preprocessor word size checks.
#endif

#if ( USHRT_MAX != (0xFFFFU) ) || ( SHRT_MAX != (0x7FFF) )
#error Code was generated for compiler with different sized ushort/short. \
Consider adjusting Test hardware word size settings on the \
Hardware Implementation pane to match your compiler word sizes as \
defined in limits.h of the compiler. Alternatively, you can \
select the Test hardware is the same as production hardware option and \
select the Enable portable word sizes option on the Code Generation > \
Verification pane for ERT based targets, which will disable the \
preprocessor word size checks.
#endif

#if ( UINT_MAX != (0xFFFFFFFFU) ) || ( INT_MAX != (0x7FFFFFFF) )
#error Code was generated for compiler with different sized uint/int. \
Consider adjusting Test hardware word size settings on the \
Hardware Implementation pane to match your compiler word sizes as \
defined in limits.h of the compiler. Alternatively, you can \
select the Test hardware is the same as production hardware option and \
select the Enable portable word sizes option on the Code Generation > \
Verification pane for ERT based targets, which will disable the \
preprocessor word size checks.
#endif

/* Skipping ulong/long check: insufficient preprocessor integer range. */

/* Skipping ulong_long/long_long check: insufficient preprocessor integer range. */

/* Block signals for model 'soc_dvbs2_proc' */
typedef struct {
  uint8_T TxDataLocChar[8192];
  uint32_T RateTransition[2048];       /* '<Root>/Rate Transition' */
  uint32_T AXI4StreamRead_o1_m[2048];
  uint8_T b[129];
  uint8_T b_c[66];
  uint8_T b_k[59];
  uint8_T b_cx[53];
  uint8_T b_b[52];
  uint8_T b_p[45];
  uint8_T b_cv[43];
  uint8_T TxDataLocChar_f[40];
  uint8_T b_g[39];
  uint8_T b_g1[35];
  uint8_T b_m[35];
  uint8_T b_n[32];
  uint8_T strout[20];
  uint8_T strout_p[20];
  int32_T c[5];
  uint8_T b_l[18];
  char_T b_j[17];
  uint8_T b_d[17];
  uint8_T b_gu[14];
  uint8_T b_ld[11];
  uint8_T c_d[10];
  uint8_T c_dy[8];
  struct iio_device* devPtr;
  struct iio_channel* chanPtr;
  ptrdiff_t ptrDiff;
  ssize_t ssizeT;
  struct iio_channel* chanPtr_l;
  uint8_T b_o[7];
  boolean_T AXI4StreamRead_o2;         /* '<S70>/AXI4-Stream Read' */
} B_soc_dvbs2_proc_c_T;

/* Block states (default storage) for model 'soc_dvbs2_proc' */
typedef struct {
  soc_linux_UDPWrite_soc_dvbs2__T obj; /* '<S43>/UDP Write' */
  soc_linux_UDPWrite_soc_dvbs2__T obj_j;/* '<S40>/UDP Write' */
  soc_libiio_axistream_read_soc_T obj_e;/* '<S70>/AXI4-Stream Read' */
  soc_linux_AXIRegisterRead_soc_T obj_g;/* '<S37>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_p;/* '<S35>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_l;/* '<S33>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_k;/* '<S31>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_o;/* '<S29>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_kn;/* '<S27>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_i;/* '<S25>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_n;/* '<S23>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_po;/* '<S21>/AXI4-Register Read' */
  soc_linux_AXIRegisterRead_soc_T obj_jb;/* '<S19>/AXI4-Register Read' */
  soc_linux_AXIRegisterWrite_so_T obj_h;/* '<S67>/AXI4-Register Write' */
  soc_linux_AXIRegisterWrite_so_T obj_o2;/* '<S65>/AXI4-Register Write' */
  soc_linux_AXIRegisterWrite_so_T obj_a;/* '<S63>/AXI4-Register Write' */
  soc_linux_AXIRegisterWrite_so_T obj_m;/* '<S61>/AXI4-Register Write' */
  soc_linux_AXIRegisterWrite_so_T obj_ao;/* '<S59>/AXI4-Register Write' */
  soc_linux_AXIRegisterWrite_so_T obj_hy;/* '<S57>/AXI4-Register Write' */
  soc_linux_AXIRegisterWrite_so_T obj_pw;/* '<S55>/AXI4-Register Write' */
  soc_linux_AXIRegisterWrite_so_T obj_kh;/* '<S53>/AXI4-Register Write' */
  volatile uint32_T RateTransition_Buffer[4096];/* '<Root>/Rate Transition' */
  volatile int8_T RateTransition_ActiveBufIdx;/* '<Root>/Rate Transition' */
  volatile int8_T RateTransition_semaphoreTaken;/* '<Root>/Rate Transition' */
  boolean_T objisempty;                /* '<S70>/AXI4-Stream Read' */
  boolean_T objisempty_m;              /* '<S67>/AXI4-Register Write' */
  boolean_T objisempty_h;              /* '<S65>/AXI4-Register Write' */
  boolean_T objisempty_p;              /* '<S63>/AXI4-Register Write' */
  boolean_T objisempty_e;              /* '<S61>/AXI4-Register Write' */
  boolean_T objisempty_k;              /* '<S59>/AXI4-Register Write' */
  boolean_T objisempty_g;              /* '<S57>/AXI4-Register Write' */
  boolean_T objisempty_mc;             /* '<S55>/AXI4-Register Write' */
  boolean_T objisempty_k3;             /* '<S53>/AXI4-Register Write' */
  boolean_T objisempty_d;              /* '<S43>/UDP Write' */
  boolean_T objisempty_f;              /* '<S40>/UDP Write' */
  boolean_T objisempty_kq;             /* '<S37>/AXI4-Register Read' */
  boolean_T objisempty_o;              /* '<S35>/AXI4-Register Read' */
  boolean_T objisempty_da;             /* '<S33>/AXI4-Register Read' */
  boolean_T objisempty_hj;             /* '<S31>/AXI4-Register Read' */
  boolean_T objisempty_i;              /* '<S29>/AXI4-Register Read' */
  boolean_T objisempty_eh;             /* '<S27>/AXI4-Register Read' */
  boolean_T objisempty_e1;             /* '<S25>/AXI4-Register Read' */
  boolean_T objisempty_l;              /* '<S23>/AXI4-Register Read' */
  boolean_T objisempty_dm;             /* '<S21>/AXI4-Register Read' */
  boolean_T objisempty_n;              /* '<S19>/AXI4-Register Read' */
} DW_soc_dvbs2_proc_f_T;

/* Invariant block signals for model 'soc_dvbs2_proc' */
typedef struct {
  const real_T TmpSignalConversionAtadc_da;
                                     /* '<Root>/Processor Algorithm Periodic' */
  const real_T TmpSignalConversionAtdispla;
                                     /* '<Root>/Processor Algorithm Periodic' */
  const real_T TmpSignalConversionAtenbNoi;
                                     /* '<Root>/Processor Algorithm Periodic' */
  const real_T TmpSignalConversionAtinsert;
                                     /* '<Root>/Processor Algorithm Periodic' */
  const real_T TmpSignalConversionAtinse_p;
                                     /* '<Root>/Processor Algorithm Periodic' */
  const real_T TmpSignalConversionAtmodcod;
                                     /* '<Root>/Processor Algorithm Periodic' */
  const real_T TmpSignalConversionAtresetF;
                                     /* '<Root>/Processor Algorithm Periodic' */
  const real_T TmpSignalConversionAtsnr_dB;
                                     /* '<Root>/Processor Algorithm Periodic' */
} ConstB_soc_dvbs2_proc_h_T;

/* Real-time Model Data Structure */
struct tag_RTM_soc_dvbs2_proc_T {
  const char_T **errorStatus;
};

/* Macros for accessing real-time model data structure */
#ifndef rtmGetClockTick0
#define rtmGetClockTick0()             ( *((soc_dvbs2_proc_TimingBrdg->clockTick[soc_dvbs2_proc_GlobalTID[0]])) )
#endif

#ifndef rtmGetClockTick1
#define rtmGetClockTick1()             ( *((soc_dvbs2_proc_TimingBrdg->clockTick[soc_dvbs2_proc_GlobalTID[1]])) )
#endif

#ifndef rtmGetClockTickH0
#define rtmGetClockTickH0()            ( *(soc_dvbs2_proc_TimingBrdg->clockTickH[soc_dvbs2_proc_GlobalTID[0]]) )
#endif

#ifndef rtmGetClockTickH1
#define rtmGetClockTickH1()            ( *(soc_dvbs2_proc_TimingBrdg->clockTickH[soc_dvbs2_proc_GlobalTID[1]]) )
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         (*((rtm)->errorStatus))
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    (*((rtm)->errorStatus) = (val))
#endif

#ifndef rtmGetErrorStatusPointer
#define rtmGetErrorStatusPointer(rtm)  (rtm)->errorStatus
#endif

#ifndef rtmSetErrorStatusPointer
#define rtmSetErrorStatusPointer(rtm, val) ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetT
#define rtmGetT()                      (*(soc_dvbs2_proc_TimingBrdg->taskTime[0]))
#endif

typedef struct {
  RT_MODEL_soc_dvbs2_proc_T rtm;
} MdlrefDW_soc_dvbs2_proc_T;

extern int_T soc_dvbs2_proc_GlobalTID[2];
extern const rtTimingBridge *soc_dvbs2_proc_TimingBrdg;

/* Invariant block signals (default storage) */
extern const ConstB_soc_dvbs2_proc_h_T soc_dvbs2_proc_ConstB;
extern MdlrefDW_soc_dvbs2_proc_T soc_dvbs2_proc_MdlrefDW;

/* Block signals (default storage) */
extern B_soc_dvbs2_proc_c_T soc_dvbs2_proc_B;

/* Block states (default storage) */
extern DW_soc_dvbs2_proc_f_T soc_dvbs2_proc_DW;

#endif                                 /* soc_dvbs2_proc_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
