/*
 * File: Current.c
 *
 * Code generated for Simulink model 'Current'.
 *
 * Model version                  : 10.2
 * Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
 * C/C++ source code generated on : Fri Jan 23 10:36:44 2026
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Texas Instruments->C2000
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "Current.h"
#include "rtwtypes.h"
#include "Current_private.h"
#include "IQmathLib.h"
#include <string.h>

/* Block states (default storage) */
DW_Current_T Current_DW;

/* External inputs (root inport signals with default storage) */
ExtU_Current_T Current_U;

/* External outputs (root outports fed by signals with default storage) */
ExtY_Current_T Current_Y;

/* Real-time model */
static RT_MODEL_Current_T Current_M_;
RT_MODEL_Current_T *const Current_M = &Current_M_;

/* System initialize for atomic system: '<Root>/Current Control' */
void Current_CurrentControl_Init(DW_CurrentControl_Current_T *localDW)
{
  /* InitializeConditions for DiscreteIntegrator: '<S56>/Integrator' incorporates:
   *  Constant: '<S17>/Ki1'
   */
  localDW->Integrator_DSTATE = 0L;
  localDW->Integrator_PrevResetState = 0;

  /* InitializeConditions for DiscreteIntegrator: '<S111>/Integrator' incorporates:
   *  Constant: '<S18>/Kp1'
   */
  localDW->Integrator_DSTATE_p = 0L;
  localDW->Integrator_PrevResetState_n = 0;

  /* InitializeConditions for Delay: '<S165>/Delay' */
  localDW->icLoad = true;

  /* InitializeConditions for Delay: '<S162>/Delay' */
  localDW->CircBufIdx = 0U;
}

/* Output and update for atomic system: '<Root>/Current Control' */
void Current_CurrentControl(const int32_T rtu_Idq_ref_PU[2], const uint16_T
  rtu_Feedbacks_sim[4], int32_T rty_DutyCycles[3], int32_T *rty_Speed_fb, const
  ConstB_CurrentControl_Current_T *localC, DW_CurrentControl_Current_T *localDW)
{
  int32_T rtb_Integrator;
  int32_T rtb_InvertingNoninvertingCurr_0;
  int32_T rtb_Kbeta;
  int32_T rtb_Saturation;
  int32_T rtb_Saturation_f;
  int32_T rtb_Sum4;
  int32_T rtb_Sum6;
  int32_T rtb_Sum_j;
  uint32_T rtb_Integrator_tmp;
  int16_T tmp;
  int16_T tmp_0;
  uint16_T rtb_Sum3;

  /* Outputs for IfAction SubSystem: '<S161>/PositionNoReset' incorporates:
   *  ActionPort: '<S171>/Action Port'
   */
  /* If: '<S161>/If1' incorporates:
   *  Constant: '<S176>/Constant'
   *  DataTypeConversion: '<S167>/Data Type Conversion4'
   *  Gain: '<S162>/PositionToCount'
   *  MinMax: '<S171>/MinMax'
   *  Product: '<S161>/Product'
   *  Sum: '<S171>/Sum3'
   *  Sum: '<S171>/Sum7'
   */
  rtb_Sum3 = rtu_Feedbacks_sim[2] - rtu_Feedbacks_sim[3];
  if (rtb_Sum3 > rtb_Sum3 + 4000U) {
    rtb_Sum3 += 4000U;
  }

  rtb_Integrator_tmp = (uint32_T)((rtb_Sum3 * 274877907ULL) >> 23U) << 15U;

  /* End of If: '<S161>/If1' */
  /* End of Outputs for SubSystem: '<S161>/PositionNoReset' */

  /* Gain: '<S139>/indexing' incorporates:
   *  Constant: '<S3>/IndexOffset'
   *  DataTypeConversion: '<S167>/Data Type Conversion1'
   *  DataTypeConversion: '<S167>/Data Type Conversion2'
   *  DataTypeConversion: '<S167>/Data Type Conversion4'
   *  DiscreteIntegrator: '<S56>/Integrator'
   *  Gain: '<S169>/Number of pole pairs'
   *  Sum: '<S167>/Sum1'
   *  Switch: '<S167>/Switch'
   */
  rtb_Integrator = (int32_T)((((rtb_Integrator_tmp - 708673536UL) << 2U) >> 15U)
    * 12800LL);

  /* DataTypeConversion: '<S139>/Get_Integer' incorporates:
   *  DiscreteIntegrator: '<S56>/Integrator'
   */
  rtb_InvertingNoninvertingCurr_0 = rtb_Integrator >> 21U;

  /* DataTypeConversion: '<S139>/Get_FractionVal' incorporates:
   *  DataTypeConversion: '<S139>/Data Type Conversion1'
   *  DiscreteIntegrator: '<S56>/Integrator'
   *  Sum: '<S139>/Sum2'
   *  Sum: '<S18>/Sum'
   */
  rtb_Sum_j = (rtb_Integrator - (rtb_InvertingNoninvertingCurr_0 << 21U)) >> 4U;

  /* Sum: '<S140>/Sum4' incorporates:
   *  Constant: '<S139>/offset'
   *  Constant: '<S139>/sine_table_values'
   *  DataTypeConversion: '<S139>/Get_Integer'
   *  Product: '<S140>/Product'
   *  Selector: '<S139>/Lookup'
   *  Sum: '<S139>/Sum'
   *  Sum: '<S140>/Sum3'
   *  Sum: '<S18>/Sum'
   */
  rtb_Sum4 = Current_ConstP.sine_table_values_Value[(int16_T)
    rtb_InvertingNoninvertingCurr_0];
  rtb_Sum4 += __IQmpy(Current_ConstP.sine_table_values_Value[(int16_T)
                      rtb_InvertingNoninvertingCurr_0 + 1] - rtb_Sum4, rtb_Sum_j,
                      17);

  /* Sum: '<S140>/Sum6' incorporates:
   *  Constant: '<S139>/offset'
   *  Constant: '<S139>/sine_table_values'
   *  DataTypeConversion: '<S139>/Get_Integer'
   *  Product: '<S140>/Product1'
   *  Selector: '<S139>/Lookup'
   *  Sum: '<S139>/Sum'
   *  Sum: '<S140>/Sum5'
   *  Sum: '<S18>/Sum'
   */
  rtb_Integrator = Current_ConstP.sine_table_values_Value[(int16_T)
    rtb_InvertingNoninvertingCurr_0 + 200];
  rtb_Sum6 = __IQmpy(Current_ConstP.sine_table_values_Value[(int16_T)
                     rtb_InvertingNoninvertingCurr_0 + 201] - rtb_Integrator,
                     rtb_Sum_j, 17) + rtb_Integrator;

  /* Gain: '<S158>/Inverting // Non-inverting  Current measurement  amplifieer' incorporates:
   *  ArithShift: '<S181>/Q17 per unit conversion'
   *  Constant: '<S158>/Constant'
   *  Constant: '<S158>/Constant1'
   *  DataTypeConversion: '<S158>/Data Type Conversion'
   *  Sum: '<S158>/Add'
   */
  rtb_Sum_j = (rtu_Feedbacks_sim[0] - 2295L) << 6U;
  rtb_InvertingNoninvertingCurr_0 = (rtu_Feedbacks_sim[1] - 2286L) << 6U;

  /* Outputs for Atomic SubSystem: '<S15>/Two phase CRL wrap' */
  /* Gain: '<S15>/Kbeta' incorporates:
   *  Gain: '<S16>/one_by_sqrt3'
   *  Sum: '<S16>/a_plus_2b'
   */
  rtb_Kbeta = __IQmpy(619925131L, (rtb_Sum_j + rtb_InvertingNoninvertingCurr_0)
                      + rtb_InvertingNoninvertingCurr_0, 30);

  /* Outputs for Atomic SubSystem: '<S136>/Two inputs CRL' */
  /* Sum: '<S137>/sum_Ds' incorporates:
   *  AlgorithmDescriptorDelegate generated from: '<S16>/a16'
   *  Gain: '<S15>/Kbeta'
   *  Product: '<S137>/acos'
   *  Product: '<S137>/bsin'
   *  Sum: '<S140>/Sum4'
   *  Sum: '<S140>/Sum6'
   */
  *rty_Speed_fb = __IQmpy(rtb_Sum_j, rtb_Sum6, 17) + __IQmpy(rtb_Kbeta, rtb_Sum4,
    17);

  /* End of Outputs for SubSystem: '<S15>/Two phase CRL wrap' */

  /* Sum: '<S17>/Sum' */
  rtb_InvertingNoninvertingCurr_0 = rtu_Idq_ref_PU[0] - *rty_Speed_fb;

  /* End of Outputs for SubSystem: '<S136>/Two inputs CRL' */

  /* DiscreteIntegrator: '<S56>/Integrator' incorporates:
   *  Constant: '<S17>/Ki1'
   */
  if (localC->LogicalOperator || (localDW->Integrator_PrevResetState != 0)) {
    localDW->Integrator_DSTATE = 0L;
  }

  /* Sum: '<S65>/Sum' incorporates:
   *  Constant: '<S17>/Kp'
   *  DeadZone: '<S48>/DeadZone'
   *  DiscreteIntegrator: '<S56>/Integrator'
   *  Product: '<S61>/PProd Out'
   *  Sum: '<S17>/Sum'
   */
  rtb_Integrator = __IQmpy(rtb_InvertingNoninvertingCurr_0, 405399L, 17) +
    localDW->Integrator_DSTATE;

  /* Saturate: '<S63>/Saturation' incorporates:
   *  DeadZone: '<S48>/DeadZone'
   */
  if (rtb_Integrator > 131072L) {
    rtb_Saturation = 131072L;
  } else if (rtb_Integrator < -131072L) {
    rtb_Saturation = -131072L;
  } else {
    rtb_Saturation = rtb_Integrator;
  }

  /* End of Saturate: '<S63>/Saturation' */

  /* Outputs for Atomic SubSystem: '<S136>/Two inputs CRL' */
  /* Outputs for Atomic SubSystem: '<S15>/Two phase CRL wrap' */
  /* Sum: '<S18>/Sum' incorporates:
   *  AlgorithmDescriptorDelegate generated from: '<S16>/a16'
   *  Gain: '<S15>/Kbeta'
   *  Product: '<S137>/asin'
   *  Product: '<S137>/bcos'
   *  Sum: '<S137>/sum_Qs'
   *  Sum: '<S140>/Sum4'
   *  Sum: '<S140>/Sum6'
   */
  rtb_Sum_j = (rtu_Idq_ref_PU[1] - __IQmpy(rtb_Kbeta, rtb_Sum6, 17)) + __IQmpy
    (rtb_Sum_j, rtb_Sum4, 17);

  /* End of Outputs for SubSystem: '<S15>/Two phase CRL wrap' */
  /* End of Outputs for SubSystem: '<S136>/Two inputs CRL' */

  /* DiscreteIntegrator: '<S111>/Integrator' incorporates:
   *  Constant: '<S18>/Kp1'
   */
  if (localC->LogicalOperator_d || (localDW->Integrator_PrevResetState_n != 0))
  {
    localDW->Integrator_DSTATE_p = 0L;
  }

  /* Sum: '<S120>/Sum' incorporates:
   *  Constant: '<S18>/Kp'
   *  DeadZone: '<S103>/DeadZone'
   *  DiscreteIntegrator: '<S111>/Integrator'
   *  Product: '<S116>/PProd Out'
   *  Sum: '<S18>/Sum'
   */
  rtb_Kbeta = __IQmpy(rtb_Sum_j, 405399L, 17) + localDW->Integrator_DSTATE_p;

  /* Saturate: '<S118>/Saturation' incorporates:
   *  DeadZone: '<S103>/DeadZone'
   */
  if (rtb_Kbeta > 131072L) {
    rtb_Saturation_f = 131072L;
  } else if (rtb_Kbeta < -131072L) {
    rtb_Saturation_f = -131072L;
  } else {
    rtb_Saturation_f = rtb_Kbeta;
  }

  /* End of Saturate: '<S118>/Saturation' */

  /* Outputs for Atomic SubSystem: '<S131>/Two inputs CRL' */
  /* Sum: '<S132>/sum_beta' incorporates:
   *  Product: '<S132>/dsin'
   *  Product: '<S132>/qcos'
   *  Saturate: '<S118>/Saturation'
   *  Saturate: '<S63>/Saturation'
   *  Sum: '<S140>/Sum4'
   *  Sum: '<S140>/Sum6'
   */
  *rty_Speed_fb = __IQmpy(rtb_Saturation_f, rtb_Sum6, 17) + __IQmpy
    (rtb_Saturation, rtb_Sum4, 17);

  /* Switch: '<S133>/Switch' incorporates:
   *  Product: '<S132>/dcos'
   *  Product: '<S132>/qsin'
   *  Saturate: '<S118>/Saturation'
   *  Saturate: '<S63>/Saturation'
   *  Sum: '<S132>/sum_alpha'
   *  Sum: '<S140>/Sum4'
   *  Sum: '<S140>/Sum6'
   */
  rtb_Sum4 = __IQmpy(rtb_Saturation, rtb_Sum6, 17) - __IQmpy(rtb_Saturation_f,
    rtb_Sum4, 17);

  /* Gain: '<S156>/one_by_two' incorporates:
   *  AlgorithmDescriptorDelegate generated from: '<S132>/a16'
   *  MinMax: '<S150>/Min'
   */
  rtb_Saturation = rtb_Sum4 >> 1U;

  /* Gain: '<S156>/sqrt3_by_two' incorporates:
   *  Gain: '<S156>/Kc'
   */
  rtb_Sum6 = __IQxmpy(1859775393L, *rty_Speed_fb, 1);

  /* End of Outputs for SubSystem: '<S131>/Two inputs CRL' */

  /* Gain: '<S156>/Kb' incorporates:
   *  Gain: '<S156>/Kc'
   *  MinMax: '<S150>/Min'
   *  Sum: '<S156>/add_b'
   */
  *rty_Speed_fb = rtb_Sum6 - rtb_Saturation;

  /* Gain: '<S156>/Kc' incorporates:
   *  MinMax: '<S150>/Min'
   *  Sum: '<S156>/add_c'
   */
  rtb_Sum6 = -rtb_Saturation - rtb_Sum6;

  /* Outputs for Atomic SubSystem: '<S131>/Two inputs CRL' */
  /* MinMax: '<S150>/Max' incorporates:
   *  AlgorithmDescriptorDelegate generated from: '<S132>/a16'
   */
  if (rtb_Sum4 >= *rty_Speed_fb) {
    rtb_Saturation = rtb_Sum4;
  } else {
    rtb_Saturation = *rty_Speed_fb;
  }

  /* MinMax: '<S150>/Min' incorporates:
   *  AlgorithmDescriptorDelegate generated from: '<S132>/a16'
   */
  if (rtb_Sum4 <= *rty_Speed_fb) {
    rtb_Saturation_f = rtb_Sum4;
  } else {
    rtb_Saturation_f = *rty_Speed_fb;
  }

  /* End of Outputs for SubSystem: '<S131>/Two inputs CRL' */

  /* MinMax: '<S150>/Max' incorporates:
   *  Gain: '<S156>/Kc'
   */
  if (rtb_Saturation < rtb_Sum6) {
    rtb_Saturation = rtb_Sum6;
  }

  /* MinMax: '<S150>/Min' incorporates:
   *  Gain: '<S156>/Kc'
   */
  if (rtb_Saturation_f > rtb_Sum6) {
    rtb_Saturation_f = rtb_Sum6;
  }

  /* Gain: '<S150>/one_by_two' incorporates:
   *  MinMax: '<S150>/Max'
   *  MinMax: '<S150>/Min'
   *  Product: '<S165>/Product1'
   *  Sum: '<S150>/Add'
   */
  rtb_Saturation = __IQmpy(-1L, rtb_Saturation + rtb_Saturation_f, 1);

  /* Outputs for Atomic SubSystem: '<S131>/Two inputs CRL' */
  /* Sum: '<S4>/Sum' incorporates:
   *  AlgorithmDescriptorDelegate generated from: '<S132>/a16'
   *  Constant: '<S4>/Constant'
   *  Gain: '<S149>/Gain'
   *  Gain: '<S156>/Kc'
   *  Gain: '<S4>/Gain'
   *  Product: '<S165>/Product1'
   *  Sum: '<S149>/Add1'
   *  Sum: '<S149>/Add2'
   *  Sum: '<S149>/Add3'
   */
  rty_DutyCycles[0] = __IQxmpy(1073741824L, __IQmpy(151349L, rtb_Sum4 +
    rtb_Saturation, 17), 1) + 65536L;

  /* End of Outputs for SubSystem: '<S131>/Two inputs CRL' */
  rty_DutyCycles[1] = __IQxmpy(1073741824L, __IQmpy(151349L, *rty_Speed_fb +
    rtb_Saturation, 17), 1) + 65536L;
  rty_DutyCycles[2] = __IQxmpy(1073741824L, __IQmpy(151349L, rtb_Saturation +
    rtb_Sum6, 17), 1) + 65536L;

  /* Delay: '<S165>/Delay' incorporates:
   *  Constant: '<S159>/IC'
   */
  if (localDW->icLoad) {
    localDW->Delay_DSTATE_h = 0L;
  }

  /* Gain: '<S162>/SpeedGain' incorporates:
   *  Delay: '<S162>/Delay'
   *  Sum: '<S162>/SpeedCount'
   */
  *rty_Speed_fb = (int32_T)((((int32_T)rtb_Integrator_tmp - (int32_T)
    localDW->Delay_DSTATE[localDW->CircBufIdx]) * 3921628283LL) >> 43U);

  /* Sum: '<S165>/Add1' incorporates:
   *  Delay: '<S165>/Delay'
   *  Product: '<S165>/Product'
   *  Product: '<S165>/Product1'
   */
  *rty_Speed_fb = __IQmpy(*rty_Speed_fb, 1311L, 17) + __IQmpy(129761L,
    localDW->Delay_DSTATE_h, 17);

  /* DeadZone: '<S103>/DeadZone' */
  if (rtb_Kbeta > 131072L) {
    rtb_Kbeta -= 131072L;
  } else if (rtb_Kbeta >= -131072L) {
    rtb_Kbeta = 0L;
  } else {
    rtb_Kbeta -= -131072L;
  }

  /* End of DeadZone: '<S103>/DeadZone' */

  /* Product: '<S108>/IProd Out' incorporates:
   *  Constant: '<S18>/Ki'
   *  Product: '<S53>/IProd Out'
   *  Sum: '<S18>/Sum'
   */
  rtb_Sum_j = __IQmpy(rtb_Sum_j, 36925L, 17);

  /* Switch: '<S101>/Switch1' incorporates:
   *  Constant: '<S101>/Constant'
   *  Constant: '<S101>/Constant2'
   *  DeadZone: '<S103>/DeadZone'
   *  RelationalOperator: '<S101>/fix for DT propagation issue'
   */
  if (rtb_Kbeta > 0L) {
    tmp = 1;
  } else {
    tmp = -1;
  }

  /* Switch: '<S101>/Switch2' incorporates:
   *  Constant: '<S101>/Constant3'
   *  Constant: '<S101>/Constant4'
   *  Product: '<S53>/IProd Out'
   *  RelationalOperator: '<S101>/fix for DT propagation issue1'
   */
  if (rtb_Sum_j > 0L) {
    tmp_0 = 1;
  } else {
    tmp_0 = -1;
  }

  /* Switch: '<S101>/Switch' incorporates:
   *  Constant: '<S101>/Constant1'
   *  DeadZone: '<S103>/DeadZone'
   *  Logic: '<S101>/AND3'
   *  Product: '<S53>/IProd Out'
   *  RelationalOperator: '<S101>/Equal1'
   *  RelationalOperator: '<S101>/Relational Operator'
   *  Switch: '<S101>/Switch1'
   *  Switch: '<S101>/Switch2'
   */
  if ((rtb_Kbeta != 0L) && (tmp == tmp_0)) {
    rtb_Kbeta = 0L;
  } else {
    rtb_Kbeta = rtb_Sum_j;
  }

  /* End of Switch: '<S101>/Switch' */

  /* DeadZone: '<S48>/DeadZone' */
  if (rtb_Integrator > 131072L) {
    rtb_Integrator -= 131072L;
  } else if (rtb_Integrator >= -131072L) {
    rtb_Integrator = 0L;
  } else {
    rtb_Integrator -= -131072L;
  }

  /* End of DeadZone: '<S48>/DeadZone' */

  /* Product: '<S53>/IProd Out' incorporates:
   *  Constant: '<S17>/Ki'
   *  Sum: '<S17>/Sum'
   */
  rtb_Sum_j = __IQmpy(rtb_InvertingNoninvertingCurr_0, 36925L, 17);

  /* Switch: '<S46>/Switch1' incorporates:
   *  Constant: '<S46>/Constant'
   *  Constant: '<S46>/Constant2'
   *  DeadZone: '<S48>/DeadZone'
   *  RelationalOperator: '<S46>/fix for DT propagation issue'
   */
  if (rtb_Integrator > 0L) {
    tmp = 1;
  } else {
    tmp = -1;
  }

  /* Switch: '<S46>/Switch2' incorporates:
   *  Constant: '<S46>/Constant3'
   *  Constant: '<S46>/Constant4'
   *  Product: '<S53>/IProd Out'
   *  RelationalOperator: '<S46>/fix for DT propagation issue1'
   */
  if (rtb_Sum_j > 0L) {
    tmp_0 = 1;
  } else {
    tmp_0 = -1;
  }

  /* Switch: '<S46>/Switch' incorporates:
   *  Constant: '<S46>/Constant1'
   *  DeadZone: '<S48>/DeadZone'
   *  Logic: '<S46>/AND3'
   *  RelationalOperator: '<S46>/Equal1'
   *  RelationalOperator: '<S46>/Relational Operator'
   *  Switch: '<S46>/Switch1'
   *  Switch: '<S46>/Switch2'
   */
  if ((rtb_Integrator != 0L) && (tmp == tmp_0)) {
    rtb_Sum_j = 0L;
  }

  /* Update for DiscreteIntegrator: '<S56>/Integrator' incorporates:
   *  Switch: '<S46>/Switch'
   */
  localDW->Integrator_DSTATE += rtb_Sum_j;
  localDW->Integrator_PrevResetState = (int16_T)localC->LogicalOperator;

  /* Update for DiscreteIntegrator: '<S111>/Integrator' incorporates:
   *  Switch: '<S101>/Switch'
   */
  localDW->Integrator_DSTATE_p += rtb_Kbeta;
  localDW->Integrator_PrevResetState_n = (int16_T)localC->LogicalOperator_d;

  /* Update for Delay: '<S165>/Delay' */
  localDW->icLoad = false;
  localDW->Delay_DSTATE_h = *rty_Speed_fb;

  /* Update for Delay: '<S162>/Delay' */
  localDW->Delay_DSTATE[localDW->CircBufIdx] = rtb_Integrator_tmp;
  if (localDW->CircBufIdx < 19U) {
    localDW->CircBufIdx++;
  } else {
    localDW->CircBufIdx = 0U;
  }

  /* End of Update for Delay: '<S162>/Delay' */
}

/* Model step function */
void Current_step(void)
{
  /* Outputs for Atomic SubSystem: '<Root>/Current Control' */

  /* Inport: '<Root>/Idq_ref_PU' incorporates:
   *  Inport: '<Root>/Feedbacks_sim'
   *  Outport: '<Root>/Duty Cycles'
   *  Outport: '<Root>/Speed_fb'
   */
  profileStart_Current_Control(1U); /* original_line:556 */Current_CurrentControl(Current_U.Idq_ref_PU, Current_U.Feedbacks_sim,
    Current_Y.DutyCycles, &Current_Y.Speed_fb, &Current_ConstB.CurrentControl,
    &Current_DW.CurrentControl);profileEnd_Current_Control(1U); /* original_line:558 */

  /* End of Outputs for SubSystem: '<Root>/Current Control' */
}

/* Model initialize function */
void Current_initialize(void)
{
  /* Registration code */

  /* initialize error status */
  rtmSetErrorStatus(Current_M, (NULL));

  /* states (dwork) */
  (void) memset((void *)&Current_DW, 0,
                sizeof(DW_Current_T));

  /* external inputs */
  (void)memset(&Current_U, 0, sizeof(ExtU_Current_T));

  /* external outputs */
  (void)memset(&Current_Y, 0, sizeof(ExtY_Current_T));

  /* SystemInitialize for Atomic SubSystem: '<Root>/Current Control' */
  profileStart_Current_Control(2U); /* original_line:582 */Current_CurrentControl_Init(&Current_DW.CurrentControl);profileEnd_Current_Control(2U); /* original_line:582 */

  /* End of SystemInitialize for SubSystem: '<Root>/Current Control' */
}

/* Model terminate function */
void Current_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
