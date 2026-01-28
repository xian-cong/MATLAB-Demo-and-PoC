# SoC Blockset DVBS2 ZCU111 Deployment

## Prerequisite
### Hardware
- AMD ZCU111 RFSoC

### Software
- Install SoC blockset support package in MATLAB
- Download MinGW-w64 C/C++ Compiler using Add-on Explorer
- Vivado 2024.1
- MATLAB R2025b

## Setup
```
hdlsetuptoolpath('ToolName','Xilinx Vivado','ToolPath',...'C:\Xilinx\Vivado\2024.1\bin\vivado.bat');
```

## Run
1. Open socdvbs2top
2. Configure, Build & Deploy
3. soc_dvbs2_top_sw will be generated automatically
4. Change Stop time to inf
5. Open soc_dvbs2_hostUDPReceive.slx
6. Change Stop time to inf
7. Run

## Result
Resource utilization: vivado_prj.xpr

## More info
https://www.mathworks.com/help/soc/ug/dvb-s2-receive-using-xilinx-rfsoc-device.html