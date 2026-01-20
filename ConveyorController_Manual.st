(* ============================================================================
   CONVEYOR SYSTEM CONTROLLER
   IEC 61131-3 Structured Text Implementation
   
   Description: Two-robot conveyor system with quality inspection
   Author: Generated from Stateflow
   Date: 2025-12-17
   ============================================================================ *)

FUNCTION_BLOCK ConveyorController

VAR_INPUT
    (* Sensor Inputs *)
    S1 : BOOL;              (* Sensor 1 - Entry detection *)
    S2 : BOOL;              (* Sensor 2 - ABB robot inspection point *)
    S3 : BOOL;              (* Sensor 3 - After ABB robot placement *)
    S4 : BOOL;              (* Sensor 4 - AUBO i3 pickup point *)
    
    (* Robot Feedback *)
    ABB_Done : BOOL;        (* ABB robot operation complete *)
    AUBO_Done : BOOL;       (* AUBO i3 robot operation complete *)
    Object_Quality : BOOL;  (* Quality check result: TRUE=Good, FALSE=Damaged *)
    
    (* System Control *)
    Emergency_Stop : BOOL;  (* Emergency stop button *)
    Reset : BOOL;           (* Manual reset button *)
END_VAR

VAR_OUTPUT
    (* Actuator Outputs *)
    Conveyor_Run : BOOL;    (* Conveyor motor control *)
    ABB_Trigger : BOOL;     (* Trigger ABB robot operation *)
    AUBO_Trigger : BOOL;    (* Trigger AUBO i3 robot operation *)
    
    (* Status Indicators *)
    Error_Flag : BOOL;      (* Invalid placement error indicator *)
    System_Ready : BOOL;    (* System ready for next object *)
    
    (* Counters *)
    Object_Counter : UINT;  (* Total object counter *)
    Reject_Counter : UINT;  (* Rejected object counter *)
    Accept_Counter : UINT;  (* Accepted object counter *)
END_VAR

VAR
    (* State Machine *)
    Current_State : INT := 0;
    Previous_State : INT := 0;
    
    (* State Definitions *)
    STATE_IDLE : INT := 0;
    STATE_MOVING_TO_S2 : INT := 1;
    STATE_AT_S2_INSPECTION : INT := 2;
    STATE_ABB_PROCESSING : INT := 3;
    STATE_WAITING_AT_S3 : INT := 4;
    STATE_DELAY_AT_S3 : INT := 5;
    STATE_MOVING_TO_S4 : INT := 6;
    STATE_AT_S4_PICKUP : INT := 7;
    STATE_AUBO_PROCESSING : INT := 8;
    STATE_ERROR : INT := 9;
    
    (* Internal Variables *)
    Timer_Count : UINT := 0;        (* 3-second delay timer counter *)
    Timer_Target : UINT := 30;      (* Target count for 3 seconds at 10Hz *)
    
    S1_Previous : BOOL := FALSE;    (* Previous state of S1 for edge detection *)
    S1_Rising_Edge : BOOL := FALSE; (* S1 rising edge detected *)
    
    Valid_Entry : BOOL := FALSE;    (* Flag for valid object entry through S1 *)
    
    (* State Entry Flags *)
    State_Entry : BOOL := FALSE;
END_VAR

(* ============================================================================
   MAIN PROGRAM
   ============================================================================ *)

(* Emergency Stop Override *)
IF Emergency_Stop THEN
    Conveyor_Run := FALSE;
    ABB_Trigger := FALSE;
    AUBO_Trigger := FALSE;
    Current_State := STATE_ERROR;
    Error_Flag := TRUE;
    RETURN;
END_IF;

(* Detect S1 Rising Edge *)
S1_Rising_Edge := S1 AND NOT S1_Previous;
S1_Previous := S1;

(* Detect State Entry *)
State_Entry := (Current_State <> Previous_State);
Previous_State := Current_State;

(* Main State Machine *)
CASE Current_State OF
    
    (* ========================================================================
       STATE 0: IDLE
       Waiting for object at S1
       ======================================================================== *)
    STATE_IDLE:
        (* Entry Actions *)
        IF State_Entry THEN
            Conveyor_Run := FALSE;
            ABB_Trigger := FALSE;
            AUBO_Trigger := FALSE;
            Error_Flag := FALSE;
            System_Ready := TRUE;
            Valid_Entry := FALSE;
        END_IF;
        
        (* Transition Logic *)
        (* T1: IDLE -> MOVING_TO_S2 (S1 rising edge and all other sensors clear) *)
        IF S1_Rising_Edge AND NOT S2 AND NOT S3 AND NOT S4 THEN
            Current_State := STATE_MOVING_TO_S2;
            Valid_Entry := TRUE;
            
        (* T10: IDLE -> ERROR (Invalid placement detected) *)
        ELSIF (S2 OR S3 OR S4) AND NOT Valid_Entry THEN
            Current_State := STATE_ERROR;
        END_IF;
    
    (* ========================================================================
       STATE 1: MOVING_TO_S2
       Conveyor moving from S1 to S2
       ======================================================================== *)
    STATE_MOVING_TO_S2:
        (* Entry Actions *)
        IF State_Entry THEN
            Conveyor_Run := TRUE;
            System_Ready := FALSE;
        END_IF;
        
        (* Transition Logic *)
        (* T2: MOVING_TO_S2 -> AT_S2_INSPECTION (S2 detected) *)
        IF S2 THEN
            Current_State := STATE_AT_S2_INSPECTION;
        END_IF;
    
    (* ========================================================================
       STATE 2: AT_S2_INSPECTION
       Stopped at S2 for ABB robot inspection
       ======================================================================== *)
    STATE_AT_S2_INSPECTION:
        (* Entry Actions *)
        IF State_Entry THEN
            Conveyor_Run := FALSE;
            ABB_Trigger := TRUE;
        END_IF;
        
        (* Transition Logic *)
        (* T3: AT_S2_INSPECTION -> ABB_PROCESSING *)
        IF ABB_Trigger THEN
            Current_State := STATE_ABB_PROCESSING;
        END_IF;
    
    (* ========================================================================
       STATE 3: ABB_PROCESSING
       ABB robot processing object
       ======================================================================== *)
    STATE_ABB_PROCESSING:
        (* Entry Actions *)
        IF State_Entry THEN
            ABB_Trigger := FALSE;
        END_IF;
        
        (* Transition Logic *)
        (* T4: ABB_PROCESSING -> WAITING_AT_S3 (ABB done) *)
        IF ABB_Done THEN
            (* Update counters based on quality *)
            IF Object_Quality THEN
                Accept_Counter := Accept_Counter + 1;
            ELSE
                Reject_Counter := Reject_Counter + 1;
            END_IF;
            
            Current_State := STATE_WAITING_AT_S3;
        END_IF;
    
    (* ========================================================================
       STATE 4: WAITING_AT_S3
       Waiting for object placement at S3
       ======================================================================== *)
    STATE_WAITING_AT_S3:
        (* No specific entry actions *)
        
        (* Transition Logic *)
        (* T5: WAITING_AT_S3 -> DELAY_AT_S3 (S3 detected) *)
        IF S3 THEN
            Current_State := STATE_DELAY_AT_S3;
        END_IF;
    
    (* ========================================================================
       STATE 5: DELAY_AT_S3
       3-second delay timer at S3
       ======================================================================== *)
    STATE_DELAY_AT_S3:
        (* Entry Actions *)
        IF State_Entry THEN
            Timer_Count := 0;
        END_IF;
        
        (* During Actions - Increment timer *)
        Timer_Count := Timer_Count + 1;
        
        (* Transition Logic *)
        (* T6: DELAY_AT_S3 -> MOVING_TO_S4 (Timer expired and S4 clear) *)
        IF Timer_Count >= Timer_Target AND NOT S4 THEN
            Current_State := STATE_MOVING_TO_S4;
            
        (* T12: Stay in DELAY_AT_S3 if S4 occupied *)
        ELSIF Timer_Count >= Timer_Target AND S4 THEN
            Timer_Count := Timer_Target;  (* Hold timer *)
        END_IF;
    
    (* ========================================================================
       STATE 6: MOVING_TO_S4
       Conveyor moving from S3 to S4
       ======================================================================== *)
    STATE_MOVING_TO_S4:
        (* Entry Actions *)
        IF State_Entry THEN
            Conveyor_Run := TRUE;
        END_IF;
        
        (* Transition Logic *)
        (* T7: MOVING_TO_S4 -> AT_S4_PICKUP (S4 detected) *)
        IF S4 THEN
            Current_State := STATE_AT_S4_PICKUP;
        END_IF;
    
    (* ========================================================================
       STATE 7: AT_S4_PICKUP
       Stopped at S4 for AUBO pickup
       ======================================================================== *)
    STATE_AT_S4_PICKUP:
        (* Entry Actions *)
        IF State_Entry THEN
            Conveyor_Run := FALSE;
            AUBO_Trigger := TRUE;
        END_IF;
        
        (* Transition Logic *)
        (* T8: AT_S4_PICKUP -> AUBO_PROCESSING *)
        IF AUBO_Trigger THEN
            Current_State := STATE_AUBO_PROCESSING;
        END_IF;
    
    (* ========================================================================
       STATE 8: AUBO_PROCESSING
       AUBO i3 robot processing
       ======================================================================== *)
    STATE_AUBO_PROCESSING:
        (* Entry Actions *)
        IF State_Entry THEN
            AUBO_Trigger := FALSE;
        END_IF;
        
        (* Transition Logic *)
        (* T9: AUBO_PROCESSING -> IDLE (AUBO done and S4 clear) *)
        IF AUBO_Done AND NOT S4 THEN
            Object_Counter := Object_Counter + 1;
            Valid_Entry := FALSE;
            Current_State := STATE_IDLE;
        END_IF;
    
    (* ========================================================================
       STATE 9: ERROR
       Invalid placement error
       ======================================================================== *)
    STATE_ERROR:
        (* Entry Actions *)
        IF State_Entry THEN
            Error_Flag := TRUE;
            Conveyor_Run := FALSE;
            System_Ready := FALSE;
        END_IF;
        
        (* Transition Logic *)
        (* T11: ERROR -> IDLE (Manual reset or all sensors clear) *)
        IF Reset OR (NOT S1 AND NOT S2 AND NOT S3 AND NOT S4) THEN
            Error_Flag := FALSE;
            Valid_Entry := FALSE;
            Current_State := STATE_IDLE;
        END_IF;
    
    (* Default Case *)
    ELSE
        Current_State := STATE_IDLE;
END_CASE;

END_FUNCTION_BLOCK


(* ============================================================================
   TEST PROGRAM
   ============================================================================ *)

PROGRAM ConveyorSystem_Test

VAR
    (* Instantiate Function Block *)
    Controller : ConveyorController;
    
    (* Test Inputs *)
    Test_S1 : BOOL := FALSE;
    Test_S2 : BOOL := FALSE;
    Test_S3 : BOOL := FALSE;
    Test_S4 : BOOL := FALSE;
    Test_ABB_Done : BOOL := FALSE;
    Test_AUBO_Done : BOOL := FALSE;
    Test_Quality : BOOL := TRUE;
    Test_Emergency : BOOL := FALSE;
    Test_Reset : BOOL := FALSE;
    
    (* Test Outputs *)
    Test_Conveyor : BOOL;
    Test_ABB_Trig : BOOL;
    Test_AUBO_Trig : BOOL;
    Test_Error : BOOL;
    Test_Ready : BOOL;
    Test_Obj_Count : UINT;
    Test_Rej_Count : UINT;
    Test_Acc_Count : UINT;
    
    (* Test Sequence Counter *)
    Test_Step : INT := 0;
    Test_Timer : UINT := 0;
END_VAR

(* Call Function Block *)
Controller(
    S1 := Test_S1,
    S2 := Test_S2,
    S3 := Test_S3,
    S4 := Test_S4,
    ABB_Done := Test_ABB_Done,
    AUBO_Done := Test_AUBO_Done,
    Object_Quality := Test_Quality,
    Emergency_Stop := Test_Emergency,
    Reset := Test_Reset,
    Conveyor_Run => Test_Conveyor,
    ABB_Trigger => Test_ABB_Trig,
    AUBO_Trigger => Test_AUBO_Trig,
    Error_Flag => Test_Error,
    System_Ready => Test_Ready,
    Object_Counter => Test_Obj_Count,
    Reject_Counter => Test_Rej_Count,
    Accept_Counter => Test_Acc_Count
);

(* Simple Test Sequence *)
Test_Timer := Test_Timer + 1;

CASE Test_Step OF
    0: (* Initial state *)
        IF Test_Timer >= 10 THEN
            Test_S1 := TRUE;  (* Simulate object at S1 *)
            Test_Step := 1;
            Test_Timer := 0;
        END_IF;
        
    1: (* Wait for S2 *)
        IF Test_Conveyor THEN
            Test_S1 := FALSE;
            Test_S2 := TRUE;
            Test_Step := 2;
            Test_Timer := 0;
        END_IF;
        
    2: (* Wait for ABB *)
        IF Test_ABB_Trig THEN
            Test_Step := 3;
            Test_Timer := 0;
        END_IF;
        
    3: (* Simulate ABB complete *)
        IF Test_Timer >= 20 THEN
            Test_ABB_Done := TRUE;
            Test_Step := 4;
            Test_Timer := 0;
        END_IF;
        
    4: (* Place at S3 *)
        IF Test_Timer >= 5 THEN
            Test_ABB_Done := FALSE;
            Test_S2 := FALSE;
            Test_S3 := TRUE;
            Test_Step := 5;
            Test_Timer := 0;
        END_IF;
        
    5: (* Wait for delay and S4 *)
        IF Test_Timer >= 35 THEN
            Test_S3 := FALSE;
            Test_S4 := TRUE;
            Test_Step := 6;
            Test_Timer := 0;
        END_IF;
        
    6: (* Wait for AUBO *)
        IF Test_AUBO_Trig THEN
            Test_Step := 7;
            Test_Timer := 0;
        END_IF;
        
    7: (* Simulate AUBO complete *)
        IF Test_Timer >= 20 THEN
            Test_AUBO_Done := TRUE;
            Test_Step := 8;
            Test_Timer := 0;
        END_IF;
        
    8: (* Clear S4 and reset *)
        IF Test_Timer >= 5 THEN
            Test_AUBO_Done := FALSE;
            Test_S4 := FALSE;
            Test_Step := 0;
            Test_Timer := 0;
        END_IF;
END_CASE;

END_PROGRAM
