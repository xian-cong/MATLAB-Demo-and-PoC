/*
 * File: Current.h
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

#ifndef Current_h_
#define Current_h_
#ifndef Current_COMMON_INCLUDES_
#define Current_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* Current_COMMON_INCLUDES_ */

#include "Current_types.h"
#include <stddef.h>
#include <string.h>

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

/* Block states (default storage) for system '<Root>/Current Control' */
typedef struct {
  uint32_T Delay_DSTATE[20];           /* '<S162>/Delay' */
  int32_T Integrator_DSTATE;           /* '<S56>/Integrator' */
  int32_T Integrator_DSTATE_p;         /* '<S111>/Integrator' */
  int32_T Delay_DSTATE_h;              /* '<S165>/Delay' */
  uint16_T CircBufIdx;                 /* '<S162>/Delay' */
  int16_T Integrator_PrevResetState;   /* '<S56>/Integrator' */
  int16_T Integrator_PrevResetState_n; /* '<S111>/Integrator' */
  boolean_T icLoad;                    /* '<S165>/Delay' */
} DW_CurrentControl_Current_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  DW_CurrentControl_Current_T CurrentControl;/* '<Root>/Current Control' */
} DW_Current_T;

/* Invariant block signals for system '<Root>/Current Control' */
typedef struct {
  const boolean_T LogicalOperator;     /* '<S17>/Logical Operator' */
  const boolean_T LogicalOperator_d;   /* '<S18>/Logical Operator' */
} ConstB_CurrentControl_Current_T;

/* Invariant block signals (default storage) */
typedef struct {
  ConstB_CurrentControl_Current_T CurrentControl;/* '<Root>/Current Control' */
} ConstB_Current_T;

/* Constant parameters (default storage) */
typedef struct {
  /* Computed Parameter: sine_table_values_Value
   * Referenced by: '<S139>/sine_table_values'
   */
  int32_T sine_table_values_Value[1002];
} ConstP_Current_T;

/* External inputs (root inport signals with default storage) */
typedef struct {
  int32_T Idq_ref_PU[2];               /* '<Root>/Idq_ref_PU' */
  uint16_T Feedbacks_sim[4];           /* '<Root>/Feedbacks_sim' */
} ExtU_Current_T;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  int32_T DutyCycles[3];               /* '<Root>/Duty Cycles' */
  int32_T Speed_fb;                    /* '<Root>/Speed_fb' */
} ExtY_Current_T;



/* Declare global externs for instrumentation */
extern void profileStart_Current_Control(uint16_T);
extern void profileEnd_Current_Control(uint16_T);
/* Code_Instrumentation_Declarations_Placeholder */

/* Real-time Model Data Structure */
struct tag_RTM_Current_T {
  const char_T * volatile errorStatus;
};

/* Block states (default storage) */
extern DW_Current_T Current_DW;

/* External inputs (root inport signals with default storage) */
extern ExtU_Current_T Current_U;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY_Current_T Current_Y;
extern const ConstB_Current_T Current_ConstB;/* constant block i/o */

/* Constant parameters (default storage) */
extern const ConstP_Current_T Current_ConstP;

/* Model entry point functions */
extern void Current_initialize(void);
extern void Current_step(void);
extern void Current_terminate(void);

/* Real-time Model object */
extern RT_MODEL_Current_T *const Current_M;
extern volatile boolean_T stopRequested;
extern volatile boolean_T runModel;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S16>/Data Type Duplicate' : Unused code path elimination
 * Block '<S132>/Data Type Duplicate' : Unused code path elimination
 * Block '<S132>/Data Type Duplicate1' : Unused code path elimination
 * Block '<S137>/Data Type Duplicate' : Unused code path elimination
 * Block '<S137>/Data Type Duplicate1' : Unused code path elimination
 * Block '<S139>/Data Type Duplicate' : Unused code path elimination
 * Block '<S139>/Data Type Propagation' : Unused code path elimination
 * Block '<S144>/Data Type Duplicate' : Unused code path elimination
 * Block '<S145>/Data Type Duplicate' : Unused code path elimination
 * Block '<S11>/Data Type Duplicate' : Unused code path elimination
 * Block '<S11>/Vc' : Unused code path elimination
 * Block '<S156>/Data Type Duplicate' : Unused code path elimination
 * Block '<S159>/Data Type Duplicate' : Unused code path elimination
 * Block '<S167>/Data Type Duplicate' : Unused code path elimination
 * Block '<S167>/Data Type Conversion' : Unused code path elimination
 * Block '<S160>/ReplaceInport_Npp' : Unused code path elimination
 * Block '<S161>/ReplaceInport_CountsPerRev' : Unused code path elimination
 * Block '<S161>/ReplaceInport_OneByCountsPerRev' : Unused code path elimination
 * Block '<S162>/Data Type Duplicate' : Unused code path elimination
 * Block '<S159>/Cast To Boolean' : Eliminate redundant data type conversion
 * Block '<S181>/Data Type Conversion' : Eliminate redundant data type conversion
 * Block '<S181>/Data Type Conversion1' : Eliminate redundant data type conversion
 * Block '<S133>/Offset' : Unused code path elimination
 * Block '<S133>/Unary_Minus' : Unused code path elimination
 * Block '<S138>/Offset' : Unused code path elimination
 * Block '<S138>/Unary_Minus' : Unused code path elimination
 * Block '<S159>/Reset' : Unused code path elimination
 * Block '<S167>/Constant' : Unused code path elimination
 * Block '<S167>/Constant1' : Unused code path elimination
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('mcb_pmsm_foc_sim/Current Control')    - opens subsystem mcb_pmsm_foc_sim/Current Control
 * hilite_system('mcb_pmsm_foc_sim/Current Control/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'mcb_pmsm_foc_sim'
 * '<S1>'   : 'mcb_pmsm_foc_sim/Current Control'
 * '<S2>'   : 'mcb_pmsm_foc_sim/Current Control/Control_System'
 * '<S3>'   : 'mcb_pmsm_foc_sim/Current Control/Input Scaling'
 * '<S4>'   : 'mcb_pmsm_foc_sim/Current Control/Output Scaling'
 * '<S5>'   : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control'
 * '<S6>'   : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Clarke Transform'
 * '<S7>'   : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers'
 * '<S8>'   : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Inverse Park Transform'
 * '<S9>'   : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Park Transform'
 * '<S10>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup'
 * '<S11>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator'
 * '<S12>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Clarke Transform/Variant'
 * '<S13>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Clarke Transform/Variant/mcb'
 * '<S14>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Clarke Transform/Variant/mcb/Clarke Transform'
 * '<S15>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Clarke Transform/Variant/mcb/Clarke Transform/Two phase input'
 * '<S16>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Clarke Transform/Variant/mcb/Clarke Transform/Two phase input/Two phase CRL wrap'
 * '<S17>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id'
 * '<S18>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq'
 * '<S19>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset'
 * '<S20>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Anti-windup'
 * '<S21>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/D Gain'
 * '<S22>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/External Derivative'
 * '<S23>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Filter'
 * '<S24>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Filter ICs'
 * '<S25>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/I Gain'
 * '<S26>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Ideal P Gain'
 * '<S27>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Ideal P Gain Fdbk'
 * '<S28>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Integrator'
 * '<S29>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Integrator ICs'
 * '<S30>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/N Copy'
 * '<S31>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/N Gain'
 * '<S32>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/P Copy'
 * '<S33>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Parallel P Gain'
 * '<S34>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Reset Signal'
 * '<S35>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Saturation'
 * '<S36>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Saturation Fdbk'
 * '<S37>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Sum'
 * '<S38>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Sum Fdbk'
 * '<S39>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Tracking Mode'
 * '<S40>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Tracking Mode Sum'
 * '<S41>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Tsamp - Integral'
 * '<S42>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Tsamp - Ngain'
 * '<S43>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/postSat Signal'
 * '<S44>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/preInt Signal'
 * '<S45>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/preSat Signal'
 * '<S46>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Anti-windup/Disc. Clamping Parallel'
 * '<S47>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Anti-windup/Disc. Clamping Parallel/Dead Zone'
 * '<S48>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Anti-windup/Disc. Clamping Parallel/Dead Zone/Enabled'
 * '<S49>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/D Gain/Disabled'
 * '<S50>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/External Derivative/Disabled'
 * '<S51>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Filter/Disabled'
 * '<S52>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Filter ICs/Disabled'
 * '<S53>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/I Gain/External Parameters'
 * '<S54>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Ideal P Gain/Passthrough'
 * '<S55>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Ideal P Gain Fdbk/Disabled'
 * '<S56>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Integrator/Discrete'
 * '<S57>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Integrator ICs/External IC'
 * '<S58>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/N Copy/Disabled wSignal Specification'
 * '<S59>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/N Gain/Disabled'
 * '<S60>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/P Copy/Disabled'
 * '<S61>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Parallel P Gain/External Parameters'
 * '<S62>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Reset Signal/External Reset'
 * '<S63>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Saturation/Enabled'
 * '<S64>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Saturation Fdbk/Disabled'
 * '<S65>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Sum/Sum_PI'
 * '<S66>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Sum Fdbk/Disabled'
 * '<S67>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Tracking Mode/Disabled'
 * '<S68>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Tracking Mode Sum/Passthrough'
 * '<S69>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Tsamp - Integral/TsSignalSpecification'
 * '<S70>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/Tsamp - Ngain/Passthrough'
 * '<S71>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/postSat Signal/Forward_Path'
 * '<S72>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/preInt Signal/Internal PreInt'
 * '<S73>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Id/Discrete PI Controller  with anti-windup & reset/preSat Signal/Forward_Path'
 * '<S74>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset'
 * '<S75>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Anti-windup'
 * '<S76>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/D Gain'
 * '<S77>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/External Derivative'
 * '<S78>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Filter'
 * '<S79>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Filter ICs'
 * '<S80>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/I Gain'
 * '<S81>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Ideal P Gain'
 * '<S82>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Ideal P Gain Fdbk'
 * '<S83>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Integrator'
 * '<S84>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Integrator ICs'
 * '<S85>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/N Copy'
 * '<S86>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/N Gain'
 * '<S87>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/P Copy'
 * '<S88>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Parallel P Gain'
 * '<S89>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Reset Signal'
 * '<S90>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Saturation'
 * '<S91>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Saturation Fdbk'
 * '<S92>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Sum'
 * '<S93>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Sum Fdbk'
 * '<S94>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Tracking Mode'
 * '<S95>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Tracking Mode Sum'
 * '<S96>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Tsamp - Integral'
 * '<S97>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Tsamp - Ngain'
 * '<S98>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/postSat Signal'
 * '<S99>'  : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/preInt Signal'
 * '<S100>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/preSat Signal'
 * '<S101>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Anti-windup/Disc. Clamping Parallel'
 * '<S102>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Anti-windup/Disc. Clamping Parallel/Dead Zone'
 * '<S103>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Anti-windup/Disc. Clamping Parallel/Dead Zone/Enabled'
 * '<S104>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/D Gain/Disabled'
 * '<S105>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/External Derivative/Disabled'
 * '<S106>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Filter/Disabled'
 * '<S107>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Filter ICs/Disabled'
 * '<S108>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/I Gain/External Parameters'
 * '<S109>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Ideal P Gain/Passthrough'
 * '<S110>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Ideal P Gain Fdbk/Disabled'
 * '<S111>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Integrator/Discrete'
 * '<S112>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Integrator ICs/External IC'
 * '<S113>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/N Copy/Disabled wSignal Specification'
 * '<S114>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/N Gain/Disabled'
 * '<S115>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/P Copy/Disabled'
 * '<S116>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Parallel P Gain/External Parameters'
 * '<S117>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Reset Signal/External Reset'
 * '<S118>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Saturation/Enabled'
 * '<S119>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Saturation Fdbk/Disabled'
 * '<S120>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Sum/Sum_PI'
 * '<S121>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Sum Fdbk/Disabled'
 * '<S122>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Tracking Mode/Disabled'
 * '<S123>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Tracking Mode Sum/Passthrough'
 * '<S124>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Tsamp - Integral/TsSignalSpecification'
 * '<S125>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/Tsamp - Ngain/Passthrough'
 * '<S126>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/postSat Signal/Forward_Path'
 * '<S127>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/preInt Signal/Internal PreInt'
 * '<S128>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Current_Controllers/PI_Controller_Iq/Discrete PI Controller  with anti-windup & reset/preSat Signal/Forward_Path'
 * '<S129>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Inverse Park Transform/Variant'
 * '<S130>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Inverse Park Transform/Variant/mcb'
 * '<S131>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Inverse Park Transform/Variant/mcb/Inverse Park Transform'
 * '<S132>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Inverse Park Transform/Variant/mcb/Inverse Park Transform/Two inputs CRL'
 * '<S133>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Inverse Park Transform/Variant/mcb/Inverse Park Transform/Two inputs CRL/Switch_Axis'
 * '<S134>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Park Transform/Variant'
 * '<S135>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Park Transform/Variant/mcb'
 * '<S136>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Park Transform/Variant/mcb/Park Transform'
 * '<S137>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Park Transform/Variant/mcb/Park Transform/Two inputs CRL'
 * '<S138>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Park Transform/Variant/mcb/Park Transform/Two inputs CRL/Switch_Axis'
 * '<S139>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup/Sine-Cosine Lookup'
 * '<S140>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup/Sine-Cosine Lookup/Interpolation'
 * '<S141>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup/Sine-Cosine Lookup/WrapUp'
 * '<S142>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup/Sine-Cosine Lookup/datatype'
 * '<S143>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup/Sine-Cosine Lookup/WrapUp/Compare To Zero'
 * '<S144>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup/Sine-Cosine Lookup/WrapUp/If Action Subsystem'
 * '<S145>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup/Sine-Cosine Lookup/WrapUp/If Action Subsystem1'
 * '<S146>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Sine-Cosine Lookup/Sine-Cosine Lookup/datatype/datatype no change'
 * '<S147>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Modulation method'
 * '<S148>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Voltage Input'
 * '<S149>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Modulation method/SVPWM'
 * '<S150>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Modulation method/SVPWM/Half(Vmin+Vmax)'
 * '<S151>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Voltage Input/Valphabeta'
 * '<S152>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Voltage Input/Valphabeta/Inverse Clarke Transform'
 * '<S153>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Voltage Input/Valphabeta/Inverse Clarke Transform/Variant'
 * '<S154>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Voltage Input/Valphabeta/Inverse Clarke Transform/Variant/mcb'
 * '<S155>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Voltage Input/Valphabeta/Inverse Clarke Transform/Variant/mcb/Inverse Clarke Transform'
 * '<S156>' : 'mcb_pmsm_foc_sim/Current Control/Control_System/Closed Loop Control/Space Vector Generator/Voltage Input/Valphabeta/Inverse Clarke Transform/Variant/mcb/Inverse Clarke Transform/Two phase input'
 * '<S157>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed'
 * '<S158>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/Calculate Phase Currents'
 * '<S159>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/IIR Filter'
 * '<S160>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Mechanical to Electrical Position'
 * '<S161>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder'
 * '<S162>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Speed Measurement'
 * '<S163>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/IIR Filter/IIR Filter'
 * '<S164>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/IIR Filter/IIR Filter/Low-pass'
 * '<S165>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/IIR Filter/IIR Filter/Low-pass/IIR Low Pass Filter'
 * '<S166>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Mechanical to Electrical Position/MechToElec'
 * '<S167>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Mechanical to Electrical Position/MechToElec/fixed-point'
 * '<S168>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Mechanical to Electrical Position/MechToElec/fixed-point/Variant Subsystem'
 * '<S169>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Mechanical to Electrical Position/MechToElec/fixed-point/Variant Subsystem/Dialog'
 * '<S170>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder/DT_Handle'
 * '<S171>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder/PositionNoReset'
 * '<S172>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder/PositionResetAtIndex'
 * '<S173>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder/Variant Subsystem'
 * '<S174>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder/DT_Handle/fixed-point'
 * '<S175>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder/PositionNoReset/Variant Subsystem'
 * '<S176>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder/PositionNoReset/Variant Subsystem/Dialog'
 * '<S177>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Quadrature Decoder/Variant Subsystem/Dialog'
 * '<S178>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Speed Measurement/DT_Handle'
 * '<S179>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/ Calculate Position and Speed/Speed Measurement/DT_Handle/fixed-point'
 * '<S180>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/Calculate Phase Currents/Data_Type'
 * '<S181>' : 'mcb_pmsm_foc_sim/Current Control/Input Scaling/Calculate Phase Currents/Data_Type/Data_Type_Fixed_Point'
 */
#endif                                 /* Current_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
