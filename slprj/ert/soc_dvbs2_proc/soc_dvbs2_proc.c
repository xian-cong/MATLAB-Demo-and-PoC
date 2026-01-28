/*
 * File: soc_dvbs2_proc.c
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

#include "soc_dvbs2_proc.h"
#include "rtwtypes.h"
#include "soc_dvbs2_proc_types.h"
#include "iio.h"
#include "soc_dvbs2_proc_private.h"
#include <string.h>
#include <stddef.h>

int_T soc_dvbs2_proc_GlobalTID[2];
const rtTimingBridge *soc_dvbs2_proc_TimingBrdg;
MdlrefDW_soc_dvbs2_proc_T soc_dvbs2_proc_MdlrefDW;

/* Block signals (default storage) */
B_soc_dvbs2_proc_c_T soc_dvbs2_proc_B;

/* Block states (default storage) */
DW_soc_dvbs2_proc_f_T soc_dvbs2_proc_DW;

/* Forward declaration for local functions */
static struct iio_channel* soc_dvbs2_proc_base_getChan(struct iio_device* iioDev,
  boolean_T output);
static void soc_dvbs2_proc_base_doTeardown(soc_libiio_axistream_read_soc_T *obj);
static void soc_dvbs2_proc_SystemCore_setup(soc_libiio_axistream_read_soc_T *obj);
static void soc_dvbs2__UDPWrite_setupImpl_j(soc_linux_UDPWrite_soc_dvbs2__T *obj);
static void soc_dvbs2_pr_UDPWrite_setupImpl(soc_linux_UDPWrite_soc_dvbs2__T *obj);
static void soc_dvbs2_pr_SystemCore_release(soc_linux_UDPWrite_soc_dvbs2__T *obj);
static struct iio_channel* soc_dvbs2_proc_base_getChan(struct iio_device* iioDev,
  boolean_T output)
{
  struct iio_channel* chanPtr;
  int32_T i;
  int32_T status;
  uint8_T b[6];
  uint8_T b_0[3];
  static const uint8_T b_1[6] = { 100U, 97U, 116U, 97U, 48U, 0U };

  static const int8_T c[5] = { 100, 97, 116, 97, 48 };

  static const uint8_T b_2[35] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 67U, 104U, 97U, 110U, 110U, 101U, 108U, 58U, 32U, 37U, 115U, 32U,
    110U, 111U, 116U, 32U, 102U, 111U, 117U, 110U, 100U, 46U, 10U, 0U };

  for (i = 0; i < 6; i++) {
    b[i] = b_1[i];
  }

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  chanPtr = iio_device_find_channel(iioDev, &b[0], (uint8_T)output);
  status = check_pointer(chanPtr);
  b_0[0] = 37U;
  b_0[1] = 100U;
  b_0[2] = 0U;
  for (i = 0; i < 5; i++) {
    /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
    soc_dvbs2_proc_B.c[i] = c[i];
  }

  sprintf(&soc_dvbs2_proc_B.strout_p[0], &b_0[0], &soc_dvbs2_proc_B.c[0]);

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  if (status != 0) {
    for (i = 0; i < 35; i++) {
      soc_dvbs2_proc_B.b_m[i] = b_2[i];
    }

    printf(&soc_dvbs2_proc_B.b_m[0], status, &soc_dvbs2_proc_B.strout_p[0]);
    exit(status);
  }

  return chanPtr;
}

static void soc_dvbs2_proc_base_doTeardown(soc_libiio_axistream_read_soc_T *obj)
{
  int32_T status;
  if (obj->needsTeardown) {
    /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
    if (obj->bufExists) {
      iio_buffer_cancel(obj->iioBuf);
      iio_buffer_destroy(obj->iioBuf);
    }

    obj->bufExists = false;
    soc_dvbs2_proc_B.chanPtr_l = soc_dvbs2_proc_base_getChan(obj->iioDev, false);
    status = check_pointer(soc_dvbs2_proc_B.chanPtr_l);
    if (status == 0) {
      /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
      iio_channel_disable(soc_dvbs2_proc_B.chanPtr_l);
    }

    /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
    if (obj->bufExists) {
      iio_buffer_cancel(obj->iioBuf);
      iio_buffer_destroy(obj->iioBuf);
    }

    obj->bufExists = false;
    iio_context_destroy(obj->iioCtx);
    obj->needsTeardown = false;
  }
}

static void soc_dvbs2_proc_SystemCore_setup(soc_libiio_axistream_read_soc_T *obj)
{
  int32_T bytes;
  int32_T bytes1;
  int32_T i;
  int32_T status;
  uint32_T count;
  uint32_T total;
  uint8_T c[5];
  uint8_T b[3];
  boolean_T isScan;
  static const uint8_T b_0[7] = { 108U, 111U, 99U, 97U, 108U, 58U, 0U };

  static const uint8_T b_1[129] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 99U, 114U,
    101U, 97U, 116U, 101U, 32U, 99U, 111U, 110U, 116U, 101U, 120U, 116U, 32U,
    102U, 111U, 114U, 32U, 117U, 114U, 105U, 58U, 32U, 37U, 115U, 32U, 10U, 84U,
    104U, 101U, 32U, 97U, 100U, 100U, 114U, 101U, 115U, 115U, 32U, 105U, 115U,
    32U, 110U, 111U, 116U, 32U, 97U, 118U, 97U, 105U, 108U, 97U, 98U, 108U, 101U,
    46U, 32U, 77U, 97U, 107U, 101U, 32U, 115U, 117U, 114U, 101U, 32U, 116U, 104U,
    101U, 32U, 100U, 101U, 118U, 105U, 99U, 101U, 32U, 105U, 115U, 32U, 99U,
    111U, 110U, 110U, 101U, 99U, 116U, 101U, 100U, 32U, 97U, 110U, 100U, 32U,
    116U, 114U, 121U, 32U, 97U, 103U, 97U, 105U, 110U, 46U, 10U, 0U };

  static const uint8_T b_2[43] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 115U, 101U,
    116U, 32U, 99U, 111U, 110U, 116U, 101U, 120U, 116U, 32U, 116U, 105U, 109U,
    101U, 111U, 117U, 116U, 46U, 10U, 0U };

  static const uint8_T b_3[18] = { 109U, 119U, 100U, 118U, 98U, 115U, 50U, 95U,
    105U, 112U, 48U, 58U, 115U, 50U, 109U, 109U, 48U, 0U };

  static const uint8_T b_4[39] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 102U, 105U,
    110U, 100U, 32U, 100U, 101U, 118U, 105U, 99U, 101U, 58U, 32U, 37U, 115U, 46U,
    10U, 0U };

  static const uint8_T b_5[45] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 115U, 101U,
    116U, 32U, 117U, 112U, 32U, 107U, 101U, 114U, 110U, 101U, 108U, 32U, 98U,
    117U, 102U, 102U, 101U, 114U, 115U, 46U, 10U, 0U };

  static const uint8_T b_6[17] = { 114U, 101U, 115U, 101U, 116U, 95U, 116U, 108U,
    97U, 115U, 116U, 95U, 109U, 111U, 100U, 101U, 0U };

  static const uint8_T c_0[10] = { 112U, 114U, 101U, 98U, 117U, 102U, 102U, 101U,
    114U, 0U };

  static const uint8_T b_7[35] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 67U, 104U, 97U, 110U, 110U, 101U, 108U, 58U, 32U, 37U, 115U, 32U,
    110U, 111U, 116U, 32U, 102U, 111U, 117U, 110U, 100U, 46U, 10U, 0U };

  static const uint8_T b_8[53] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 119U, 114U,
    105U, 116U, 101U, 32U, 97U, 116U, 116U, 114U, 105U, 98U, 117U, 116U, 101U,
    58U, 32U, 37U, 115U, 32U, 116U, 111U, 32U, 100U, 101U, 118U, 105U, 99U, 101U,
    46U, 10U, 0U };

  static const uint8_T b_9[11] = { 116U, 108U, 97U, 115U, 116U, 95U, 109U, 111U,
    100U, 101U, 0U };

  static const uint8_T c_1[5] = { 97U, 117U, 116U, 111U, 0U };

  static const uint8_T b_a[66] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 105U, 110U,
    105U, 116U, 105U, 97U, 108U, 105U, 122U, 101U, 32U, 115U, 116U, 114U, 101U,
    97U, 109U, 32U, 100U, 101U, 118U, 105U, 99U, 101U, 58U, 32U, 109U, 119U,
    100U, 118U, 98U, 115U, 50U, 95U, 105U, 112U, 48U, 58U, 115U, 50U, 109U, 109U,
    48U, 10U, 0U };

  static const uint8_T b_b[52] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 99U, 111U,
    110U, 102U, 105U, 103U, 117U, 114U, 101U, 32U, 100U, 101U, 118U, 105U, 99U,
    101U, 32U, 97U, 110U, 100U, 32U, 98U, 117U, 102U, 102U, 101U, 114U, 115U,
    46U, 10U, 0U };

  static const uint8_T b_c[59] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 99U, 114U,
    101U, 97U, 116U, 101U, 32U, 98U, 117U, 102U, 102U, 101U, 114U, 32U, 102U,
    111U, 114U, 58U, 32U, 109U, 119U, 100U, 118U, 98U, 115U, 50U, 95U, 105U,
    112U, 48U, 58U, 115U, 50U, 109U, 109U, 48U, 10U, 0U };

  static const uint8_T b_d[14] = { 114U, 101U, 115U, 101U, 116U, 95U, 105U, 112U,
    95U, 109U, 111U, 100U, 101U, 0U };

  static const uint8_T b_e[32] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 68U, 97U, 116U, 97U, 32U, 115U, 105U, 122U, 101U, 32U, 109U, 105U,
    115U, 109U, 97U, 116U, 99U, 104U, 46U, 10U, 0U };

  static const uint8_T c_2[8] = { 100U, 105U, 115U, 97U, 98U, 108U, 101U, 0U };

  obj->isSetupComplete = false;

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  obj->isInitialized = 1;
  obj->iioBuf = NULL;
  for (i = 0; i < 7; i++) {
    soc_dvbs2_proc_B.b_o[i] = b_0[i];
  }

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  obj->iioCtx = iio_create_context_from_uri(&soc_dvbs2_proc_B.b_o[0]);
  status = check_pointer(obj->iioCtx);
  if (status != 0) {
    memcpy(&soc_dvbs2_proc_B.b[0], &b_1[0], 129U * sizeof(uint8_T));
    for (i = 0; i < 7; i++) {
      soc_dvbs2_proc_B.b_o[i] = b_0[i];
    }

    printf(&soc_dvbs2_proc_B.b[0], status, &soc_dvbs2_proc_B.b_o[0]);
    exit(status);
  }

  status = iio_context_set_timeout(obj->iioCtx, 0U);
  if (status != 0) {
    for (i = 0; i < 43; i++) {
      soc_dvbs2_proc_B.b_cv[i] = b_2[i];
    }

    printf(&soc_dvbs2_proc_B.b_cv[0], status);
    exit(status);
  }

  for (i = 0; i < 18; i++) {
    soc_dvbs2_proc_B.b_l[i] = b_3[i];
  }

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  soc_dvbs2_proc_B.devPtr = iio_context_find_device(obj->iioCtx,
    &soc_dvbs2_proc_B.b_l[0]);
  status = check_pointer(soc_dvbs2_proc_B.devPtr);
  if (status != 0) {
    for (i = 0; i < 39; i++) {
      soc_dvbs2_proc_B.b_g[i] = b_4[i];
    }

    for (i = 0; i < 18; i++) {
      soc_dvbs2_proc_B.b_l[i] = b_3[i];
    }

    printf(&soc_dvbs2_proc_B.b_g[0], status, &soc_dvbs2_proc_B.b_l[0]);
    exit(status);
  }

  obj->iioDev = soc_dvbs2_proc_B.devPtr;
  obj->needsTeardown = true;
  total = iio_device_get_channels_count(obj->iioDev);
  count = 0U;
  bytes1 = (int32_T)total;
  for (bytes = 0; bytes < bytes1; bytes++) {
    /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
    total = (uint32_T)bytes;
    if ((uint32_T)bytes > (uint32_T)bytes + 1U) {
      total = 0U;
    }

    soc_dvbs2_proc_B.chanPtr = iio_device_get_channel(obj->iioDev, total);
    status = check_pointer(soc_dvbs2_proc_B.chanPtr);
    b[0] = 37U;
    b[1] = 100U;
    b[2] = 0U;
    sprintf(&soc_dvbs2_proc_B.strout[0], &b[0], (int32_T)total);

    /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
    if (status != 0) {
      for (i = 0; i < 35; i++) {
        soc_dvbs2_proc_B.b_g1[i] = b_7[i];
      }

      printf(&soc_dvbs2_proc_B.b_g1[0], status, &soc_dvbs2_proc_B.strout[0]);
      exit(status);
    }

    status = check_pointer(soc_dvbs2_proc_B.chanPtr);
    if (status == 0) {
      /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
      isScan = iio_channel_is_scan_element(soc_dvbs2_proc_B.chanPtr);
      if (isScan) {
        total = count + /*MW:OvSatOk*/ 1U;
        if (count + 1U < count) {
          total = MAX_uint32_T;
        }

        count = total;
      }
    }
  }

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  if (count > 0U) {
    obj->buffersAvailable = true;
  }

  if (obj->buffersAvailable) {
    status = iio_device_set_kernel_buffers_count(obj->iioDev, 4U);
    if (status != 0) {
      for (i = 0; i < 45; i++) {
        soc_dvbs2_proc_B.b_p[i] = b_5[i];
      }

      printf(&soc_dvbs2_proc_B.b_p[0], status);
      exit(status);
    }
  }

  soc_dvbs2_proc_B.chanPtr = soc_dvbs2_proc_base_getChan(obj->iioDev, false);
  status = check_pointer(soc_dvbs2_proc_B.chanPtr);
  if (status == 0) {
    /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
    iio_channel_enable(soc_dvbs2_proc_B.chanPtr);
  }

  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_d[i] = b_6[i];
  }

  for (i = 0; i < 10; i++) {
    soc_dvbs2_proc_B.c_d[i] = c_0[i];
  }

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  soc_dvbs2_proc_B.ssizeT = iio_device_attr_write(obj->iioDev,
    &soc_dvbs2_proc_B.b_d[0], &soc_dvbs2_proc_B.c_d[0]);
  bytes = (int32_T)soc_dvbs2_proc_B.ssizeT;

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  if ((int32_T)soc_dvbs2_proc_B.ssizeT < 0) {
    for (i = 0; i < 53; i++) {
      soc_dvbs2_proc_B.b_cx[i] = b_8[i];
    }

    for (i = 0; i < 17; i++) {
      soc_dvbs2_proc_B.b_d[i] = b_6[i];
    }

    printf(&soc_dvbs2_proc_B.b_cx[0], (int32_T)soc_dvbs2_proc_B.ssizeT,
           &soc_dvbs2_proc_B.b_d[0]);
    exit((int32_T)soc_dvbs2_proc_B.ssizeT);
  }

  for (i = 0; i < 11; i++) {
    soc_dvbs2_proc_B.b_ld[i] = b_9[i];
  }

  for (i = 0; i < 5; i++) {
    c[i] = c_1[i];
  }

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  soc_dvbs2_proc_B.ssizeT = iio_device_attr_write(obj->iioDev,
    &soc_dvbs2_proc_B.b_ld[0], &c[0]);
  if ((int32_T)soc_dvbs2_proc_B.ssizeT < 0) {
    for (i = 0; i < 53; i++) {
      soc_dvbs2_proc_B.b_cx[i] = b_8[i];
    }

    for (i = 0; i < 11; i++) {
      soc_dvbs2_proc_B.b_ld[i] = b_9[i];
    }

    printf(&soc_dvbs2_proc_B.b_cx[0], (int32_T)soc_dvbs2_proc_B.ssizeT,
           &soc_dvbs2_proc_B.b_ld[0]);
    exit((int32_T)soc_dvbs2_proc_B.ssizeT);
  }

  if ((bytes <= 0) || ((int32_T)soc_dvbs2_proc_B.ssizeT <= 0)) {
    status = -19;
    soc_dvbs2_proc_B.chanPtr = soc_dvbs2_proc_base_getChan(obj->iioDev, false);
    bytes = check_pointer(soc_dvbs2_proc_B.chanPtr);
    if (bytes == 0) {
      iio_channel_disable(soc_dvbs2_proc_B.chanPtr);
    }

    memcpy(&soc_dvbs2_proc_B.b_c[0], &b_a[0], 66U * sizeof(uint8_T));
    printf(&soc_dvbs2_proc_B.b_c[0], -19);
  } else {
    obj->iioBuf = iio_device_create_buffer(obj->iioDev, 2048U, 0);
    status = check_pointer(obj->iioBuf);
    if (status == 0) {
      obj->bufExists = true;
    }

    if (status != 0) {
      soc_dvbs2_proc_B.chanPtr = soc_dvbs2_proc_base_getChan(obj->iioDev, false);
      bytes = check_pointer(soc_dvbs2_proc_B.chanPtr);
      if (bytes == 0) {
        iio_channel_disable(soc_dvbs2_proc_B.chanPtr);
      }

      for (i = 0; i < 59; i++) {
        soc_dvbs2_proc_B.b_k[i] = b_c[i];
      }

      printf(&soc_dvbs2_proc_B.b_k[0], status);
    }
  }

  if (status != 0) {
    for (i = 0; i < 52; i++) {
      soc_dvbs2_proc_B.b_b[i] = b_b[i];
    }

    /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
    printf(&soc_dvbs2_proc_B.b_b[0], status);
    exit(status);
  }

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  if (obj->buffersAvailable) {
    soc_dvbs2_proc_B.ptrDiff = iio_buffer_step(obj->iioBuf);
    isScan = false;
    if ((uint32_T)soc_dvbs2_proc_B.ptrDiff == 4U) {
      isScan = true;
    }

    if (!isScan) {
      soc_dvbs2_proc_base_doTeardown(obj);
      for (i = 0; i < 32; i++) {
        soc_dvbs2_proc_B.b_n[i] = b_e[i];
      }

      printf(&soc_dvbs2_proc_B.b_n[0], -22);
      exit(-22);
    }
  }

  obj->pollConfig = EmptyPollConfig;
  obj->pNumBufferBytes = 8192.0;
  for (i = 0; i < 14; i++) {
    soc_dvbs2_proc_B.b_gu[i] = b_d[i];
  }

  for (i = 0; i < 8; i++) {
    soc_dvbs2_proc_B.c_dy[i] = c_2[i];
  }

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  soc_dvbs2_proc_B.ssizeT = iio_device_attr_write(obj->iioDev,
    &soc_dvbs2_proc_B.b_gu[0], &soc_dvbs2_proc_B.c_dy[0]);
  if ((int32_T)soc_dvbs2_proc_B.ssizeT < 0) {
    for (i = 0; i < 53; i++) {
      soc_dvbs2_proc_B.b_cx[i] = b_8[i];
    }

    for (i = 0; i < 14; i++) {
      soc_dvbs2_proc_B.b_gu[i] = b_d[i];
    }

    printf(&soc_dvbs2_proc_B.b_cx[0], (int32_T)soc_dvbs2_proc_B.ssizeT,
           &soc_dvbs2_proc_B.b_gu[0]);
    exit((int32_T)soc_dvbs2_proc_B.ssizeT);
  }

  extern void * ptr_streamread_mwdvbs2_ip0_s2mm0;//();

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  ptr_streamread_mwdvbs2_ip0_s2mm0 = mw_iio_setup_poll_and_get_config
    (&obj->pollConfig, obj->iioBuf, -1.0, false);
  obj->isSetupComplete = true;
}

static void soc_dvbs2__UDPWrite_setupImpl_j(soc_linux_UDPWrite_soc_dvbs2__T *obj)
{
  char_T * RemoteAddressPtrLoc;
  int32_T status;
  static const char_T RemoteAddressLoc[16] = "255.255.255.255";

  /* Start for MATLABSystem: '<S43>/UDP Write' */
  obj->MW_UDP_HANDLE = MW_UDP_Open(NULL, -1, -1, -1, MAX_int32_T, &status);
  obj->SocketOpened = false;
  if (status == 0) {
    obj->SocketOpened = true;
  }

  RemoteAddressPtrLoc = (char_T *)(&RemoteAddressLoc[0]);

  /* Start for MATLABSystem: '<S43>/UDP Write' */
  MW_UDP_ConnectToRemote(obj->MW_UDP_HANDLE, RemoteAddressPtrLoc, 25001);
}

static void soc_dvbs2_pr_UDPWrite_setupImpl(soc_linux_UDPWrite_soc_dvbs2__T *obj)
{
  char_T * RemoteAddressPtrLoc;
  int32_T status;
  static const char_T RemoteAddressLoc[16] = "255.255.255.255";

  /* Start for MATLABSystem: '<S40>/UDP Write' */
  obj->MW_UDP_HANDLE = MW_UDP_Open(NULL, -1, -1, -1, MAX_int32_T, &status);
  obj->SocketOpened = false;
  if (status == 0) {
    obj->SocketOpened = true;
  }

  RemoteAddressPtrLoc = (char_T *)(&RemoteAddressLoc[0]);

  /* Start for MATLABSystem: '<S40>/UDP Write' */
  MW_UDP_ConnectToRemote(obj->MW_UDP_HANDLE, RemoteAddressPtrLoc, 25000);
}

static void soc_dvbs2_pr_SystemCore_release(soc_linux_UDPWrite_soc_dvbs2__T *obj)
{
  int32_T status;
  boolean_T p;

  /* Start for MATLABSystem: '<S40>/UDP Write' incorporates:
   *  MATLABSystem: '<S43>/UDP Write'
   */
  if ((obj->isInitialized == 1) && obj->isSetupComplete && obj->SocketOpened) {
    status = MW_UDP_Close(obj->MW_UDP_HANDLE);
    p = false;
    if (status == 0) {
      p = true;
    }

    if (p) {
      obj->SocketOpened = false;
    }
  }

  /* End of Start for MATLABSystem: '<S40>/UDP Write' */
}

/* System initialize for referenced model: 'soc_dvbs2_proc' */
void soc_dvbs2_proc_Init(void)
{
  int32_T i;
  static const char_T b[17] = "/dev/mwdvbs2_ip0";

  /* SystemInitialize for RootInportFunctionCallGenerator generated from: '<Root>/dataTask' incorporates:
   *  SubSystem: '<Root>/Read Event'
   */

  /* Start for MATLABSystem: '<S70>/AXI4-Stream Read' */
  soc_dvbs2_proc_DW.obj_e.buffersAvailable = false;
  soc_dvbs2_proc_DW.obj_e.bufExists = false;
  soc_dvbs2_proc_DW.obj_e.isInitialized = 0;
  soc_dvbs2_proc_DW.obj_e.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty = true;
  soc_dvbs2_proc_SystemCore_setup(&soc_dvbs2_proc_DW.obj_e);

  /* End of SystemInitialize for RootInportFunctionCallGenerator generated from: '<Root>/dataTask' */

  /* SystemInitialize for Atomic SubSystem: '<Root>/Processor Algorithm Periodic' */
  /* Start for MATLABSystem: '<S53>/AXI4-Register Write' */
  soc_dvbs2_proc_DW.obj_kh.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_k3 = true;
  soc_dvbs2_proc_DW.obj_kh.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_kh.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_kh.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S53>/AXI4-Register Write' */

  /* Start for MATLABSystem: '<S55>/AXI4-Register Write' */
  soc_dvbs2_proc_DW.obj_pw.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_mc = true;
  soc_dvbs2_proc_DW.obj_pw.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_pw.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_pw.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S55>/AXI4-Register Write' */

  /* Start for MATLABSystem: '<S59>/AXI4-Register Write' */
  soc_dvbs2_proc_DW.obj_ao.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_k = true;
  soc_dvbs2_proc_DW.obj_ao.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_ao.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_ao.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S59>/AXI4-Register Write' */

  /* Start for MATLABSystem: '<S61>/AXI4-Register Write' */
  soc_dvbs2_proc_DW.obj_m.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_e = true;
  soc_dvbs2_proc_DW.obj_m.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_m.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_m.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S61>/AXI4-Register Write' */

  /* Start for MATLABSystem: '<S63>/AXI4-Register Write' */
  soc_dvbs2_proc_DW.obj_a.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_p = true;
  soc_dvbs2_proc_DW.obj_a.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_a.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_a.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S63>/AXI4-Register Write' */

  /* Start for MATLABSystem: '<S65>/AXI4-Register Write' */
  soc_dvbs2_proc_DW.obj_o2.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_h = true;
  soc_dvbs2_proc_DW.obj_o2.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_o2.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_o2.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S65>/AXI4-Register Write' */

  /* Start for MATLABSystem: '<S67>/AXI4-Register Write' */
  soc_dvbs2_proc_DW.obj_h.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_m = true;
  soc_dvbs2_proc_DW.obj_h.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_h.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_h.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S67>/AXI4-Register Write' */

  /* Start for MATLABSystem: '<S57>/AXI4-Register Write' */
  soc_dvbs2_proc_DW.obj_hy.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_g = true;
  soc_dvbs2_proc_DW.obj_hy.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_hy.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_hy.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S57>/AXI4-Register Write' */

  /* Start for MATLABSystem: '<S31>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_k.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_hj = true;
  soc_dvbs2_proc_DW.obj_k.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_k.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_k.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S31>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S33>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_l.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_da = true;
  soc_dvbs2_proc_DW.obj_l.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_l.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_l.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S33>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S19>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_jb.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_n = true;
  soc_dvbs2_proc_DW.obj_jb.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_jb.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_jb.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S19>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S35>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_p.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_o = true;
  soc_dvbs2_proc_DW.obj_p.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_p.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_p.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S35>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S21>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_po.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_dm = true;
  soc_dvbs2_proc_DW.obj_po.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_po.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_po.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S21>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S29>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_o.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_i = true;
  soc_dvbs2_proc_DW.obj_o.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_o.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_o.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S29>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S25>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_i.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_e1 = true;
  soc_dvbs2_proc_DW.obj_i.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_i.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_i.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S25>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S23>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_n.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_l = true;
  soc_dvbs2_proc_DW.obj_n.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_n.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_n.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S23>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S37>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_g.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_kq = true;
  soc_dvbs2_proc_DW.obj_g.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_g.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_g.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S37>/AXI4-Register Read' */

  /* Start for MATLABSystem: '<S27>/AXI4-Register Read' */
  soc_dvbs2_proc_DW.obj_kn.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_eh = true;
  soc_dvbs2_proc_DW.obj_kn.isInitialized = 1;
  for (i = 0; i < 17; i++) {
    soc_dvbs2_proc_B.b_j[i] = b[i];
  }

  soc_dvbs2_proc_DW.obj_kn.DeviceState = MW_AXI_REGISTER_INIT
    (&soc_dvbs2_proc_B.b_j[0]);
  soc_dvbs2_proc_DW.obj_kn.isSetupComplete = true;

  /* End of Start for MATLABSystem: '<S27>/AXI4-Register Read' */

  /* SystemInitialize for Enabled SubSystem: '<S1>/Subsystem' */
  /* Start for MATLABSystem: '<S43>/UDP Write' */
  soc_dvbs2_proc_DW.obj.SocketOpened = false;
  soc_dvbs2_proc_DW.obj.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_d = true;
  soc_dvbs2_proc_DW.obj.isSetupComplete = false;
  soc_dvbs2_proc_DW.obj.isInitialized = 1;
  soc_dvbs2__UDPWrite_setupImpl_j(&soc_dvbs2_proc_DW.obj);
  soc_dvbs2_proc_DW.obj.isSetupComplete = true;
  soc_dvbs2_proc_DW.obj.TunablePropsChanged = false;

  /* End of SystemInitialize for SubSystem: '<S1>/Subsystem' */

  /* SystemInitialize for Enabled SubSystem: '<S1>/RxUDPData' */
  /* Start for MATLABSystem: '<S40>/UDP Write' */
  soc_dvbs2_proc_DW.obj_j.SocketOpened = false;
  soc_dvbs2_proc_DW.obj_j.matlabCodegenIsDeleted = false;
  soc_dvbs2_proc_DW.objisempty_f = true;
  soc_dvbs2_proc_DW.obj_j.isSetupComplete = false;
  soc_dvbs2_proc_DW.obj_j.isInitialized = 1;
  soc_dvbs2_pr_UDPWrite_setupImpl(&soc_dvbs2_proc_DW.obj_j);
  soc_dvbs2_proc_DW.obj_j.isSetupComplete = true;
  soc_dvbs2_proc_DW.obj_j.TunablePropsChanged = false;

  /* End of SystemInitialize for SubSystem: '<S1>/RxUDPData' */
  /* End of SystemInitialize for SubSystem: '<Root>/Processor Algorithm Periodic' */
}

/* Output and update for referenced model: 'soc_dvbs2_proc' */
void soc_dvbs2_proc(real_T *rty_RxData, real_T *rty_statusUDPReport)
{
  int32_T i;
  int32_T tmp;
  uint32_T rtb_VectorConcatenate[10];
  uint32_T rtb_AXI4RegisterRead_fg_0;
  uint32_T rtb_Data;
  boolean_T rtb_RateTransition1;

  /* RateTransition: '<Root>/Rate Transition' */
  soc_dvbs2_proc_DW.RateTransition_semaphoreTaken =
    soc_dvbs2_proc_DW.RateTransition_ActiveBufIdx;
  tmp = soc_dvbs2_proc_DW.RateTransition_semaphoreTaken << 11;
  for (i = 0; i < 2048; i++) {
    soc_dvbs2_proc_B.RateTransition[i] =
      soc_dvbs2_proc_DW.RateTransition_Buffer[i + tmp];
  }

  /* End of RateTransition: '<Root>/Rate Transition' */

  /* RateTransition: '<Root>/Rate Transition1' */
  rtb_RateTransition1 = soc_dvbs2_proc_B.AXI4StreamRead_o2;

  /* Outputs for Atomic SubSystem: '<Root>/Processor Algorithm Periodic' */
  /* DataTypeConversion: '<S53>/Data Type Conversion' incorporates:
   *  Constant: '<Root>/Constant1'
   */
  rtb_Data = 1U;

  /* MATLABSystem: '<S53>/AXI4-Register Write' */
  MW_AXI_REGISTER_WRITE(soc_dvbs2_proc_DW.obj_kh.DeviceState, &rtb_Data, 296U,
                        4U);

  /* MATLABSystem: '<S55>/AXI4-Register Write' */
  MW_AXI_REGISTER_WRITE(soc_dvbs2_proc_DW.obj_pw.DeviceState, &rtb_Data, 300U,
                        4U);

  /* DataTypeConversion: '<S59>/Data Type Conversion' incorporates:
   *  Constant: '<Root>/snrdB'
   */
  rtb_Data = 15360U;

  /* MATLABSystem: '<S59>/AXI4-Register Write' */
  MW_AXI_REGISTER_WRITE(soc_dvbs2_proc_DW.obj_ao.DeviceState, &rtb_Data, 304U,
                        4U);

  /* DataTypeConversion: '<S61>/Data Type Conversion' incorporates:
   *  Constant: '<Root>/CFO'
   *  Gain: '<Root>/Gain2'
   */
  rtb_Data = 6553U;

  /* MATLABSystem: '<S61>/AXI4-Register Write' */
  MW_AXI_REGISTER_WRITE(soc_dvbs2_proc_DW.obj_m.DeviceState, &rtb_Data, 308U, 4U);

  /* DataTypeConversion: '<S63>/Data Type Conversion' incorporates:
   *  Constant: '<Root>/CPO'
   */
  rtb_Data = 0U;

  /* MATLABSystem: '<S63>/AXI4-Register Write' */
  MW_AXI_REGISTER_WRITE(soc_dvbs2_proc_DW.obj_a.DeviceState, &rtb_Data, 312U, 4U);

  /* DataTypeConversion: '<S65>/Data Type Conversion' incorporates:
   *  Constant: '<Root>/modcodidx'
   */
  rtb_Data = 12U;

  /* MATLABSystem: '<S65>/AXI4-Register Write' */
  MW_AXI_REGISTER_WRITE(soc_dvbs2_proc_DW.obj_o2.DeviceState, &rtb_Data, 316U,
                        4U);

  /* DataTypeConversion: '<S67>/Data Type Conversion' incorporates:
   *  Constant: '<Root>/Constant6'
   */
  rtb_Data = 1U;

  /* MATLABSystem: '<S67>/AXI4-Register Write' */
  MW_AXI_REGISTER_WRITE(soc_dvbs2_proc_DW.obj_h.DeviceState, &rtb_Data, 320U, 4U);

  /* DataTypeConversion: '<S57>/Data Type Conversion' incorporates:
   *  Constant: '<Root>/Constant9'
   */
  rtb_Data = 0U;

  /* MATLABSystem: '<S57>/AXI4-Register Write' */
  MW_AXI_REGISTER_WRITE(soc_dvbs2_proc_DW.obj_hy.DeviceState, &rtb_Data, 324U,
                        4U);

  /* MATLABSystem: '<S31>/AXI4-Register Read' */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_k.DeviceState, &rtb_Data, 276U, 4U);

  /* DataTypeConversion: '<S3>/Data Type Conversion' incorporates:
   *  DataTypeConversion: '<S31>/Data Type Conversion'
   *  MATLABSystem: '<S31>/AXI4-Register Read'
   */
  rtb_VectorConcatenate[5] = (uint16_T)rtb_Data;

  /* MATLABSystem: '<S33>/AXI4-Register Read' */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_l.DeviceState, &rtb_Data, 272U, 4U);

  /* DataTypeConversion: '<S3>/Data Type Conversion1' incorporates:
   *  DataTypeConversion: '<S33>/Data Type Conversion'
   *  MATLABSystem: '<S33>/AXI4-Register Read'
   */
  rtb_VectorConcatenate[4] = (uint8_T)((uint8_T)rtb_Data & 3);

  /* DataTypeConversion: '<S3>/Data Type Conversion10' incorporates:
   *  MATLABSystem: '<S19>/AXI4-Register Read'
   * */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_jb.DeviceState,
                       &rtb_VectorConcatenate[9], 292U, 4U);

  /* MATLABSystem: '<S35>/AXI4-Register Read' */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_p.DeviceState, &rtb_Data, 268U, 4U);

  /* MATLABSystem: '<S21>/AXI4-Register Read' */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_po.DeviceState,
                       &rtb_AXI4RegisterRead_fg_0, 284U, 4U);

  /* DataTypeConversion: '<S3>/Data Type Conversion2' incorporates:
   *  DataTypeConversion: '<S21>/Data Type Conversion'
   *  MATLABSystem: '<S21>/AXI4-Register Read'
   */
  rtb_VectorConcatenate[7] = (uint8_T)rtb_AXI4RegisterRead_fg_0;

  /* MATLABSystem: '<S29>/AXI4-Register Read' */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_o.DeviceState,
                       &rtb_AXI4RegisterRead_fg_0, 280U, 4U);

  /* DataTypeConversion: '<S3>/Data Type Conversion3' incorporates:
   *  DataTypeConversion: '<S29>/Data Type Conversion'
   *  MATLABSystem: '<S29>/AXI4-Register Read'
   */
  rtb_VectorConcatenate[6] = (uint16_T)rtb_AXI4RegisterRead_fg_0;

  /* DataTypeConversion: '<S3>/Data Type Conversion4' incorporates:
   *  MATLABSystem: '<S25>/AXI4-Register Read'
   * */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_i.DeviceState,
                       &rtb_VectorConcatenate[0], 256U, 4U);

  /* DataTypeConversion: '<S3>/Data Type Conversion5' incorporates:
   *  DataTypeConversion: '<S35>/Data Type Conversion'
   *  MATLABSystem: '<S35>/AXI4-Register Read'
   */
  rtb_VectorConcatenate[3] = (uint32_T)((rtb_Data & 1048576U) != 0U ? (int32_T)
    rtb_Data | -1048576 : (int32_T)(rtb_Data & 1048575U));

  /* MATLABSystem: '<S23>/AXI4-Register Read' */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_n.DeviceState, &rtb_Data, 260U, 4U);

  /* DataTypeConversion: '<S3>/Data Type Conversion7' incorporates:
   *  DataTypeConversion: '<S23>/Data Type Conversion'
   *  MATLABSystem: '<S23>/AXI4-Register Read'
   */
  rtb_VectorConcatenate[1] = (uint8_T)((uint8_T)rtb_Data & 31);

  /* MATLABSystem: '<S37>/AXI4-Register Read' */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_g.DeviceState, &rtb_Data, 264U, 4U);

  /* DataTypeConversion: '<S3>/Data Type Conversion8' incorporates:
   *  DataTypeConversion: '<S37>/Data Type Conversion'
   *  MATLABSystem: '<S37>/AXI4-Register Read'
   */
  rtb_VectorConcatenate[2] = (uint8_T)((uint8_T)rtb_Data & 1);

  /* DataTypeConversion: '<S3>/Data Type Conversion9' incorporates:
   *  MATLABSystem: '<S27>/AXI4-Register Read'
   * */
  MW_AXI_REGISTER_READ(soc_dvbs2_proc_DW.obj_kn.DeviceState,
                       &rtb_VectorConcatenate[8], 288U, 4U);

  /* Outputs for Enabled SubSystem: '<S1>/Subsystem' incorporates:
   *  EnablePort: '<S6>/Enable'
   */
  /* DigitalClock: '<S1>/Digital Clock' */
  if ((rtmGetClockTick0() * 0.001) > 0.0) {
    /* SignalConversion generated from: '<S6>/statusUDPReport' */
    *rty_statusUDPReport = 0.0;

    /* MATLABSystem: '<S43>/UDP Write' */
    if (soc_dvbs2_proc_DW.obj.TunablePropsChanged) {
      soc_dvbs2_proc_DW.obj.TunablePropsChanged = false;
    }

    memcpy((void *)&soc_dvbs2_proc_B.TxDataLocChar_f[0], (void *)
           &rtb_VectorConcatenate[0], (uint32_T)((size_t)40 * sizeof(uint8_T)));
    MW_UDP_Write(soc_dvbs2_proc_DW.obj.MW_UDP_HANDLE,
                 &soc_dvbs2_proc_B.TxDataLocChar_f[0], 40U);

    /* End of MATLABSystem: '<S43>/UDP Write' */
  }

  /* End of DigitalClock: '<S1>/Digital Clock' */
  /* End of Outputs for SubSystem: '<S1>/Subsystem' */

  /* Outputs for Enabled SubSystem: '<S1>/RxUDPData' incorporates:
   *  EnablePort: '<S5>/Enable'
   */
  if (rtb_RateTransition1) {
    /* SignalConversion generated from: '<S5>/RxUDPData' */
    *rty_RxData = 0.0;

    /* MATLABSystem: '<S40>/UDP Write' */
    if (soc_dvbs2_proc_DW.obj_j.TunablePropsChanged) {
      soc_dvbs2_proc_DW.obj_j.TunablePropsChanged = false;
    }

    memcpy((void *)&soc_dvbs2_proc_B.TxDataLocChar[0], (void *)
           &soc_dvbs2_proc_B.RateTransition[0], (uint32_T)((size_t)8192 * sizeof
            (uint8_T)));
    MW_UDP_Write(soc_dvbs2_proc_DW.obj_j.MW_UDP_HANDLE,
                 &soc_dvbs2_proc_B.TxDataLocChar[0], 8192U);

    /* End of MATLABSystem: '<S40>/UDP Write' */
  }

  /* End of Outputs for SubSystem: '<S1>/RxUDPData' */
  /* End of Outputs for SubSystem: '<Root>/Processor Algorithm Periodic' */
}

/* Output and update for referenced model: 'soc_dvbs2_proc' */
void soc_dvbs2_proc_dataTask(real_T *rty_done)
{
  ssize_t ssizeT;
  void* BufferStartPtr;
  int32_T i;
  int32_T nBytes;
  uint8_T b[37];
  static const uint8_T b_0[37] = { 69U, 82U, 82U, 79U, 82U, 91U, 37U, 100U, 93U,
    58U, 32U, 70U, 97U, 105U, 108U, 101U, 100U, 32U, 116U, 111U, 32U, 114U, 101U,
    102U, 105U, 108U, 108U, 32U, 98U, 117U, 102U, 102U, 101U, 114U, 46U, 10U, 0U
  };

  boolean_T guard1;

  /* RootInportFunctionCallGenerator generated from: '<Root>/dataTask' incorporates:
   *  SubSystem: '<Root>/Read Event'
   */
  {
    /* user code (Output function Header for TID1) */

    /* System '<Root>/Read Event' */
    extern volatile boolean_T runModel;

    /* user code (Output function Body for TID1) */

    /* System '<Root>/Read Event' */
    if (runModel==0)
      return(0);

    /* SignalConversion generated from: '<S2>/done' */
    *rty_done = 0.0;

    /* MATLABSystem: '<S70>/AXI4-Stream Read' */
    soc_dvbs2_proc_B.AXI4StreamRead_o2 = true;

    /* MATLABSystem: '<S70>/AXI4-Stream Read' */
    ssizeT = iio_buffer_refill(soc_dvbs2_proc_DW.obj_e.iioBuf);
    nBytes = (int32_T)ssizeT;
    if (((int32_T)ssizeT >= 0) && ((int32_T)ssizeT !=
         soc_dvbs2_proc_DW.obj_e.pNumBufferBytes)) {
      nBytes = -5;
    }

    guard1 = false;
    if (nBytes < 0) {
      if (nBytes == -9) {
        /* MATLABSystem: '<S70>/AXI4-Stream Read' */
        soc_dvbs2_proc_B.AXI4StreamRead_o2 = false;
      } else {
        for (i = 0; i < 37; i++) {
          b[i] = b_0[i];
        }

        printf(&b[0], nBytes);
        exit(nBytes);
        guard1 = true;
      }
    } else {
      guard1 = true;
    }

    if (guard1) {
      BufferStartPtr = iio_buffer_start(soc_dvbs2_proc_DW.obj_e.iioBuf);
      memcpy(&soc_dvbs2_proc_B.AXI4StreamRead_o1_m[0], BufferStartPtr, 8192U);
    }
  }

  /* End of Outputs for RootInportFunctionCallGenerator generated from: '<Root>/dataTask' */

  /* RateTransition: '<Root>/Rate Transition' */
  for (i = 0; i < 2048; i++) {
    soc_dvbs2_proc_DW.RateTransition_Buffer[i +
      ((soc_dvbs2_proc_DW.RateTransition_semaphoreTaken == 0) << 11)] =
      soc_dvbs2_proc_B.AXI4StreamRead_o1_m[i];
  }

  soc_dvbs2_proc_DW.RateTransition_ActiveBufIdx = (int8_T)
    (soc_dvbs2_proc_DW.RateTransition_semaphoreTaken == 0);

  /* End of RateTransition: '<Root>/Rate Transition' */
}

/* Termination for referenced model: 'soc_dvbs2_proc' */
void soc_dvbs2_proc_Term(void)
{
  /* Terminate for RootInportFunctionCallGenerator generated from: '<Root>/dataTask' incorporates:
   *  SubSystem: '<Root>/Read Event'
   */

  /* Terminate for MATLABSystem: '<S70>/AXI4-Stream Read' */
  if (!soc_dvbs2_proc_DW.obj_e.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_e.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_e.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_e.isSetupComplete) {
      soc_dvbs2_proc_base_doTeardown(&soc_dvbs2_proc_DW.obj_e);
    }
  }

  /* End of Terminate for MATLABSystem: '<S70>/AXI4-Stream Read' */

  /* End of Terminate for RootInportFunctionCallGenerator generated from: '<Root>/dataTask' */

  /* Terminate for Atomic SubSystem: '<Root>/Processor Algorithm Periodic' */
  /* Terminate for MATLABSystem: '<S53>/AXI4-Register Write' */
  if (!soc_dvbs2_proc_DW.obj_kh.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_kh.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_kh.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_kh.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_kh.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S53>/AXI4-Register Write' */

  /* Terminate for MATLABSystem: '<S55>/AXI4-Register Write' */
  if (!soc_dvbs2_proc_DW.obj_pw.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_pw.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_pw.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_pw.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_pw.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S55>/AXI4-Register Write' */

  /* Terminate for MATLABSystem: '<S59>/AXI4-Register Write' */
  if (!soc_dvbs2_proc_DW.obj_ao.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_ao.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_ao.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_ao.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_ao.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S59>/AXI4-Register Write' */

  /* Terminate for MATLABSystem: '<S61>/AXI4-Register Write' */
  if (!soc_dvbs2_proc_DW.obj_m.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_m.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_m.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_m.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_m.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S61>/AXI4-Register Write' */

  /* Terminate for MATLABSystem: '<S63>/AXI4-Register Write' */
  if (!soc_dvbs2_proc_DW.obj_a.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_a.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_a.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_a.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_a.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S63>/AXI4-Register Write' */

  /* Terminate for MATLABSystem: '<S65>/AXI4-Register Write' */
  if (!soc_dvbs2_proc_DW.obj_o2.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_o2.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_o2.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_o2.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_o2.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S65>/AXI4-Register Write' */

  /* Terminate for MATLABSystem: '<S67>/AXI4-Register Write' */
  if (!soc_dvbs2_proc_DW.obj_h.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_h.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_h.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_h.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_h.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S67>/AXI4-Register Write' */

  /* Terminate for MATLABSystem: '<S57>/AXI4-Register Write' */
  if (!soc_dvbs2_proc_DW.obj_hy.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_hy.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_hy.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_hy.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_hy.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S57>/AXI4-Register Write' */

  /* Terminate for MATLABSystem: '<S31>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_k.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_k.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_k.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_k.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_k.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S31>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S33>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_l.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_l.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_l.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_l.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_l.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S33>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S19>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_jb.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_jb.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_jb.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_jb.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_jb.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S19>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S35>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_p.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_p.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_p.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_p.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_p.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S35>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S21>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_po.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_po.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_po.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_po.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_po.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S21>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S29>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_o.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_o.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_o.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_o.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_o.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S29>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S25>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_i.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_i.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_i.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_i.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_i.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S25>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S23>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_n.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_n.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_n.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_n.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_n.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S23>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S37>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_g.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_g.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_g.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_g.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_g.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S37>/AXI4-Register Read' */

  /* Terminate for MATLABSystem: '<S27>/AXI4-Register Read' */
  if (!soc_dvbs2_proc_DW.obj_kn.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_kn.matlabCodegenIsDeleted = true;
    if ((soc_dvbs2_proc_DW.obj_kn.isInitialized == 1) &&
        soc_dvbs2_proc_DW.obj_kn.isSetupComplete) {
      MW_AXI_REGISTER_TERMINATE(soc_dvbs2_proc_DW.obj_kn.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S27>/AXI4-Register Read' */

  /* Terminate for Enabled SubSystem: '<S1>/Subsystem' */
  /* Terminate for MATLABSystem: '<S43>/UDP Write' */
  if (!soc_dvbs2_proc_DW.obj.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj.matlabCodegenIsDeleted = true;
    soc_dvbs2_pr_SystemCore_release(&soc_dvbs2_proc_DW.obj);
  }

  /* End of Terminate for MATLABSystem: '<S43>/UDP Write' */
  /* End of Terminate for SubSystem: '<S1>/Subsystem' */

  /* Terminate for Enabled SubSystem: '<S1>/RxUDPData' */
  /* Terminate for MATLABSystem: '<S40>/UDP Write' */
  if (!soc_dvbs2_proc_DW.obj_j.matlabCodegenIsDeleted) {
    soc_dvbs2_proc_DW.obj_j.matlabCodegenIsDeleted = true;
    soc_dvbs2_pr_SystemCore_release(&soc_dvbs2_proc_DW.obj_j);
  }

  /* End of Terminate for MATLABSystem: '<S40>/UDP Write' */
  /* End of Terminate for SubSystem: '<S1>/RxUDPData' */
  /* End of Terminate for SubSystem: '<Root>/Processor Algorithm Periodic' */
}

/* Model initialize function */
void soc_dvbs2_proc_initialize(const char_T **rt_errorStatus, const
  rtTimingBridge *timingBridge, int_T mdlref_TID0, int_T mdlref_TID1)
{
  RT_MODEL_soc_dvbs2_proc_T *const soc_dvbs2_proc_M =
    &(soc_dvbs2_proc_MdlrefDW.rtm);

  /* Registration code */

  /* setup the global timing engine */
  soc_dvbs2_proc_GlobalTID[0] = mdlref_TID0;
  soc_dvbs2_proc_GlobalTID[1] = mdlref_TID1;
  soc_dvbs2_proc_TimingBrdg = timingBridge;

  /* initialize error status */
  rtmSetErrorStatusPointer(soc_dvbs2_proc_M, rt_errorStatus);

  /* block I/O */
  (void) memset(((void *) &soc_dvbs2_proc_B), 0,
                sizeof(B_soc_dvbs2_proc_c_T));

  /* states (dwork) */
  (void) memset((void *)&soc_dvbs2_proc_DW, 0,
                sizeof(DW_soc_dvbs2_proc_f_T));
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
