# Deploying a Variant-Subsystem Simulink model to MATLAB Web App Server

This is the direct answer to the customer's question, with the reasoning that was
verified on this machine (MATLAB R2026a Update 4, Windows 11) rather than inferred
from documentation.

## Short answer

**Yes.** A configurable Simulink model whose major components are Variant
Subsystems can be deployed to MATLAB Web App Server and driven from a browser,
with the end user selecting variants and parameters at run time and never touching
MATLAB or Simulink.

There is one constraint that shapes the whole design, and it is not obvious:

> **Variant selection must be resolvable from a plain numeric value at model
> startup, with every choice already compiled into the archive.**

You cannot compile one variant and switch to a structurally different one later —
there is no compiler on the server. What you *can* do is compile all choices in and
select among them per run, which is what this demo does.

## What was actually verified here

| Step | Result |
|---|---|
| Runtime variant switching in MATLAB (`sim` per run, no rebuild) | works |
| Same, inside a **compiled** Simulink Compiler artifact | works |
| `compiler.build.webAppArchive` produces a `.ctf` for this app | works — `dist/VesselCertApp.ctf`, 0.61 MB |
| `.ctf` build with zero deployability warnings | achieved |
| Hosting the `.ctf` on Web App Server | **not verified — no Web App Server licence on this machine** |

The compiled-artifact check was done by building a standalone application from a
minimal probe model and running it: it switched variants correctly, in both
directions, repeatedly, with no compiler involved at run time. The probe sources
are kept in `build/probe*.m` as evidence.

Three candidate strategies were tested in that compiled artifact and **all three
worked**:

| Variant control | Activation time | Verdict |
|---|---|---|
| `Simulink.Parameter` (`ExportedGlobal`) | `startup` | works |
| plain `double` | `runtime` | works |
| plain `double` | `startup` | works — **chosen** (simplest) |

## The rules that make it work

### 0. The model must be added to the package by hand

The model is referenced by name — `mdl = 'vesselPowerCert'` — so **no dependency
analysis can find it**. It has to be listed explicitly, or the app compiles and runs
and then fails the moment you press Run, deep inside Simulink, as a bare:

```
Assertion failed.
```

which says nothing about the cause. `vpcCompileWebApp` and `vpcCompileStandalone`
both add it via `AdditionalFiles`. If you package from **App Designer > Share >
Standalone Desktop App** instead, add it yourself under *"Files required for the app
to run"*:

```
Add File ->  models\vesselPowerCert.slx
```

`src\*.m` is found automatically, because those are ordinary function calls that
dependency analysis follows. Only the model needs adding.

`vpcRunCertification` now checks for the model up front and raises
`vpc:modelNotPackaged` with those instructions, so a missing model explains itself
instead of surfacing as "Assertion failed".

### 0b. Solver settings must be literals, not workspace variable names

Setting the solver's **`FixedStep` to the name of a model-workspace variable**
(`set_param(mdl,'FixedStep','dt_s')`) breaks every deployed simulation of the model.
It works perfectly in desktop MATLAB — including through
`simulink.compiler.configureForDeployment` — and then, inside the MATLAB Runtime,
even a bare `sim()` with no overrides at all fails with:

```
Assertion failed.
```

No stack, no diagnostic, no mention of the solver. `CaptureErrors` does not help,
because it throws before returning a `SimulationOutput`.

The only warning you get is at build time, and it looks cosmetic:

```
Parameter 'FixedStep' of 'Configuration' is non-tunable but refers to
tunable variables (dt_s)
```

**Treat that warning as an error.** Use a literal (`'FixedStep','60'`). Keep the
variable in the model workspace if blocks need it — only the solver setting has to be
a literal. `vpcCheckModelDeployable` asserts this against the file **on disk**, and
runs automatically from `vpcBuildModel` and `vpcCompileWebApp`.

**Close the model before packaging.** Simulink will not reload a root model that has
changed on disk — it warns and keeps the old one:

```
The file containing block diagram 'vesselPowerCert' has been changed on disk since
it was loaded. Simulink is unable to reload it automatically because it is the root
model. Close it and reopen it manually.
```

A session in that state packages the **stale** model, and saving from it writes the
old version back over the rebuilt file — which is exactly how a fixed model silently
reverted here. Restart MATLAB (or `close_system('vesselPowerCert',0)`) before
rebuilding or packaging, and check the deployment log says
`Successfully built the rapid accelerator target`.

This was isolated by building four minimal models that each added one feature of the
real model (Variant Subsystem with `startup` activation, lookup table with workspace
breakpoints, MATLAB Function calling an external function, MATLAB Function with a
`persistent`) and running all four in one compiled artifact: **all four passed**,
which ruled out the obvious suspects and left the solver configuration.

### 1. Never construct `Simulink.VariantControl` in deployed code

This is the trap. The natural way to write it —

```matlab
in = in.setVariable('VAR_ESS', Simulink.VariantControl('Value',2, ...
                                'ActivationTime','startup'), 'Workspace', mdl);
```

— works perfectly in MATLAB and **fails in the deployed archive**:

```
Unable to resolve the name 'Simulink.VariantControl'.
'Simulink.VariantControl' was excluded from packaging for the MATLAB Runtime
environment according to the MATLAB Compiler license.
```

The class is licence-excluded from packaging. Deployed code may only push a plain
number:

```matlab
in = in.setVariable('VAR_ESS', 2, 'Workspace', mdl);   % works deployed
```

So the variant control variables live in the **model workspace as plain doubles**,
and the model resolves them at startup.

### 2. `VariantActivationTime = 'startup'`, and choices must be atomic

`startup` activation is what causes all choices to be compiled in and the active
one to be picked per simulation. It has a hard prerequisite:

```
To use 'Variant activation time' with ... for the Variant Subsystem block 'VS',
its child subsystems must be atomic.
```

Every choice therefore sets `TreatAsAtomicUnit = 'on'`. See
`tools/vpcAddVariantSubsystem.m`, which enforces this rather than trusting callers.

### 3. Every choice must expose the Variant Subsystem's own port names

The Variant Subsystem carries its own interface Inport/Outport blocks, and Simulink
checks that each choice matches them exactly:

```
The number or names of interface ports ... in the variant choice blocks must be
the same as those in the Variant Subsystem block.
```

### 4. App-editable numbers must be *tunable*

Anything the user changes between runs is a `Simulink.Parameter` with a non-`Auto`
storage class (`SimulinkGlobal` here), so it stays tunable in the Rapid Accelerator
target instead of being folded in as a constant.

One exception worth knowing: **do not** point the solver's `FixedStep` at a tunable
parameter. Simulink warns on every build (`'FixedStep' ... is non-tunable but
refers to tunable variables`). Step size is a plain double here, and is not
app-editable.

### 5. Structural quantities are frozen at compile time

Anything that changes the *shape* of the model cannot change after packaging. In
this demo the operating profile is driven by 1-D lookup tables whose breakpoint
vectors are 7 long, so the app validates that the profile still has exactly 7 legs
and explains why if it does not. Users edit leg *values*, not the leg *count*.

This is the main design constraint to communicate to the customer: enumerate the
configuration space in advance. Continuous parameters are free; structure is not.

### 6. A C compiler is needed — on the build machine

Simulink Compiler builds a **Rapid Accelerator target**, which requires a supported
C compiler. Without one the build dies early:

```
No supported compiler detected. A compiler is required by some simulation modes
and code generation workflows.
```

On this machine MinGW-w64 was installed as an add-on but invisible to MATLAB,
because `MW_MINGW64_LOC` was empty. `vpcSetup.m` locates it and selects it. Note
that `matlabshared.supportpkg.getSupportPackageRoot` and even `PROGRAMDATA` come
back empty when MATLAB is launched with a stripped environment, so the lookup tries
several roots.

The accelerator target is built **during packaging** and travels inside the
archive, so the server should not need a C compiler. Confirm this on your first
deploy, since it could not be verified here.

### 7. Guard desktop-only functions with `isdeployed`

`load_system` and `bdIsLoaded` do not exist in the MATLAB Runtime and the compiler
warns that they *"cause a runtime error if executed in the deployed
application"*. They are guarded, and the guarded calls are hidden from dependency
analysis with the documented pragma:

```matlab
if ~isdeployed
    %#exclude bdIsLoaded
    %#exclude load_system
    if ~bdIsLoaded(mdl); load_system(mdl); end
end
```

Keep the two kinds of code in separate folders so this stays obvious:

- `src/` — runtime code, packaged into the `.ctf`
- `tools/` — model authoring (`add_block`, `new_system`, `sfroot`), desktop only

Packaging `tools/` produced a wall of "not supported in the MATLAB Runtime"
warnings; separating them removed every one.

### 8. `simulink.compiler.configureForDeployment` is required

Applied to the `SimulationInput` when `isdeployed` is true.

### 9. No file dialogs in a browser session

`uigetfile`/`uiputfile` have no meaning in a browser. The report is exported
through the browser's own **print / save as PDF**, via a button inside the `uihtml`
report that is hidden by `@media print`. No server-side file handling at all.

### 10. Your `startup.m` gets bundled

The build warns that your MATLAB `startup.m` is included in deployed applications.
On this machine it belongs to the MathWorks Agentic Toolkit and modifies the path,
which is forbidden under MATLAB Compiler, so the probe executable printed:

```
Warning: Agentic toolkit initialization failed: Modifying the MATLAB path is not
supported by MATLAB Compiler.
```

Harmless here, but worth wrapping the body of your `startup.m` in `if ~isdeployed`
before shipping anything to a customer.

## Building the archive

```matlab
cd C:\demo\webapp_server
vpcSetup
vpcCompileWebApp        % -> dist\VesselCertApp.ctf
```

### 11. Generating a .mlapp requires writing App Designer's code model, not just code

`compiler.build.webAppArchive` accepts only a `.mlapp`. Writing one by setting
`MLAPPSerializer.MatlabCodeText` to the class source produces a file that runs and
compiles — but that stores only the class *text*, leaving App Designer's structured
code model empty. App Designer then concludes the app has no user code, and the moment
it **saves** the file (its Run button saves) it regenerates the class from the
component tree alone and silently discards every hand-written property, callback and
method. The app still opens and still looks right; its buttons do nothing.

To produce a `.mlapp` that survives App Designer, also set:

| Serializer property | Contents |
|---|---|
| `EditableSectionCode` | user properties and helper functions, as a cellstr of lines |
| `Callbacks` | array of `AppCallback` **objects** — see below |
| `StartupCallback` | one `AppCallback` for `startupFcn` |

**Read a real App Designer app before guessing at the format.** MATLAB ships around 50
of them under `matlabroot/toolbox`; a small clear one is

```
toolbox/matlab/datatools/importtool/matlab/server/+internal/+matlab/+importtool/addRuleDialog.mlapp
```

`FileReader(p).readAppDesignerData()` on it shows exactly what to produce, and settles
questions that are otherwise guesswork. Its format:

- `Callbacks` — a plain **struct array with only `Name` and `Code`**, where `Code` is a
  cell array of body lines. Bodies of 25 lines are perfectly normal, so callback length
  is not a constraint.
- `StartupCallback` — a struct with `Name` and `Code`.
- `EditableSectionCode` — a cell array of lines.

`startupFcn` goes in `StartupCallback` **only**. If it also appears in `Callbacks`, the
regenerated class declares it twice and App Designer reports *"'startupFcn' is already
defined as a method"*.

**Set each component's callback property to the callback NAME as a char before
serializing** — `app.RunButton.ButtonPushedFcn = 'RunButtonPushed'`. This is the single
most important step and the least obvious. App Designer stores callbacks on a
design-time component as the callback name; the handle returned by `createCallbackFcn`
closes over the app object, and saving it fails with

```
Warning: Unable to save App Designer app object.
         Save not supported for matlab.apps.AppBase objects.
```

so the value never round-trips. App Designer then sees no callback on the control,
drops the callback as an orphan, and the button does nothing when clicked while
everything else looks perfectly correct. **That warning appearing during your own
build is the diagnostic** — it disappears once the char is set. This affects only the
serialized design-time tree; running the app still wires real handles through
`createCallbackFcn` in `createComponents`.

`vpcCheckAppIntegrity` asserts that each control really holds its callback name as a
char in the saved tree, which is the check that would have caught this immediately.
Callback bodies here are kept to a line that delegates to a helper in the editable
section — App Designer's own convention, and tidier — but that is style, not a
requirement.

`appdesigner.internal.serialization.PlainTextCodeParser` derives all three from the
class text: construct it with the source as **one string scalar** containing newlines
(it indexes by absolute character position), then call `processUserChanges` and
`addCallbackCode`. See `tools/vpcBuildApp.m`.

It finds the editable section as the text between App Designer's two managed blocks,
per `getIdentifiersByAppType`: the "leading" block is the `properties` block holding
the property typed `matlab.ui.Figure`, and the "trailing" block is the callbacks
block. So the class must keep App Designer's block order, extend
`matlab.apps.AppBase`, and wire callbacks as named `(app, event)` methods via
`createCallbackFcn` — anonymous handles cannot be represented and are dropped.

All of this is undocumented internal API, verified on R2026a.
`tests/vpcMlappRoundTrip.m` checks the three bars that matter — it runs, App
Designer's reader accepts it, and the code model is populated — and `vpcBuildApp`
asserts the same on every build. If MathWorks changes these internals, that test
fails loudly rather than shipping a `.mlapp` that quietly loses its logic.

Do not run this from a folder containing `.slx`/`.slxc` artifacts — Simulink
refuses to start when the working folder can shadow the cache folder:

```
Current working folder ... contains simulation artifacts that can shadow
artifacts in the folder ... specified by 'CacheFolder'
```

`vpcSetup.m` points the cache at `.slcache/` for the same reason, which also avoids
a stale `slprj` from another release (that one is a hard error, not a warning).

## Deploying

1. Install **MATLAB Web App Server** and the **R2026a MATLAB Runtime** on the
   server. The release must match what the `.ctf` was built with.
2. The products the archive needs are listed in `dist/requiredMCRProducts.txt`
   (here: `35000 35002 35003 35010 35274`); the Runtime installer resolves them.
3. Copy `dist/VesselCertApp.ctf` into the server's apps folder, or upload it from
   the server home page.
4. The app appears in the browser app list.

## Performance

A run simulates a 32-hour profile at a 60 s step (1921 steps). In Rapid
Accelerator with the target already built, that is roughly **5 seconds**, which is
comfortable behind a progress dialog. Interpreted `normal` mode takes about 19 s,
so leave the mode as `rapid-accelerator`.

Per-user sessions each get their own MATLAB Runtime process, so size the server for
concurrent surveyors rather than for one.
