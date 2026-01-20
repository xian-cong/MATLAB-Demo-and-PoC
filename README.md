# MATLAB Function for Simulink Compiler

This commit uses MATLAB function and time as a scheduler to update data from csv and update the exe app based on scheduled time.

This POC showcase demo using MATLAB function block. Note that there are number of limitation for this method.

The model is optimized such that it can run infinitely by disabling logging and allocating dynamic memory.

Important folders & files:
- release -> contains the exe
- modelPOC.slx -> contains the model with S-function builder block
- app_with_tunable_params.mlapp -> contains App Designer
- input_data.csv -> contains 3 numeric data (NOTE: after building the exe app, the csv needs to be placed in the same directory with the exe)

More info:
https://www.mathworks.com/help/simulink/sfg/example-of-a-basic-c-mex-s-function.html

Regarding the difference between MATLAB function block, S-function builder block and S-function block:
https://www.mathworks.com/help/simulink/ug/comparison-of-custom-block-functionality.html

TLDR:
MATLAB function allows you to model discreate state using persistent variables. It supports codegen, easy to use, but it does not support all types of callback.

