# VISUAL STEP-BY-STEP WORKAROUND GUIDE

## The Complete Process: From Callbacks to Deployable .exe

---

## BEFORE: Model with Callbacks (Your Current State)

```
┌─────────────────────────────────────────────────────────┐
│ Model Properties → Callbacks Tab                        │
├─────────────────────────────────────────────────────────┤
│                                                          │
│ PreLoadFcn:  [Code directly in model]                   │
│   fprintf('Loading...');                                │
│   addpath(pwd);                                         │
│                                                          │
│ InitFcn:     [Code directly in model]                   │
│   amplitude_param = 5;                                  │
│   frequency_param = 2*pi*1;                             │
│   gain_param = 0.8;                                     │
│                                                          │
│ StartFcn:    [Code directly in model]                   │
│   fprintf('Starting simulation...');                    │
│   start_time = tic;                                     │
│                                                          │
│ StopFcn:     [Code directly in model]                   │
│   fprintf('Final: %f', output_signal(end));             │
│   fprintf('Elapsed: %f', toc(start_time));              │
│                                                          │
│ CloseFcn:    [Code directly in model]                   │
│   clear amplitude_param;                                │
│                                                          │
└─────────────────────────────────────────────────────────┘

❌ PROBLEM: These callbacks are NOT packaged into .exe!
```

---

## STEP 1: Extract Callbacks to .m Files

### What You Do:

1. Open Model Properties (Ctrl+D)
2. Click "Callbacks" tab
3. For each populated callback:
   - Copy the code
   - Create a new .m file
   - Paste the code into a function

### Result: 5 New Files Created

```
callback_preload.m
├── function callback_preload()
│   └── [Code from PreLoadFcn]

callback_init.m
├── function callback_init()
│   └── [Code from InitFcn]

callback_start.m
├── function callback_start()
│   └── [Code from StartFcn]

callback_stop.m
├── function callback_stop()
│   └── [Code from StopFcn]

callback_close.m
├── function callback_close()
    └── [Code from CloseFcn]
```

---

## STEP 2: Update Model Callbacks

### What You Do:

Go back to Model Properties → Callbacks tab and REPLACE the code with function calls:

```
┌─────────────────────────────────────────────────────────┐
│ Model Properties → Callbacks Tab                        │
├─────────────────────────────────────────────────────────┤
│                                                          │
│ PreLoadFcn:  callback_preload();                        │
│                                                          │
│ InitFcn:     callback_init();                           │
│                                                          │
│ StartFcn:    callback_start();                          │
│                                                          │
│ StopFcn:     callback_stop();                           │
│                                                          │
│ CloseFcn:    callback_close();                          │
│                                                          │
└─────────────────────────────────────────────────────────┘

✓ NOW: Callbacks just call functions that WILL be packaged!
```

### Important Notes:

- Keep the callback fields populated (with function calls)
- The actual logic is now in the .m files
- These .m files CAN be packaged into .exe

---

## STEP 3: Test in MATLAB

Run the model to verify everything still works:

```matlab
% Load model
load_system('callback_demo_with_callbacks');

% Run simulation
sim('callback_demo_with_callbacks');

% Should see:
%   PreLoadFcn: Model is loading...
%   InitFcn: Initializing parameters...
%   === SIMULATION STARTING ===
%   === SIMULATION STOPPED ===
%   Final value: X.XXXX
```

If it works in MATLAB, it will work in the .exe!

---

## STEP 4: Package with Simulink Compiler

### Files to Include:

```
Your Compiler Project
├── callback_demo_with_callbacks.slx  ← The model
├── callback_preload.m                ← PreLoadFcn code
├── callback_init.m                   ← InitFcn code
├── callback_start.m                  ← StartFcn code
├── callback_stop.m                   ← StopFcn code
├── callback_close.m                  ← CloseFcn code
└── YourApp.mlapp                     ← Your GUI (if any)
```

### Compiler Steps:

```
1. Open Application Compiler
   Apps → Application Compiler

2. Set Application Type
   Type: Simulink Compiler

3. Add Main File
   Main file: YourApp.mlapp (or main script)

4. Add Additional Files
   Click "Add Files Required for Your Application"
   Add ALL callback_*.m files
   Add the .slx model file

5. Configure
   Name, version, icon, etc.

6. Package
   Click "Package" button
   Wait for compilation...

7. Result
   ✓ Standalone .exe created!
   ✓ All callbacks packaged!
```

---

## STEP 5: Deploy and Test

### Installation:

1. Copy .exe to target computer
2. Install MATLAB Runtime (if not installed)
3. Run the .exe

### What Happens:

```
User opens .exe
  ↓
App loads
  ↓
callback_preload() executes ✓
  ↓
Model loads
  ↓
callback_init() executes ✓
  ↓
User clicks "Run"
  ↓
callback_start() executes ✓
  ↓
Simulation runs ✓
  ↓
callback_stop() executes ✓
  ↓
Results displayed ✓
  ↓
User closes app
  ↓
callback_close() executes ✓
```

**Everything works exactly like in MATLAB!**

---

## COMPARISON: Before vs After

### ❌ BEFORE (Not Deployable):

```
Model Callbacks:
  InitFcn: amplitude = 5; frequency = 2*pi;

Packaging:
  [Model callbacks are ignored]

Deployed .exe:
  ERROR: Undefined variable 'amplitude'
  ❌ Simulation fails!
```

### ✅ AFTER (Deployable):

```
Model Callbacks:
  InitFcn: callback_init();

callback_init.m:
  function callback_init()
      amplitude = 5;
      frequency = 2*pi;
  end

Packaging:
  ✓ callback_init.m included
  ✓ Compiled into .exe

Deployed .exe:
  ✓ callback_init() executes
  ✓ Variables initialized
  ✓ Simulation runs!
```

---

## ALTERNATIVE: App Designer Approach (More Control)

Instead of relying on model callbacks at all, you can clear them and call functions directly from your app:

### Model Properties:
```
All callbacks: EMPTY
```

### App Designer Code:
```matlab
function RunButtonPushed(app, event)
    % Call functions directly (more control!)
    callback_init();     % Initialize
    callback_start();    % Start
    sim(app.modelName);  % Simulate
    callback_stop();     % Process results
end
```

**Benefits:**
- More explicit control flow
- Easier to debug
- Same deployment result

---

## Summary Checklist

- [ ] Extract callback code to .m files
- [ ] Update model callbacks to call .m functions
- [ ] Test in MATLAB (verify it works)
- [ ] Add all files to compiler project
- [ ] Package with Simulink Compiler
- [ ] Test deployed .exe
- [ ] Verify all callbacks execute correctly

---

## Files Provided

All the work is done for you! You have:

- ✓ `create_model_with_callbacks.m` - Creates model WITH callbacks
- ✓ `test_model_with_callbacks.m` - Tests in MATLAB
- ✓ `workaround_step_by_step.m` - Automated workaround
- ✓ `callback_preload.m` - PreLoadFcn as function
- ✓ `callback_init.m` - InitFcn as function
- ✓ `callback_start.m` - StartFcn as function
- ✓ `callback_stop.m` - StopFcn as function
- ✓ `callback_close.m` - CloseFcn as function

Just run `workaround_step_by_step.m` and everything will be set up for you!

---

## The Key Insight

**Model Callbacks = Text strings (not packaged)**  
**Function Calls = Executable code (packaged!)**

By moving callback logic into .m files and calling those functions from the callbacks, you get the best of both worlds:
- Callbacks still work in MATLAB (for convenience)
- Functions get packaged into .exe (for deployment)

**Problem solved!** 🎉
