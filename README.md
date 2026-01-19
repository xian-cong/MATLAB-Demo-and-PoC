# C MEX S-function with S-function builder for Simulink Compiler

This POC showcase demo using Simulink Compiler with S function builder. Note that this is different to C MEX S-function created with handwritten S-function.

The model is optimized such that it can run infinitely by disabling logging and allocating dynamic memory.

Important folders & files:
- release -> contains the exe
- modelPOC.slx -> contains the model with S-function builder block
- server_simulator.m -> contains script that runs infinitely to update the input_data.csv
- app_with_tunable_params.mlapp -> contains App Designer
- input_data.csv -> contains 3 numeric data (NOTE: after building the exe app, the csv needs to be placed in the same directory with the exe)

Not so important folder:
- modelPOC_ert_rtw -> contains C code generated and built from S-function builder block

More info:
https://www.mathworks.com/help/simulink/sfg/example-of-a-basic-c-mex-s-function.html

Regarding the difference between MATLAB function block, S-function builder block and S-function block:
https://www.mathworks.com/help/simulink/ug/comparison-of-custom-block-functionality.html

TLDR:
C MEX S-function provide best flexibility to use callbacks and code gen (for both discrete and continuous) but difficult to write. 