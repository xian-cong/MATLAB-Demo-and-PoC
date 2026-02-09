# Embedded Coder PIL Profiling POC

## Important files:
- mcb_pmsm_foc_sim_ori_pure_sim.slx -> contains original simulation
- mcb_pmsm_foc_sim_pil.slx -> modified ori version that contain pil block added
- pil_block_generated.slx
- C:\demo\CodeVerificationAndProfilingUsingPILTestingExample\Current_ert_rtw\html\ExecutionProfiling_eb2a150928b9aca0.html -> Code profiling report

## Hardware
- Download support packages for TI
- ori documentation works in: LAUNCHXL-F28379D
- tested and works in: Piccolo F28069M LaunchPad

## Steps to reproduce after cloning
1. Run this file:
<img width="1594" height="845" alt="image" src="https://github.com/user-attachments/assets/936abcd0-430a-4f7f-a192-2355bf9dd6e6" />
2. Open the Simulink model and run this:
<img width="1918" height="1017" alt="image" src="https://github.com/user-attachments/assets/e729a3b9-9634-4f67-8750-a51bcc4e86f9" />
3. View the result in execution profiling report (opens everytime you run)
<img width="1918" height="1017" alt="image" src="https://github.com/user-attachments/assets/7354d6d0-7b7f-4017-b239-6a4a8763fd27" /> </br>
<img width="1916" height="1019" alt="image" src="https://github.com/user-attachments/assets/27367de0-a275-42f2-bf56-cdfc2d4c137e" /> </br>
<img width="1917" height="1018" alt="image" src="https://github.com/user-attachments/assets/4ba41c3d-0b79-43e0-ac9b-1066fb911ce3" />

## Steps to save profiling data
```
out = sim("mcb_pmsm_foc_sim_pil","Profile","on");
profilingData = out.SimulationMetadata.TimingInfo.ProfilerData;
```

## More info
Follow the steps here:
https://www.mathworks.com/help/mcb/gs/code-verification-profiling-using-pil.html
