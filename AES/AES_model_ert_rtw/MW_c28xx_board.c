#include "c2000BoardSupport.h"
#include "MW_f28p65x_includes.h"
#include "rtwtypes.h"
#include "AES_model.h"
#include "AES_model_private.h"

void init_board (void)
{
  DisableDog();
  EALLOW;
  CpuSysRegs.PCLKCR0.bit.DMA = 1U;
  CpuSysRegs.PCLKCR6.bit.SD1 = 1U;
  CpuSysRegs.PCLKCR6.bit.SD2 = 1U;
  CpuSysRegs.PCLKCR6.bit.SD3 = 1U;
  CpuSysRegs.PCLKCR6.bit.SD4 = 1U;
  CpuSysRegs.PCLKCR17.bit.CLB1 = 1U;
  CpuSysRegs.PCLKCR17.bit.CLB2 = 1U;
  CpuSysRegs.PCLKCR17.bit.CLB3 = 1U;
  CpuSysRegs.PCLKCR17.bit.CLB4 = 1U;
  CpuSysRegs.PCLKCR17.bit.CLB5 = 1U;
  CpuSysRegs.PCLKCR17.bit.CLB6 = 1U;
  EDIS;

#ifdef CPU1

  CpuSysRegs.PCLKCR13.bit.ADC_A = 1U;
  CpuSysRegs.PCLKCR13.bit.ADC_B = 1U;
  CpuSysRegs.PCLKCR13.bit.ADC_C = 1U;
  InitSysPll(INT_OSC2, 40, 0, 0, 1, SYSCTL_DCC_BASE0);

  //Turn on all peripherals
  //InitPeripheralClocks();
  EALLOW;
  CpuSysRegs.PCLKCR0.bit.CPUTIMER0 = 1U;
  CpuSysRegs.PCLKCR0.bit.CPUTIMER1 = 1U;
  CpuSysRegs.PCLKCR0.bit.CPUTIMER2 = 1U;
  CpuSysRegs.PCLKCR25.bit.HRCAL0 = 1U;
  CpuSysRegs.PCLKCR25.bit.HRCAL1 = 1U;
  CpuSysRegs.PCLKCR25.bit.HRCAL2 = 1U;
  CpuSysRegs.PCLKCR0.bit.ERAD = 1U;
  CpuSysRegs.PCLKCR1.bit.EMIF1 = 1U;

  /* Assign all Peripherals to CPU2 */
  DevCfgRegs.CPUSEL11.all = 0x0000000FU;
  DevCfgRegs.CPUSEL5.all = 0x0000000FU;
  DevCfgRegs.CPUSEL14.all = 0x00070000U;
  DevCfgRegs.CPUSEL7.all = 0x00000003U;
  DevCfgRegs.CPUSEL0.all = 0x0003FFFFU;
  DevCfgRegs.CPUSEL1.all = 0x0000007FU;
  DevCfgRegs.CPUSEL2.all = 0x0000003FU;
  DevCfgRegs.CPUSEL4.all = 0x0000000FU;
  DevCfgRegs.CPUSEL6.all = 0x0000000FU;
  DevCfgRegs.CPUSEL8.all = 0x00000031U;
  DevCfgRegs.CPUSEL12.all = 0x000007FFU;
  DevCfgRegs.CPUSEL15.all = 0x0000003FU;

  /* Assign flash banks to CPU2 */
  DevCfgRegs.BANKMUXSEL.all = 0x000003C0U;

  /* Assign D2-D5 RAM to CPU2 */
  DevCfgRegs.MCUCNF1.all = 0x0000003AU;
  EDIS;

#endif                                 // #ifdef CPU1

  EALLOW;

  /* Configure low speed peripheral clocks */
  ClkCfgRegs.LOSPCP.bit.LSPCLKDIV = 0U;
  EDIS;

  /* Disable and clear all CPU interrupts */
  DINT;
  IER = 0x0000U;
  IFR = 0x0000U;
  InitPieCtrl();
  InitPieVectTable();
  initSetGPIOIPC();
  InitCpuTimers();

#ifdef CPU1

  /* initial GPIO qualification settings.... */
  EALLOW;
  GpioCtrlRegs.GPAQSEL1.all = 0x0U;
  GpioCtrlRegs.GPAQSEL2.all = 0x0U;
  GpioCtrlRegs.GPBQSEL1.all = 0x0U;
  GpioCtrlRegs.GPBQSEL2.all = 0x0U;
  GpioCtrlRegs.GPCQSEL1.all = 0x0U;
  GpioCtrlRegs.GPCQSEL2.all = 0x0U;
  GpioCtrlRegs.GPDQSEL1.all = 0x0U;
  GpioCtrlRegs.GPDQSEL2.all = 0x0U;
  GpioCtrlRegs.GPEQSEL1.all = 0x0U;
  GpioCtrlRegs.GPEQSEL2.all = 0x0U;
  GpioCtrlRegs.GPFQSEL1.all = 0x0U;
  GpioCtrlRegs.GPGQSEL1.all = 0x0U;
  GpioCtrlRegs.GPGQSEL2.all = 0x0U;
  GpioCtrlRegs.GPHQSEL1.all = 0x0U;
  GpioCtrlRegs.GPGAMSEL.all = 0U;
  GpioCtrlRegs.GPHAMSEL.all = 0U;
  EDIS;

#endif                                 // #ifdef CPU1

#ifdef CPU1

  EALLOW;

#ifdef MW_DAC_CHANNEL_A

  DevCfgRegs.CPUSEL14.bit.DAC_A = 0U;

#endif

#ifdef MW_DAC_CHANNEL_B

  DevCfgRegs.CPUSEL14.bit.DAC_B = 0U;

#endif

#ifdef MW_DAC_CHANNEL_C

  DevCfgRegs.CPUSEL14.bit.DAC_C = 0U;

#endif

  /* Assign SDFM modules to CPU1 */
#ifdef MW_SDFM_1

  DevCfgRegs.CPUSEL4.bit.SD1 = 0U;

#endif

#ifdef MW_SDFM_2

  DevCfgRegs.CPUSEL4.bit.SD2 = 0U;

#endif

#ifdef MW_SDFM_3

  DevCfgRegs.CPUSEL4.bit.SD3 = 0U;

#endif

#ifdef MW_SDFM_4

  DevCfgRegs.CPUSEL4.bit.SD4 = 0U;

#endif

  /* Assign MCAN modules to CPU1 */
#ifdef MW_MCAN_A

  DevCfgRegs.CPUSEL8.bit.MCAN_A = 0U;

#endif

#ifdef MW_MCAN_B

  DevCfgRegs.CPUSEL8.bit.MCAN_B = 0U;

#endif

  /* Assign used SPI modules to CPU1 */
#ifdef MW_SPI_A

  DevCfgRegs.CPUSEL6.bit.SPI_A = 0U;

#endif

#ifdef MW_SPI_B

  DevCfgRegs.CPUSEL6.bit.SPI_B = 0U;

#endif

#ifdef MW_SPI_C

  DevCfgRegs.CPUSEL6.bit.SPI_C = 0U;

#endif

#ifdef MW_SPI_D

  DevCfgRegs.CPUSEL6.bit.SPI_D = 0U;

#endif

#if defined MW_CMPSS1_COMPH || defined MW_CMPSS1_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS1 = 0U;

#endif

#if defined MW_CMPSS2_COMPH || defined MW_CMPSS2_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS2 = 0U;

#endif

#if defined MW_CMPSS3_COMPH || defined MW_CMPSS3_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS3 = 0U;

#endif

#if defined MW_CMPSS4_COMPH || defined MW_CMPSS4_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS4 = 0U;

#endif

#if defined MW_CMPSS5_COMPH || defined MW_CMPSS5_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS5 = 0U;

#endif

#if defined MW_CMPSS6_COMPH || defined MW_CMPSS6_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS6 = 0U;

#endif

#if defined MW_CMPSS7_COMPH || defined MW_CMPSS7_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS7 = 0U;

#endif

#if defined MW_CMPSS8_COMPH || defined MW_CMPSS8_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS8 = 0U;

#endif

#if defined MW_CMPSS9_COMPH || defined MW_CMPSS9_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS9 = 0U;

#endif

#if defined MW_CMPSS10_COMPH || defined MW_CMPSS10_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS10 = 0U;

#endif

#if defined MW_CMPSS11_COMPH || defined MW_CMPSS11_COMPL

  DevCfgRegs.CPUSEL12.bit.CMPSS11 = 0U;

#endif

  EDIS;

#endif                                 // #ifdef CPU1

}
