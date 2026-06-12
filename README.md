# MATLAB AI Agent SDK with Local Ollama (Qwen)

> **Source repository:** [github.com/matlab/matlab-ai-agent-sdk](https://github.com/matlab/matlab-ai-agent-sdk)

A practical guide and working code reference for connecting a locally hosted LLM (Ollama `qwen3.6`) to MATLAB and Simulink. Covers basic text generation, custom function tool-calling, Simulink model execution, and common environment pitfalls.

---

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Connection Setup and Basic Inference](#2-connection-setup-and-basic-inference)
3. [Defining Custom Tool Functions](#3-defining-custom-tool-functions)
4. [Registering Tools and Executing a Tool Call](#4-registering-tools-and-executing-a-tool-call)
5. [Simulink Agent Integration](#5-simulink-agent-integration)
6. [Troubleshooting](#6-troubleshooting)

---

## 1. Prerequisites

| Requirement | Details |
|-------------|---------|
| **MATLAB** | R2024a or later, with Simulink installed |
| **Add-On** | *Large Language Models (LLMs) with MATLAB* — install via the MATLAB Add-On Explorer |
| **Ollama** | Running locally (defaults to `localhost:11434`) with the Qwen model pulled |

Pull and start the model:

```bash
ollama run qwen3.6
```

---

## 2. Connection Setup and Basic Inference

Establish a stateless connection to the local Ollama server and verify the model responds with domain-relevant output.

```matlab
% Initialize connection to the local Qwen model
agentChat = ollamaChat("qwen3.6");

% Send a test prompt
prompt = "Explain what a PID controller is in one sentence.";
[text, response] = generate(agentChat, prompt);
disp(text);
```

**Output:**

```
A PID controller is a feedback control mechanism that continuously minimizes
system error by adjusting an output based on proportional, integral, and
derivative terms calculated from the difference between a desired setpoint
and the actual process value.
```

---

## 3. Defining Custom Tool Functions

Custom tools let the LLM delegate exact computations to MATLAB functions instead of attempting to calculate them itself.

### Critical rule: functions must be saved as `.m` files

Functions **cannot** be declared directly in the MATLAB Command Window. Attempting to do so produces:

```
Error: Function definitions are not supported in this context.
```

Create a file named `addTwoNumbers.m` in your working directory:

```matlab
% addTwoNumbers.m
function result = addTwoNumbers(a, b)
    result = a + b;
end
```

---

## 4. Registering Tools and Executing a Tool Call

### Register the tool schema

Once `addTwoNumbers.m` is saved, describe it to the LLM using `openAIFunction` and bind it to the chat client:

```matlab
% Describe the tool and its inputs
mathTool = openAIFunction("addTwoNumbers", "Add two numbers exactly using MATLAB");
mathTool = addParameter(mathTool, "a", type="number");
mathTool = addParameter(mathTool, "b", type="number");

% Re-initialize the chat client with the tool attached
agentChat = ollamaChat("qwen3.6", tools=mathTool);
```

### Execute a tool call workflow

```matlab
% Ask a question that requires exact arithmetic
prompt = "What is 857394 plus 123456?";
[~, response] = generate(agentChat, prompt);

% Check whether the agent chose to call the tool
if isfield(response, "tool_calls")
    disp("The agent requested a tool call!");

    % Extract the arguments the LLM supplied
    arg1 = response.tool_calls.function.arguments.a;
    arg2 = response.tool_calls.function.arguments.b;

    % Execute the MATLAB function
    result = addTwoNumbers(arg1, arg2);
    fprintf("MATLAB calculated the exact result: %f\n", result);
else
    disp(response.content);
end
```

**Output:**

```
The agent requested a tool call!
MATLAB calculated the exact result: 980850.000000
```

---

## 5. Simulink Agent Integration

Extend the agent to load, configure, and run a Simulink model dynamically. This example uses the built-in Van der Pol oscillator (`vdp`).

### Step A — Unpack the shipping example

Built-in MATLAB/Simulink examples are stored as indexed assets and must be unpacked before they can be loaded programmatically:

```matlab
openExample("simulink_general/VanDerPolOscillatorExample")
```

Run this once before the agent workflow.

### Step B — Create the Simulink helper tool

Save the following as `runSimulinkModel.m` in your working directory (e.g. `C:\demo\matlab_ai_agent_sdk`):

```matlab
% runSimulinkModel.m
function statusMessage = runSimulinkModel(modelName, stopTime)
    try
        % Load the model if it is not already open
        if ~bdIsLoaded(modelName)
            load_system(modelName);
        end

        % Apply the requested stop time
        set_param(modelName, 'StopTime', num2str(stopTime));

        % Run the simulation
        sim(modelName);

        statusMessage = sprintf( ...
            "Successfully loaded, configured, and simulated '%s' for %d seconds.", ...
            modelName, stopTime);
    catch ME
        statusMessage = sprintf("Failed to run simulation. Error: %s", ME.message);
    end
end
```

### Step C — Register the tool and send the prompt

```matlab
% Add the directory containing your .m tools to the MATLAB path
addpath('C:\demo\matlab_ai_agent_sdk')

% Describe the Simulink tool to the LLM
simTool = openAIFunction("runSimulinkModel", ...
    "Load and run a specified Simulink model for a defined duration.");
simTool = addParameter(simTool, "modelName", type="string", ...
    description="The exact name of the Simulink model file");
simTool = addParameter(simTool, "stopTime",  type="number", ...
    description="The simulation stop time in seconds");

% Bind the tool to a new chat session
agentChat = ollamaChat("qwen3.6", tools=simTool);

% Ask the agent to run a simulation
prompt = "Can you run a simulation on the vdp model for 25 seconds?";
[~, response] = generate(agentChat, prompt);

if isfield(response, "tool_calls")
    disp("The agent decided to invoke Simulink...");

    targetModel = response.tool_calls.function.arguments.modelName;
    duration    = response.tool_calls.function.arguments.stopTime;

    executionResult = runSimulinkModel(targetModel, duration);
    fprintf("System Output: %s\n", executionResult);
else
    disp(response.content);
end
```

**Output:**

```
The agent decided to invoke Simulink...
System Output: Successfully loaded, configured, and simulated 'vdp' for 25 seconds.
```

---

## 6. Troubleshooting

### Unable to find system or file 'vdp'

**Symptom:**

```
Failed to run simulation. Error: Unable to find system or file 'vdp'.
```

**Cause:** The built-in Simulink example has not been unpacked from its indexed asset store into a local file.

**Fix:** Run once before the agent loop:

```matlab
openExample("simulink_general/VanDerPolOscillatorExample")
```

---

### Custom tool function not found on the MATLAB path

**Symptom:**

```
'runSimulinkModel' is not found in the current folder or on the MATLAB path.
```

**Cause:** The `.m` helper files exist in a directory that is not on MATLAB's active search path for the current session.

**Fix:** Add the directory containing your tool files to the path:

```matlab
addpath('C:\demo\matlab_ai_agent_sdk')
```

To make this permanent across sessions, add the `addpath` call to your `startup.m` file, or use **Set Path** in the MATLAB toolbar.

---

### Function definition error in Command Window

**Symptom:**

```
Error: Function definitions are not supported in this context.
```

**Cause:** You tried to define a `function ... end` block directly in the Command Window.

**Fix:** Save the function as a standalone `.m` file (e.g. `addTwoNumbers.m`) and call it from the Command Window instead.

---

*Tested on MATLAB R2026a, Ollama 0.x, qwen3.6, Windows 11.*

---

## References

- [MATLAB AI Agent SDK — GitHub](https://github.com/matlab/matlab-ai-agent-sdk)
- [Large Language Models (LLMs) with MATLAB — MathWorks Add-On](https://www.mathworks.com/matlabcentral/fileexchange/163796-large-language-models-llms-with-matlab)
- [Ollama — Local LLM Runtime](https://ollama.com)
