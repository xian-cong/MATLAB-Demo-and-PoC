# Handwritten S-Function with DWork for Simulink Compiler

This POC showcase demo using Simulink Compiler with handwritten S function. Note that this is different to C MEX S-function created with S-function builder.

The model is optimized such that it can run infinitely by disabling logging and allocating dynamic memory.
This model also uses DWork. DWork vectors are blocks of memory that an S-function asks the Simulink® engine to allocate to each instance of the S-function in a model. If multiple instances of your S-function can occur in a model, your S-function must use DWork vectors instead of global or static memory to store instance-specific values of S-function variables.
This makes your block "reentrant" (you can use multiple copies of it in one model without them interfering with each other's timers/data) and more memory-efficient for long-term deployment.

## Compilation:
```
mex csv_reader_mex.c
```

## Important folders & files:
- release -> contains the exe
- csv_reader_mex.c -> contains the code to be used with S-function
- csv_reader_mex.mexw64 -> compiled c code
- modelPOC.slx -> contains the model with S-function block
- server_simulator.m -> contains script that runs infinitely to update the input_data.csv
- app_with_tunable_params.mlapp -> contains App Designer
- input_data.csv -> contains 3 numeric data (NOTE: after building the exe app, the csv needs to be placed in the same directory with the exe)

## Why is this more powerful?
| Feature            | S-Function Builder                                                           | Handwritten C-MEX                                                      |
| ------------------ | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Reentrancy         | Uses static variables. If you use 2 blocks, they share the same timer (Bad). | Uses DWork. Each block has its own independent timer and data (Good).  |
| Parameters         | Hard to pass complex strings/paths.                                          | Uses ssGetSFcnParam. You can change the filename from the block mask.  |
| Memory Leak Safety | Basic wrapper logic.                                                         | Strict control over mdlStart and mdlTerminate for clean infinite runs. |
| Code Generation    | Generates extra wrapper files.                                               | Compiles directly into the executable via mdlRTW if needed.            |

## Comparison between Level 1 and Level 2 S-Function:
| Feature           | Level 1 S-Function                                       | Level 2 S-Function                                            |
| ----------------- | -------------------------------------------------------- | ------------------------------------------------------------- |
| API Architecture  | Uses a flag argument in a single function (Switch-Case). | Uses distinct callback methods (mdlOutputs, mdlUpdate, etc.). |
| I/O Ports         | Restricted to 1 input and 1 output port only.            | Supports multiple input and output ports.                     |
| Data Types        | Only supports double.                                    | Supports all Simulink types (int, boolean, bus, etc.).        |
| Signal Dimensions | Limited to scalar or 1D vector signals.                  | Supports N-D signals, matrices, and frame-based data.         |
| Memory (DWork)    | No official support for DWork vectors.                   | Full support for DWork vectors, states, and PWork.            |
| Code Generation   | Limited support for code generation.                     | Fully optimized for code generation (required for .exe).      |
| Status            | Deprecated (Maintenance mode only).                      | Standard for all new development.                             |

## More info:
https://www.mathworks.com/help/simulink/sfg/example-of-a-basic-c-mex-s-function.html

More info regarding DWork Vector:
https://www.mathworks.com/help/simulink/sfg/about-dwork-vectors.html

Regarding the difference between MATLAB function block, S-function builder block and S-function block:
https://www.mathworks.com/help/simulink/ug/comparison-of-custom-block-functionality.html

TLDR:
C MEX S-function provide best flexibility to use callbacks and code gen (for both discrete and continuous) but difficult to write. 