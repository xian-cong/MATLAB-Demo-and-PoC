# Simulink Stateflow PLC Coder for GX Works3

This POC showcase the capability of PLC Coder and auto code generation, which is successfully deployed into the hardware.

## Hardware
Mitsubishi FX5U PLC

## Other Info
Several configuration below is needed:
1. To implement timer and using 'after', Absolute-time temporal logic needs to be set to Target-independent Counter
2. From GX Works3, change need_init and testVerify to TRUE

## Important Files
- plc_coder.slx -> stateflow logic
- plc_coder_support.st -> PLC Code and Testbench