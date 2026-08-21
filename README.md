# Vessel Electrical Power System Verification

A configurable **Simulink** model of a hybrid vessel electrical power system, driven from
a **browser** through **MATLAB Web App Server**. Every major component is a **Variant
Subsystem**, so the end user selects which implementation is fitted, enters the vessel
particulars and operating profile, runs the simulation, and reads a **pass/fail
verification report** — without opening MATLAB or Simulink.

Built and verified on MATLAB **R2026a** Update 4.

---

## Screenshots

### The app in a browser, served by Web App Server

![The app running on MATLAB Web App Server](docs/img/webapp-running.png)

The surveyor selects the fitted variant of each component on the left and reads the
scored criteria on the right. This run is **diesel-electric + supercapacitor + 2
generator sets**, and every failure is specific and traceable: peak demand 6632 kW
against 3600 kW installed (capacity margin −84.2 %), a 4832 kW N-1 shortfall, no
spinning reserve at all, mean generator loading 122 % with a 184 % peak, and the
supercapacitor driven outside its state-of-charge limits. Fuel and carbon intensity come
out as warnings rather than failures, and cold ironing still passes.

### The Variant Subsystems in Simulink

![The GenSets Variant Subsystem and its three choices](docs/img/variant-subsystem.png)

`GenSets` holds three choices — `TwoUnits`, `ThreeUnits`, `FourUnits`. The app selects
one per run by writing a plain number into the model workspace. All choices are compiled
into the deployed archive, which is what makes run-time selection possible after
deployment.

### The app in App Designer

![The .mlapp open in App Designer Design View](docs/img/appdesigner-design-view.png)

The `.mlapp` opens, edits and saves in App Designer's Design View without losing its
code.

---

## Quick start

To run the app on the desktop, open MATLAB in the `app` folder and launch it — or
double-click `app\VesselCertApp.mlapp`:

```matlab
cd C:\demo\webapp_server\app
VesselCertApp
```

Press **Run verification**. There is no setup step: once started, the app puts its own
dependencies (`src`, `models`, `tools`) on the MATLAB path, so it works from a fresh
session and when launched from App Designer.

Running `vpcSetup` from the repo root first also works — it adds `app` to the path, after
which `VesselCertApp` resolves from anywhere.

To rebuild and package:

```matlab
vpcSetup                 % path, C compiler, code-generation cache
vpcBuildModel            % (re)generate models\vesselPowerCert.slx
vpcCompileWebApp         % -> dist\VesselCertApp.ctf          for Web App Server
vpcCompileStandalone('Installer',true)   % -> dist\standalone  desktop .exe + installer
```

Then copy `dist\VesselCertApp.ctf` into the Web App Server apps folder, or upload it from
the server's home page.

### Packaging from App Designer's Share menu instead

Add the model by hand under *Files required for the app to run* → **Add File** →
`models\vesselPowerCert.slx`. The model is referenced by name at run time, so no
dependency analysis can find it, and without it the app builds cleanly and then fails on
Run. `src\` is found automatically.

Two things to check before packaging that way:

- **Close the model in Simulink first.** Simulink will not reload a root model that has
  changed on disk, so a session holding an older copy packages that copy instead — and
  saving from it overwrites the current file.
- The build log should say `Successfully built the rapid accelerator target for model:
  vesselPowerCert`.

---

## How it works

```
app/VesselCertApp.mlapp     UI: collect inputs, display results
        |
src/vpcRunCertification.m   build the SimulationInput, run sim, derive metrics
        |                   -> src/vpcEvaluateCriteria.m   pass/fail rules
        |                   -> src/vpcBuildReport.m        HTML report
        v
models/vesselPowerCert.slx  the configurable plant model
```

Two deliberate separations:

**The model computes physics; MATLAB computes judgement.** The `.slx` produces time
series only. Every metric, threshold and verdict lives in `src/`. Re-pointing the tool at
a different rule set means editing `src/vpcEvaluateCriteria.m` and nothing else.

**The model is generated from a script.** `tools/vpcBuildModel.m` is the source of truth
and `models/vesselPowerCert.slx` is a build artifact, so the model is reviewable in a
diff and the constraints that deployment depends on are enforced in code.

### The Variant Subsystems

| Component | Choices |
|---|---|
| **Propulsion architecture** | Direct mechanical · Diesel-electric · Hybrid PTI/PTO |
| **Energy storage** | None · Li-ion battery · Supercapacitor |
| **Generator configuration** | 2 × sets · 3 × sets · 4 × sets |
| **Shore connection** | None · Cold ironing |

Signal chain:

```
speed + sea state -> shaft power -> [PropulsionArch] -> + hotel + DP thrusters
   -> [EnergyStorage] -> [ShorePower] -> [GenSets] -> fuel, emissions, loading
```

Shore power is applied **after** energy storage deliberately. The other way round, the
battery charges from the generators while alongside, which burns fuel in port and
quietly defeats cold ironing.

### The verification criteria

Eight rules, each reported as PASS / WARN / FAIL with the measured value, the
requirement, and a plain-language note:

| Rule | Checks |
|---|---|
| `CAP-01` | Installed generating capacity covers peak demand |
| `RED-01` | N-1: the largest set can trip without a shortfall |
| `RED-02` | Spinning reserve available to catch a load step |
| `GEN-01` | Generator loading stays inside its permitted band |
| `ESS-01` | Energy storage state of charge within limits |
| `EMI-01` | Zero emissions alongside (cold ironing) |
| `FUE-01` | Voyage fuel within budget |
| `EMI-02` | Carbon intensity within band, with an A–E rating |

Thresholds are calibrated against what this vessel and profile can actually achieve
(`tests/vpcSweep.m`), so a sound design passes and a poor one fails on a *specific*
rule rather than on everything at once:

| Configuration | Verdict |
|---|---|
| Hybrid PTI/PTO + Li-ion + cold ironing | **PASS** (8/8) — 19.01 t fuel, 32.60 g/t-nm |
| Diesel-electric + supercapacitor + 2 sets | **FAIL** — 5 failures, 2 warnings: 6632 kW peak against 3600 kW installed, 4832 kW N-1 shortfall, 0 % spinning reserve, 122 % mean loading, store outside its SOC band |
| Diesel-electric, no storage, no shore power, 3 sets | **FAIL** — capacity exceeded, no reserve, 25 % of the voyage outside the load band, 4.12 t burned in port |

The rule set is representative of a surveyor's check list. It is **not** a transcription
of any class society's notation, and the report states this.

### Modelling notes

**Energy storage is credited as spinning reserve, not as a fuel saver.** Modelled purely
as a peak shaver, the store barely changes fuel: the DP load swing straddles the 1↔2
generator boundary with both operating points near best SFOC, so shaving saves little and
round-trip losses cancel the rest. Real hybrid vessels buy storage mainly so the
dispatcher can run *fewer* sets at higher load, with the store catching load steps.
`RED-02` models that, and it is what makes the variant matter.

**DP mode draws real, fluctuating thruster power.** Station keeping is not a quiet
condition, and modelling it as one leaves the store with nothing to do.

---

## The .mlapp is round-trip safe

`app/VesselCertApp.mlapp` can be opened, edited and saved in App Designer without losing
its code. `app/source/VesselCertApp.m` is the generator source, kept off the MATLAB path
so only one `VesselCertApp` is ever resolvable.

This is worth understanding if you plan to generate `.mlapp` files programmatically. App
Designer stores an app as a component tree **plus a structured code model**, and that
code model holds the user's editable section and callbacks. A `.mlapp` produced by
writing only the class text leaves the model empty; App Designer then concludes the app
has no user code and, the first time it saves — which its Run button does — regenerates
the class from the component tree alone, silently discarding every hand-written
property, callback and method. The app still opens and still looks correct; its buttons
do nothing.

`vpcBuildApp` populates the code model as well as the class text:

| Field | Contents |
|---|---|
| `EditableSectionCode` | the app's properties and helper functions |
| `Callbacks` | `RunButtonPushed`, `ResetButtonPushed` |
| `StartupCallback` | `startupFcn` |

Two requirements follow, and they are why the source is laid out as it is. App Designer
locates the editable section as the text **between** the component properties block and
the callbacks block, so the block order must be:

```
classdef VesselCertApp < matlab.apps.AppBase
    properties (Access = public)      % components, incl. UIFigure   <- leading block
    ...user properties...                                            <- editable
    methods (Access = private)  ...helper functions...                <- editable
    methods (Access = private)  ...callbacks...                       <- trailing block
    methods (Access = private)  createComponents                      regenerated
    methods (Access = public)   constructor, delete                   regenerated
```

and callbacks must be named methods with an `(app, event)` signature wired through
`createCallbackFcn` — not anonymous handles, which App Designer cannot represent. Each
control must also carry its callback name as a char in the design-time tree, or App
Designer treats the callback as unassigned and leaves the control dead.

```matlab
vpcBuildApp              % regenerate the .mlapp from app\source\VesselCertApp.m
vpcCheckAppIntegrity     % verify an existing one
```

`tests/vpcMlappRoundTrip.m` checks three separate things: the app runs, App Designer's
reader accepts it, and the code model is populated and correctly wired.

---

## Limitations when compiling an app like this

Several of these decide the architecture rather than merely inconveniencing it. Sources:
[what may be compiled](https://www.mathworks.com/help/compiler/limitations-about-what-may-be-compiled.html) ·
[product support](https://www.mathworks.com/products/compiler/compiler_support.html) ·
[rapid accelerator dependencies](https://www.mathworks.com/help/slcompiler/ug/rapid-accelerator-dependencies.html).

### Products

- **Simulink alone is not deployable.** MATLAB Compiler does not support Simulink; you
  need **Simulink Compiler**, which deploys `sim`, `Simulink.SimulationInput` and
  `Simulink.SimulationOutput` plus **any block that supports code generation**.
- Simscape and Stateflow blocks deploy **if they support code generation**, so a
  Simscape Electrical fidelity variant is feasible but must be checked block by block.
- **Prebuilt MathWorks apps and UIs are never deployable** — only user-authored apps.
  Report Generator is command-line only for the same reason.
- Some products cannot be deployed at all, including Antenna Toolbox, Embedded Coder,
  HDL/GPU Coder, Simulink Design Verifier, Requirements Toolbox and System Composer.

### The build machine

- Simulink Compiler **builds a Rapid Accelerator target for every model**, so the build
  machine needs a **supported C compiler**. This project uses MinGW-w64, which
  `vpcSetup` locates and selects.
- The result is **platform-specific**: built on Windows, runs on Windows.
- The MATLAB Runtime on the server must **match the release** that built the archive.

### Inside the deployed app

- **No path changes.** `addpath` and `cd` are forbidden, and `which` does not search the
  current folder. Everything the app needs must be packaged and reached via `ctfroot`.
- **Anything referenced only by name is invisible to dependency analysis** — hence the
  model must be added to the package explicitly.
- **`setBlockParameter` is unavailable**; use `setVariable`, which is how this app
  pushes every value into the model.
- **Tuning `Simulink.LookupTable` objects is not supported** in Rapid Accelerator, and
  parameter values must be boolean, integer, single, double, fixed-point or enumerated.
- **Unsupported blocks and features** include Interpreted MATLAB Function blocks,
  non-inlined MATLAB or Fortran S-functions, protected model references, Scope blocks
  carrying nonvirtual buses, and the debugging utilities and Profiler. (Algebraic loops
  were also unsupported before R2026a.)
- **No file dialogs.** `uigetfile`/`uiputfile` have no meaning in a browser session,
  which is why the report exports through the browser's own print-to-PDF.
- A compiled component **cannot be run from inside MATLAB**; the executable has to be
  tested on its own.

### Additional constraints verified on this project

Not stated in the documentation above; each is written up with evidence in
`docs/DEPLOYMENT.md`:

- **`Simulink.VariantControl` is excluded from packaging** by the MATLAB Compiler
  licence, so deployed code may only push a plain number as a variant control.
- **Solver settings must be literal numbers.** `FixedStep` naming a workspace variable
  works on the desktop and makes *every* deployed run fail with a bare
  `Assertion failed` and no diagnostic.
- **The configuration space is frozen at compile time.** All variant choices must be
  compiled in, and anything structural — lookup-table sizes, port counts — cannot change
  afterwards. This is why the operating profile is fixed at 7 legs.
- **A stale model held in the packaging session is packaged instead of the file on
  disk**, because Simulink will not reload a changed root model.

The practical guidance that follows: enumerate the configuration space in advance.
Continuous parameters are free; structure is not.

---

## What is in here

| Path | Purpose |
|---|---|
| `models/vesselPowerCert.slx` | The Simulink model. Generated by script — edit the script, not the `.slx`. |
| `app/VesselCertApp.mlapp` | The app. Openable, editable and runnable in App Designer. |
| `app/source/VesselCertApp.m` | Generator source, off the path. Regenerate with `vpcBuildApp`. |
| `src/` | Runtime code — packaged into the `.ctf`. |
| `tools/` | Authoring and build code — desktop only, never packaged. |
| `tests/` | Smoke tests, sweeps and the deployment round-trip checks. |
| `build/` | Minimal standalone scripts, each reproducing one deployment constraint. |
| `dist/` | Build output — `VesselCertApp.ctf` for Web App Server, `standalone/` for the desktop `.exe`. |
| `vpcSetup.m` | Session setup — path, MinGW-w64 selection, code-generation cache. |
| `docs/DEPLOYMENT.md` | How to deploy this to Web App Server, and every constraint found doing it. |
| `docs/ARCHITECTURE.md` | Model structure, variant interfaces, and the rule set. |

`vpcCompileWebApp` regenerates the model and the `.mlapp` before packaging, verifies the
saved model is deployment-safe, and then builds the archive — so it cannot ship a stale
one.

---

## Known limitations

- The operating profile is fixed at **7 legs**. Leg count sets lookup-table sizes, which
  are structural and therefore frozen when the archive is compiled. The app validates
  this and explains it.
- The plant model is quasi-static energy and power flow in base Simulink, deliberately
  not a Simscape Electrical network. It answers fuel, emissions, loading and reserve
  questions and is fast and robust to deploy. It says nothing about harmonics, transient
  stability or fault current. A Simscape Electrical network could be added as a further
  fidelity choice of a Variant Subsystem.
- A run takes roughly **5 seconds** (32 h profile at a 60 s step, Rapid Accelerator).
  Each browser session gets its own MATLAB Runtime process, so size the server for
  concurrent users rather than for one.
