/*
 * File: soc_dvbs2_proc_types.h
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

#ifndef soc_dvbs2_proc_types_h_
#define soc_dvbs2_proc_types_h_
#include "rtwtypes.h"
#include "mw_axi_register_lct.h"
#include "iio.h"
#include "iio_helper.h"
#include "mw_driver_basetypes.h"
#ifndef struct_tag_Mo5jT2WL4iM99dPTDPTzYC
#define struct_tag_Mo5jT2WL4iM99dPTDPTzYC

struct tag_Mo5jT2WL4iM99dPTDPTzYC
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  MW_AXI_Register_struct * DeviceState;
};

#endif                                 /* struct_tag_Mo5jT2WL4iM99dPTDPTzYC */

#ifndef typedef_soc_linux_AXIRegisterRead_soc_T
#define typedef_soc_linux_AXIRegisterRead_soc_T

typedef struct tag_Mo5jT2WL4iM99dPTDPTzYC soc_linux_AXIRegisterRead_soc_T;

#endif                             /* typedef_soc_linux_AXIRegisterRead_soc_T */

#ifndef struct_tag_bCIYBj591e7MYM5Bd9oh6C
#define struct_tag_bCIYBj591e7MYM5Bd9oh6C

struct tag_bCIYBj591e7MYM5Bd9oh6C
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  MW_AXI_Register_struct * DeviceState;
};

#endif                                 /* struct_tag_bCIYBj591e7MYM5Bd9oh6C */

#ifndef typedef_soc_linux_AXIRegisterWrite_so_T
#define typedef_soc_linux_AXIRegisterWrite_so_T

typedef struct tag_bCIYBj591e7MYM5Bd9oh6C soc_linux_AXIRegisterWrite_so_T;

#endif                             /* typedef_soc_linux_AXIRegisterWrite_so_T */

#ifndef struct_tag_BlgwLpgj2bjudmbmVKWwDE
#define struct_tag_BlgwLpgj2bjudmbmVKWwDE

struct tag_BlgwLpgj2bjudmbmVKWwDE
{
  uint32_T f1[8];
};

#endif                                 /* struct_tag_BlgwLpgj2bjudmbmVKWwDE */

#ifndef typedef_cell_wrap_soc_dvbs2_proc_T
#define typedef_cell_wrap_soc_dvbs2_proc_T

typedef struct tag_BlgwLpgj2bjudmbmVKWwDE cell_wrap_soc_dvbs2_proc_T;

#endif                                 /* typedef_cell_wrap_soc_dvbs2_proc_T */

#ifndef struct_tag_L9ijyahWyJMZLEsQW2JRaF
#define struct_tag_L9ijyahWyJMZLEsQW2JRaF

struct tag_L9ijyahWyJMZLEsQW2JRaF
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  boolean_T buffersAvailable;
  struct iio_context* iioCtx;
  struct iio_device* iioDev;
  struct iio_buffer* iioBuf;
  boolean_T bufExists;
  boolean_T needsTeardown;
  struct mw_iio_poll_config pollConfig;
  real_T pNumBufferBytes;
};

#endif                                 /* struct_tag_L9ijyahWyJMZLEsQW2JRaF */

#ifndef typedef_soc_libiio_axistream_read_soc_T
#define typedef_soc_libiio_axistream_read_soc_T

typedef struct tag_L9ijyahWyJMZLEsQW2JRaF soc_libiio_axistream_read_soc_T;

#endif                             /* typedef_soc_libiio_axistream_read_soc_T */

#ifndef struct_tag_BCCKIY6ljF6C2AYQs0wMGC
#define struct_tag_BCCKIY6ljF6C2AYQs0wMGC

struct tag_BCCKIY6ljF6C2AYQs0wMGC
{
  boolean_T matlabCodegenIsDeleted;
  MW_VoidPtr_T MW_UDP_HANDLE;
  boolean_T SocketOpened;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  boolean_T TunablePropsChanged;
  cell_wrap_soc_dvbs2_proc_T inputVarSize;
};

#endif                                 /* struct_tag_BCCKIY6ljF6C2AYQs0wMGC */

#ifndef typedef_soc_linux_UDPWrite_soc_dvbs2__T
#define typedef_soc_linux_UDPWrite_soc_dvbs2__T

typedef struct tag_BCCKIY6ljF6C2AYQs0wMGC soc_linux_UDPWrite_soc_dvbs2__T;

#endif                             /* typedef_soc_linux_UDPWrite_soc_dvbs2__T */

/* Forward declaration for rtModel */
typedef struct tag_RTM_soc_dvbs2_proc_T RT_MODEL_soc_dvbs2_proc_T;

#endif                                 /* soc_dvbs2_proc_types_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
