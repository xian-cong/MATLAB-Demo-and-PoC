# Combined Callback and CSV Reading System

This project combines two functionalities:
1. The callback system with initialization, timing, and parameter management
2. Dynamic CSV data reading functionality

## Components

### Models
- `callback_demo_with_callbacks.slx` - Original model with callback functions
- `modelPOC.slx` - Model that reads from input_data.csv
- `model_with_matlab_function.slx` - New model with structure for MATLAB Function block

### Callback Files
- `callback_init.m` - Initializes parameters
- `callback_start.m` - Starts timing
- `callback_stop.m` - Stops timing and reports results
- `callback_preload.m` - Preloads model
- `callback_close.m` - Cleans up

### CSV Integration
- `csv_reader_counter.m` - MATLAB Function code for CSV reading with counter
- `input_data.csv` - Sample data file (contains: 1.5,1.8,1)

### Additional Files
- `MATLAB_FUNCTION_INSTRUCTIONS.md` - Instructions for adding MATLAB Function block to model

## How to Use

### Basic Usage
1. Run the original callback demo:
   ```matlab
   load_system('callback_demo_with_callbacks');
   sim('callback_demo_with_callbacks');
   ```

### CSV Integration
1. Update `input_data.csv` with new values externally
2. The system will read new values periodically
3. For the model with MATLAB Function block:
   - Open `model_with_matlab_function.slx`
   - Follow instructions in `MATLAB_FUNCTION_INSTRUCTIONS.md` to add the MATLAB Function block
   - Connect the blocks as described

### External CSV Updating Process
An external process should update `input_data.csv` every few seconds with new values in the format:
```
value1,value2,value3
```

For example:
```
2.0,3.5,1.2
```

## Key Features

- Callbacks execute at appropriate times (init, start, stop, close)
- CSV data is read dynamically during simulation
- Timing information is captured and reported
- Parameters from callbacks are available to the model
- CSV values can be accessed during simulation

## Deployment

When packaging with the Simulink Compiler:
1. Include all .m files
2. Include all .slx models
3. Include input_data.csv (as a required file)
4. The system will work in standalone executables

## Notes

- The counter interval in the CSV reading is set to 50 counter steps for testing (equivalent to ~5 seconds with 0.1s sample time)
- In production, this could be adjusted to a longer interval (e.g., 9000 steps = 15 minutes with 0.1s sample time)
- The CSV file should be in the same directory as the executable for standalone apps