#include "c2000BoardSupport.h"
#include "F2806x_Device.h"
#include "F2806x_Examples.h"
#include "F2806x_GlobalPrototypes.h"
#include "rtwtypes.h"
#include "ccs_c_caller_model.h"
#include "ccs_c_caller_model_private.h"

void config_ADC_SOC0(void)
{
  EALLOW;
  AdcRegs.ADCCTL2.bit.CLKDIV2EN = 1U;  /* Set ADC clock division */
  AdcRegs.ADCCTL2.bit.CLKDIV4EN = 0U;  /* Set ADC clock division */
  AdcRegs.ADCCTL2.bit.ADCNONOVERLAP = 0U;
                                 /* Set ADCNONOVERLAP contorl bit to  Allowed */
  AdcRegs.ADCSAMPLEMODE.bit.SIMULEN0 = 0U;/* Single sample mode set for SOC0.*/
  AdcRegs.ADCSOC0CTL.bit.CHSEL = 0U;   /* Set SOC0 channel select to ADCINA0*/
  AdcRegs.ADCSOC0CTL.bit.TRIGSEL = 0U;
  AdcRegs.ADCSOC0CTL.bit.ACQPS = (uint16_T)6.0;
                                /* Set SOC0 S/H Window to 7.0 ADC Clock Cycles*/
  AdcRegs.ADCINTSOCSEL1.bit.SOC0 = 0U;
                                   /* SOCx No ADCINT Interrupt Trigger Select.*/
  AdcRegs.ADCOFFTRIM.bit.OFFTRIM = (uint16_T)AdcRegs.ADCOFFTRIM.bit.OFFTRIM;/* Set Offset Error Correction Value*/
  AdcRegs.ADCCTL1.bit.ADCREFSEL = 0U ; /* Set Reference Voltage*/
  AdcRegs.ADCCTL1.bit.INTPULSEPOS = 1U;
             /* Interrupt pulse generation occurs at the end of the conversion*/
  AdcRegs.SOCPRICTL.bit.SOCPRIORITY = 0U;/* All in round robin mode SOC Priority*/
  EDIS;
}
