# Simulink Compiler Callbacks with CSV Integration

This project demonstrates how to use Simulink Compiler with callback functions and dynamic CSV data integration. It includes three different models showcasing various approaches.

## Components

### Callback Files
- `callback_init.m` - Initializes simulation parameters (amplitude_param, frequency_param, gain_param)
- `callback_start.m` - Starts timing measurement and prints start message
- `callback_stop.m` - Stops timing measurement and prints elapsed time and results
- `callback_preload.m` - Preloads model and adds path to MATLAB environment
- `callback_close.m` - Cleans up workspace variables and prints cleanup message

### Models
- `callback_demo_with_callbacks.slx` - Pure callback demonstration model
- `combined_callback_csv_model_time.slx` - Time-based CSV reading model (recommended)
- `combined_callback_csv_model_counter.slx` - Counter-based CSV reading model (alternative)

### Data File
- `input_data.csv` - Sample CSV data file with three values (1.5, 1.8, 1.0)

## Callback Functions Details

### callback_preload.m
- Executes before the model loads
- Adds current directory to MATLAB path
- Prints "PreLoadFcn: Model is loading..."

### callback_init.m
- Executes when the model is initialized
- Sets up three parameters in the base workspace:
  - `amplitude_param = 5`
  - `frequency_param = 2*pi*1`
  - `gain_param = 0.8`
- Prints initialization messages with parameter values

### callback_start.m
- Executes when simulation starts
- Starts a timer using `tic` and stores handle in `timer_handle`
- Prints start time and "=== SIMULATION STARTING ==="

### callback_stop.m
- Executes when simulation stops
- Calculates elapsed time using `toc` with the stored timer handle
- Prints stop time, elapsed time, and any output signal statistics
- Shows "=== SIMULATION STOPPED ==="

### callback_close.m
- Executes when model closes
- Clears the parameter variables from workspace
- Prints "CloseFcn: Cleaning up..."

## Model Comparison

### 1. callback_demo_with_callbacks.slx (Pure Callbacks)
- **Purpose**: Demonstrates basic callback functionality
- **Features**:
  - Sine Wave → Gain → Scope signal path
  - Parameters from callbacks control Sine Wave amplitude/frequency and Gain value
  - Pure callback execution without external data
- **Best for**: Understanding callback mechanisms

### 2. combined_callback_csv_model_time.slx (Time-Based CSV Reading - RECOMMENDED)
- **Purpose**: Integrates CSV data reading with callbacks using simulation time
- **Features**:
  - Uses Clock block to provide simulation time as input
  - Updates CSV data every 5.0 seconds of simulation time
  - More accurate timing than counter-based approach
  - MATLAB Function block reads `input_data.csv` based on simulation time
- **Timing**: Updates every 5.0 seconds of simulation time
- **Best for**: Production deployments requiring precise timing

### 3. combined_callback_csv_model_counter.slx (Counter-Based CSV Reading)
- **Purpose**: Integrates CSV data reading with callbacks using counter
- **Features**:
  - Uses Counter block to provide incremental values
  - Updates CSV data every 50 counter steps (equivalent to 5.0 seconds with 0.1s step size)
  - MATLAB Function block reads `input_data.csv` based on counter value
- **Timing**: Updates every 50 counter steps (5.0 seconds with 0.1s step size)
- **Best for**: Educational purposes or when counter-based timing is preferred

## How to Use

### Basic Callback Demo
1. Run the pure callback model:
   ```matlab
   load_system('callback_demo_with_callbacks');
   sim('callback_demo_with_callbacks');
   ```

### Time-Based CSV Model (Recommended)
1. Ensure `input_data.csv` exists in the directory
2. Run the time-based model:
   ```matlab
   sim('combined_callback_csv_model_time');
   ```
3. Update `input_data.csv` externally to see real-time changes

### Counter-Based CSV Model
1. Ensure `input_data.csv` exists in the directory
2. Run the counter-based model:
   ```matlab
   sim('combined_callback_csv_model_counter');
   ```
3. Update `input_data.csv` externally to see real-time changes

### External CSV Updating Process
An external process should update `input_data.csv` with new values in the format:
```
value1,value2,value3
```

For example:
```
2.0,3.5,1.2
```

## Deployment with Simulink Compiler

When packaging with the Simulink Compiler, include these files:

### For Pure Callback Model:
- `callback_demo_with_callbacks.slx`
- All callback .m files (callback_init.m, callback_start.m, etc.)
- Your main application file

### For Time-Based CSV Model (Recommended):
- `combined_callback_csv_model_time.slx`
- All callback .m files
- `input_data.csv` (as a required file)
- Your main application file

### For Counter-Based CSV Model:
- `combined_callback_csv_model_counter.slx`
- All callback .m files
- `input_data.csv` (as a required file)
- Your main application file

## Key Features

- **Callbacks execute at appropriate times** (init, start, stop, close)
- **CSV data is read dynamically** during simulation
- **Timing information is captured** and reported
- **Parameters from callbacks** are available to the model
- **CSV values can be accessed** during simulation
- **All models work in standalone executables**

## Notes

- The time-based model (`combined_callback_csv_model_time.slx`) is recommended for production use
- Time-based updates are more accurate than counter-based approaches
- Update intervals can be modified in the MATLAB Function code
- The CSV file should be in the same directory as the executable for standalone apps
- All callback functions are designed to work with Simulink Compiler deployment

## Manual MATLAB Function Update Required

Due to limitations in automated MATLAB Function block configuration, you need to manually update the MATLAB Function blocks in both models:

### For combined_callback_csv_model_time.slx:
1. Open the model in Simulink
2. Double-click the "CSV Reader" MATLAB Function block
3. Replace the existing code with the content from `time_based_csv_function_fixed.m`
4. Save the model

### For combined_callback_csv_model_counter.slx:
1. Open the model in Simulink
2. Double-click the "CSV Reader" MATLAB Function block
3. Replace the existing code with the content from `counter_based_csv_function_fixed.m`
4. Save the model

After manual update, the CSV reading functionality will work properly during simulation.

## Notes

- The corrected MATLAB Function code avoids try/catch blocks which are not supported for code generation
- The code uses low-level file operations (fopen, fgets, fclose) for better compatibility
- The time-based model (`combined_callback_csv_model_time.slx`) is recommended for production use
- Time-based updates are more accurate than counter-based approaches
- Update intervals can be modified in the MATLAB Function code
- The CSV file should be in the same directory as the executable for standalone apps
- All callback functions are designed to work with Simulink Compiler deployment