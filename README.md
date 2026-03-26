# TI C2000 Hybrid Workflow Demo

**MATLAB R2025b · CCS v20.0 · LAUNCHXL-F28069M · C2000Ware 5.02**


## Environment

| Component | Version |
|---|---|
| MATLAB + Simulink | R2025b (25.2) |
| Embedded Coder | R2025b (25.2) |
| C2000 Microcontroller Blockset | R2025b (25.2) |
| Code Composer Studio | v20.0 (`C:\ti\ccs2001\ccs`) |
| C2000Ware | 5.02.00.00 (`C:\ti\c2000\C2000Ware_5_02_00_00`) |
| Eval Board | LAUNCHXL-F28069M (TI Piccolo F28069M LaunchPad) |
| Debug Probe | XDS100v2 (onboard, USB Micro-B) |


## Demo Model Structure

```
[ADC Block - C2806x HSP]  →  [Gain: x0.0008056]  →  [Scope]

[C Caller: Custom_GPIO_Toggle()]
```

| Block | Type | Purpose |
|---|---|---|
| ADC | C2806x HSP Block | Reads ADCINA0 (onboard potentiometer) |
| Gain | Simulink Math | Scales 12-bit ADC count to 0–3.3V |
| C Caller | Custom C Function | Toggles blue LED on GPIO34 — simulates unsupported peripheral (e.g. AES) |


## Custom Driver Files

### `custom_gpio.h`
```c
#ifndef CUSTOM_GPIO_H
#define CUSTOM_GPIO_H

void Custom_GPIO_Toggle(void);

#endif
```

### `custom_gpio.c`
```c
#ifdef _TMS320C28XX
  // Hardware build — use real TI device registers
  #include "F2806x_Device.h"

  void Custom_GPIO_Toggle(void)
  {
      GpioDataRegs.GPBTOGGLE.bit.GPIO34 = 1;
  }

#else
  // Simulation build — stub function
  #include <stdio.h>

  void Custom_GPIO_Toggle(void)
  {
      printf("Simulation: GPIO34 toggle called\n");
  }

#endif
```

> The `#ifdef _TMS320C28XX` guard allows the same file to compile in both Simulink simulation mode and hardware deployment without changes.


## Simulink Model Settings

### Hardware Implementation
- **Hardware board:** `TI Piccolo F28069M LaunchPad`
- **Build action:** `Build, Load and Run`
- **Linker command file:** `Auto`

### Solver
- **Type:** Fixed-step
- **Solver:** discrete (no continuous states)
- **Step size:** `1/10000` (10 kHz)

### Code Generation → Custom Code
- **Source files:** `C:\demo\custom_gpio.c`
- **Include directories:**
  ```
  C:\demo
  C:\ti\c2000\C2000Ware_5_02_00_00\device_support\f2806x\headers\include
  C:\ti\c2000\C2000Ware_5_02_00_00\device_support\f2806x\common\include
  ```

## Porting to Other Peripherals (e.g. AES)

The C Caller pattern used in this demo is the **universal template** for any peripheral not supported in the C2000 Blockset. For AES, only three things change:

### 1. `custom_aes.h`
```c
#ifndef CUSTOM_AES_H
#define CUSTOM_AES_H

void Custom_AES_Encrypt(uint16_t *data, uint16_t *key);

#endif
```

### 2. `custom_aes.c`
```c
#ifdef _TMS320C28XX
  #include "aes.h"   // from C2000Ware driverlib

  void Custom_AES_Encrypt(uint16_t *data, uint16_t *key)
  {
      AES_setKey(...);
      AES_performEncryption(...);
  }

#else
  #include <stdio.h>

  void Custom_AES_Encrypt(uint16_t *data, uint16_t *key)
  {
      printf("Simulation: AES encrypt called\n");
  }
#endif
```

### 3. C Caller Block
- Swap function name: `Custom_GPIO_Toggle` → `Custom_AES_Encrypt`
- Update header reference to `custom_aes.h`
- Add input/output ports to match the function signature

### Differences vs GPIO demo

| Item | GPIO (demo) | AES (real use) |
|---|---|---|
| Function inputs | None | Data buffer + key |
| C Caller ports | No ports needed | Input/output ports required |
| C2000Ware header | `F2806x_Device.h` | `aes.h` from driverlib |
| Simulation stub | Trivial printf | Consider a software AES stub for proper simulation testing |

> Everything else — model settings, linker strategy, build steps — stays exactly the same.


## Build & Deploy

1. Connect LAUNCHXL-F28069M via USB — green power LED should light up
2. Open CCS once to initialize the XDS100v2 FTDI driver
3. Open the model in MATLAB:
   ```matlab
   open_system('C:\demo\ccs_c_caller_block')
   ```
4. Verify Hardware board = `TI Piccolo F28069M LaunchPad`
5. Verify Custom Code paths are set correctly
6. Click **Deploy to Hardware** (or `Ctrl+B`)
7. Blue LED (GPIO34) blinks — demo is running ✅

> If build fails after changes, clean stale artifacts first:
> ```matlab
> rmdir('C:\demo\ccs_c_caller_block', 's')
> ```
