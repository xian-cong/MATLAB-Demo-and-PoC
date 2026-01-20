(*
 *
 * File: SimpleConveyorSystem.st
 *
 * IEC 61131-3 Structured Text (ST) code generated for subsystem "SimpleConveyorSystem/ConveyorLogic"
 *
 * Model name                      : SimpleConveyorSystem
 * Model version                   : 1.6
 * Model creator                   : KoayXianCong
 * Model last modified by          : KoayXianCong
 * Model last modified on          : Fri Dec 19 16:00:26 2025
 * Model sample time               : 0s
 * Subsystem name                  : SimpleConveyorSystem/ConveyorLogic
 * Subsystem sample time           : 0.1s
 * Simulink PLC Coder version      : 25.2 (R2025b) 28-Jul-2025
 * Target Plugin version           : 1.20
 * ST code generated on            : Fri Dec 19 16:04:11 2025
 *
 * Target IDE selection            : MITSUBISHI ELECTRIC MELSOFT GX Works3
 * Test Bench included             : Yes
 *
 *)
PROGRAM PLC_PRG
VAR
    tbInstance: TestBench;
END_VAR
    tbInstance();
END_PROGRAM
FUNCTION_BLOCK ConveyorLogic
VAR_INPUT
    ssMethodType: INT;
    b_s1: BOOL;
    b_s2: BOOL;
    robot_done: BOOL;
END_VAR
VAR_OUTPUT
    conveyor_on: BOOL;
    robot_trigger: BOOL;
END_VAR
VAR
    is_c3_ConveyorLogic: UINT;
    is_active_c3_ConveyorLogic: UINT;
END_VAR
VAR_TEMP
    temp1: INT;
END_VAR
CASE ssMethodType OF
    0: 
        (* SystemInitialize for Chart: '<Root>/ConveyorLogic' incorporates:
         *  Outport: '<Root>/conveyor_on'
         *  Outport: '<Root>/robot_trigger' *)
        conveyor_on := FALSE;
        robot_trigger := FALSE;
        is_active_c3_ConveyorLogic := 0;
        is_c3_ConveyorLogic := 0;
    1: 
        (* Chart: '<Root>/ConveyorLogic' incorporates:
         *  Outport: '<Root>/conveyor_on'
         *  Outport: '<Root>/robot_trigger' *)
        (* Gateway: ConveyorLogic *)
        (* During: ConveyorLogic *)
        IF is_active_c3_ConveyorLogic = 0 THEN 
            (* Entry: ConveyorLogic *)
            is_active_c3_ConveyorLogic := 1;
            (* Entry Internal: ConveyorLogic *)
            (* Transition: '<S1>:9' *)
            is_c3_ConveyorLogic := 1;
            (* Entry 'IDLE': '<S1>:6' *)
            (* '<S1>:6:2' conveyor_on = false; *)
            conveyor_on := FALSE;
            (* '<S1>:6:2' robot_trigger = false; *)
            robot_trigger := FALSE;
        ELSE 
            temp1 := WORD_TO_INT(is_c3_ConveyorLogic);
            CASE temp1 OF
                1: 
                    robot_trigger := FALSE;
                    (* During 'IDLE': '<S1>:6' *)
                    (* '<S1>:10:1' sf_internal_predicateOutput = 0 | (s1 && ~s2); *)
                    IF b_s1 AND ( NOT b_s2) THEN 
                        (* Transition: '<S1>:10' *)
                        is_c3_ConveyorLogic := 2;
                    END_IF;
                2: 
                    (* During 'MOVING': '<S1>:7' *)
                    (* '<S1>:11:1' sf_internal_predicateOutput = 0 | (s2); *)
                    IF b_s2 THEN 
                        (* Transition: '<S1>:11' *)
                        is_c3_ConveyorLogic := 3;
                        (* Entry 'ROBOT_WORKING': '<S1>:8' *)
                        (* '<S1>:8:2' conveyor_on = false; *)
                        conveyor_on := FALSE;
                        (* '<S1>:8:2' robot_trigger = true; *)
                        robot_trigger := TRUE;
                    ELSE 
                        (* '<S1>:7:2' conveyor_on = true; *)
                        conveyor_on := TRUE;
                    END_IF;
                ELSE
                    robot_trigger := TRUE;
                    (* During 'ROBOT_WORKING': '<S1>:8' *)
                    (* '<S1>:12:1' sf_internal_predicateOutput = 0 | (robot_done && ~s2); *)
                    IF robot_done AND ( NOT b_s2) THEN 
                        (* Transition: '<S1>:12' *)
                        is_c3_ConveyorLogic := 1;
                        (* Entry 'IDLE': '<S1>:6' *)
                        (* '<S1>:6:2' conveyor_on = false; *)
                        conveyor_on := FALSE;
                        (* '<S1>:6:2' robot_trigger = false; *)
                        robot_trigger := FALSE;
                    ELSE 
                        (* '<S1>:8:3' conveyor_on = false; *)
                        conveyor_on := FALSE;
                    END_IF;
            END_CASE;
        END_IF;
        (* End of Chart: '<Root>/ConveyorLogic' *)
END_CASE;
END_FUNCTION_BLOCK
FUNCTION_BLOCK TestBench
VAR_OUTPUT
    testVerify: BOOL := TRUE;
    testCycleNum: DINT;
END_VAR
VAR
    tb_s1: ARRAY [0..30] OF BOOL;
    cycle_s1: BOOL;
    tb_s2: ARRAY [0..30] OF BOOL;
    cycle_s2: BOOL;
    tb_robot_done: ARRAY [0..30] OF BOOL;
    cycle_robot_done: BOOL;
    tb_conveyor_on: ARRAY [0..30] OF BOOL;
    cycle_conveyor_on: BOOL;
    out_conveyor_on: BOOL;
    tb_robot_trigger: ARRAY [0..30] OF BOOL;
    cycle_robot_trigger: BOOL;
    out_robot_trigger: BOOL;
    need_init: BOOL := TRUE;
    i0_ConveyorLogic: ConveyorLogic;
END_VAR
IF need_init THEN 
    tb_s1[0] := FALSE;
    tb_s1[1] := FALSE;
    tb_s1[2] := FALSE;
    tb_s1[3] := FALSE;
    tb_s1[4] := FALSE;
    tb_s1[5] := FALSE;
    tb_s1[6] := FALSE;
    tb_s1[7] := FALSE;
    tb_s1[8] := FALSE;
    tb_s1[9] := FALSE;
    tb_s1[10] := FALSE;
    tb_s1[11] := FALSE;
    tb_s1[12] := FALSE;
    tb_s1[13] := FALSE;
    tb_s1[14] := FALSE;
    tb_s1[15] := FALSE;
    tb_s1[16] := FALSE;
    tb_s1[17] := FALSE;
    tb_s1[18] := FALSE;
    tb_s1[19] := FALSE;
    tb_s1[20] := FALSE;
    tb_s1[21] := FALSE;
    tb_s1[22] := FALSE;
    tb_s1[23] := FALSE;
    tb_s1[24] := FALSE;
    tb_s1[25] := FALSE;
    tb_s1[26] := FALSE;
    tb_s1[27] := FALSE;
    tb_s1[28] := FALSE;
    tb_s1[29] := FALSE;
    tb_s1[30] := FALSE;
    tb_s2[0] := FALSE;
    tb_s2[1] := FALSE;
    tb_s2[2] := FALSE;
    tb_s2[3] := FALSE;
    tb_s2[4] := FALSE;
    tb_s2[5] := FALSE;
    tb_s2[6] := FALSE;
    tb_s2[7] := FALSE;
    tb_s2[8] := FALSE;
    tb_s2[9] := FALSE;
    tb_s2[10] := FALSE;
    tb_s2[11] := FALSE;
    tb_s2[12] := FALSE;
    tb_s2[13] := FALSE;
    tb_s2[14] := FALSE;
    tb_s2[15] := FALSE;
    tb_s2[16] := FALSE;
    tb_s2[17] := FALSE;
    tb_s2[18] := FALSE;
    tb_s2[19] := FALSE;
    tb_s2[20] := FALSE;
    tb_s2[21] := FALSE;
    tb_s2[22] := FALSE;
    tb_s2[23] := FALSE;
    tb_s2[24] := FALSE;
    tb_s2[25] := FALSE;
    tb_s2[26] := FALSE;
    tb_s2[27] := FALSE;
    tb_s2[28] := FALSE;
    tb_s2[29] := FALSE;
    tb_s2[30] := FALSE;
    tb_robot_done[0] := TRUE;
    tb_robot_done[1] := TRUE;
    tb_robot_done[2] := TRUE;
    tb_robot_done[3] := TRUE;
    tb_robot_done[4] := TRUE;
    tb_robot_done[5] := TRUE;
    tb_robot_done[6] := TRUE;
    tb_robot_done[7] := TRUE;
    tb_robot_done[8] := TRUE;
    tb_robot_done[9] := TRUE;
    tb_robot_done[10] := TRUE;
    tb_robot_done[11] := TRUE;
    tb_robot_done[12] := TRUE;
    tb_robot_done[13] := TRUE;
    tb_robot_done[14] := TRUE;
    tb_robot_done[15] := TRUE;
    tb_robot_done[16] := TRUE;
    tb_robot_done[17] := TRUE;
    tb_robot_done[18] := TRUE;
    tb_robot_done[19] := TRUE;
    tb_robot_done[20] := TRUE;
    tb_robot_done[21] := TRUE;
    tb_robot_done[22] := TRUE;
    tb_robot_done[23] := TRUE;
    tb_robot_done[24] := TRUE;
    tb_robot_done[25] := TRUE;
    tb_robot_done[26] := TRUE;
    tb_robot_done[27] := TRUE;
    tb_robot_done[28] := TRUE;
    tb_robot_done[29] := TRUE;
    tb_robot_done[30] := TRUE;
    tb_conveyor_on[0] := FALSE;
    tb_conveyor_on[1] := FALSE;
    tb_conveyor_on[2] := FALSE;
    tb_conveyor_on[3] := FALSE;
    tb_conveyor_on[4] := FALSE;
    tb_conveyor_on[5] := FALSE;
    tb_conveyor_on[6] := FALSE;
    tb_conveyor_on[7] := FALSE;
    tb_conveyor_on[8] := FALSE;
    tb_conveyor_on[9] := FALSE;
    tb_conveyor_on[10] := FALSE;
    tb_conveyor_on[11] := FALSE;
    tb_conveyor_on[12] := FALSE;
    tb_conveyor_on[13] := FALSE;
    tb_conveyor_on[14] := FALSE;
    tb_conveyor_on[15] := FALSE;
    tb_conveyor_on[16] := FALSE;
    tb_conveyor_on[17] := FALSE;
    tb_conveyor_on[18] := FALSE;
    tb_conveyor_on[19] := FALSE;
    tb_conveyor_on[20] := FALSE;
    tb_conveyor_on[21] := FALSE;
    tb_conveyor_on[22] := FALSE;
    tb_conveyor_on[23] := FALSE;
    tb_conveyor_on[24] := FALSE;
    tb_conveyor_on[25] := FALSE;
    tb_conveyor_on[26] := FALSE;
    tb_conveyor_on[27] := FALSE;
    tb_conveyor_on[28] := FALSE;
    tb_conveyor_on[29] := FALSE;
    tb_conveyor_on[30] := FALSE;
    tb_robot_trigger[0] := FALSE;
    tb_robot_trigger[1] := FALSE;
    tb_robot_trigger[2] := FALSE;
    tb_robot_trigger[3] := FALSE;
    tb_robot_trigger[4] := FALSE;
    tb_robot_trigger[5] := FALSE;
    tb_robot_trigger[6] := FALSE;
    tb_robot_trigger[7] := FALSE;
    tb_robot_trigger[8] := FALSE;
    tb_robot_trigger[9] := FALSE;
    tb_robot_trigger[10] := FALSE;
    tb_robot_trigger[11] := FALSE;
    tb_robot_trigger[12] := FALSE;
    tb_robot_trigger[13] := FALSE;
    tb_robot_trigger[14] := FALSE;
    tb_robot_trigger[15] := FALSE;
    tb_robot_trigger[16] := FALSE;
    tb_robot_trigger[17] := FALSE;
    tb_robot_trigger[18] := FALSE;
    tb_robot_trigger[19] := FALSE;
    tb_robot_trigger[20] := FALSE;
    tb_robot_trigger[21] := FALSE;
    tb_robot_trigger[22] := FALSE;
    tb_robot_trigger[23] := FALSE;
    tb_robot_trigger[24] := FALSE;
    tb_robot_trigger[25] := FALSE;
    tb_robot_trigger[26] := FALSE;
    tb_robot_trigger[27] := FALSE;
    tb_robot_trigger[28] := FALSE;
    tb_robot_trigger[29] := FALSE;
    tb_robot_trigger[30] := FALSE;
    need_init := FALSE;
END_IF;
IF testVerify THEN 
    IF testCycleNum < 31 THEN 
        (* TEST CYCLE SETUP  *)
        cycle_s1 := tb_s1[testCycleNum];
        cycle_s2 := tb_s2[testCycleNum];
        cycle_robot_done := tb_robot_done[testCycleNum];
        cycle_conveyor_on := tb_conveyor_on[testCycleNum];
        cycle_robot_trigger := tb_robot_trigger[testCycleNum];
        IF testCycleNum = 0 THEN 
            (* INIT  *)
            i0_ConveyorLogic(ssMethodType := 0, b_s1 := cycle_s1, b_s2 := cycle_s2, robot_done := cycle_robot_done);
            out_conveyor_on := i0_ConveyorLogic.conveyor_on;
            out_robot_trigger := i0_ConveyorLogic.robot_trigger;
        END_IF;
        (* STEP  *)
        i0_ConveyorLogic(ssMethodType := 1, b_s1 := cycle_s1, b_s2 := cycle_s2, robot_done := cycle_robot_done);
        out_conveyor_on := i0_ConveyorLogic.conveyor_on;
        out_robot_trigger := i0_ConveyorLogic.robot_trigger;
        (* VERIFY  *)
        IF testVerify AND (out_conveyor_on <> cycle_conveyor_on) THEN 
            testVerify := FALSE;
        END_IF;
        IF testVerify AND (out_robot_trigger <> cycle_robot_trigger) THEN 
            testVerify := FALSE;
        END_IF;
        testCycleNum := testCycleNum + 1;
    END_IF;
END_IF;
END_FUNCTION_BLOCK
