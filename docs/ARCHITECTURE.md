# Architecture

## Layering

The demo is deliberately split so the deployment boundary is visible in the folder
structure:

```
app/VesselCertApp.mlapp     UI only: gather inputs, show results
        |
src/vpcRunCertification.m   orchestration: build SimulationInput, sim, metrics
        |                   -> src/vpcEvaluateCriteria.m   (pass/fail rules)
        |                   -> src/vpcBuildReport.m        (HTML report)
        v
models/vesselPowerCert.slx  physics: the configurable plant model
        ^
tools/vpcBuildModel.m       authors the .slx from script (desktop only)
```

Two decisions carry most of the weight:

**The model computes physics; MATLAB computes judgement.** The `.slx` produces time
series only. Every metric, threshold and verdict lives in `src/`. Re-pointing the
demo at a real class-society rule set means editing
`src/vpcEvaluateCriteria.m` and nothing else — no model changes, no recompile of the
plant.

**The model is generated, not hand-drawn.** `tools/vpcBuildModel.m` is the source of
truth; `models/vesselPowerCert.slx` is a build artifact. This keeps the model
reviewable in a diff and makes the deployment constraints enforceable in code rather
than remembered by whoever last opened Simulink.

## Model structure

```
vesselPowerCert
├── OperatingProfile        clock -> 1-D lookups (7 legs, 'Flat') -> V_kn, hotel, sea, mode
│   └── dpThrusters         DP load: mean + deterministic wave-group ripple
├── PropulsionDemand        cubic speed-power law with sea margin
├── PropulsionArch    [VAR] Mechanical | DieselElectric | HybridPTIPTO
├── LoadSum                 P_elec + hotel + DP thrusters
├── EnergyStorage     [VAR] NoStorage | LiIonBattery | Supercapacitor
├── ShorePower        [VAR] NoConnection | ColdIroning
└── GenSets           [VAR] TwoUnits | ThreeUnits | FourUnits
```

16 root outports are logged as the certification signals.

### Why the ordering is what it is

`EnergyStorage` sits **upstream** of `ShorePower`. The battery's charging demand is
therefore part of the load the shore connection covers. With the two reversed, the
battery charges from the generators while alongside — the model burned 1.62 t of
fuel in port with cold ironing supposedly active, and `EMI-01` failed for a reason
that was an artifact of block order rather than a property of the design.

### Variant choice internals

Each choice contains one MATLAB Function block implementing that component's
behaviour. Model-workspace parameters are declared as Stateflow parameter data
(`Scope = 'Parameter'`) so the generated code takes them as tunable parameters
instead of inlining constants.

Shared physics lives in ordinary functions so it is testable outside Simulink and
shared between choices:

- `src/vpcSfoc.m` — bowl-shaped specific fuel consumption; makes sustained low-load
  running expensive, which is what `GEN-01` polices
- `src/vpcGenDispatch.m` — fewest units that carry the load below the dispatch
  ceiling, equal load sharing
- `src/vpcEssStep.m` — peak shaving against a moving average, with SOC and power
  limits

## Interfaces

Variant Subsystem interfaces, which every choice must match exactly:

| Subsystem | In | Out |
|---|---|---|
| `PropulsionArch` | `P_prop_kW` | `P_elec_kW`, `P_ME_kW`, `fuelME_kgs` |
| `EnergyStorage` | `P_load_kW` | `P_afterEss_kW`, `P_ess_kW`, `SOC` |
| `ShorePower` | `P_afterEss_kW`, `mode` | `P_gen_kW`, `P_shore_kW` |
| `GenSets` | `P_gen_kW` | `nRun`, `loadFrac`, `fuelGen_kgs`, `capOnline_kW` |

## Solver

Fixed-step discrete, 60 s. The DP ripple periods (600 s and 1500 s) sit well above
the Nyquist limit of that step so the fluctuation is resolved rather than aliased —
worth noting, because the obvious choice of realistic thruster periods (tens of
seconds) would have aliased into nonsense at this step size.

The step is written into the model as a **literal number**, not as the name of a
workspace variable. A solver setting that names a variable works in desktop MATLAB and
makes every deployed simulation fail; `vpcCheckModelDeployable` asserts this against the
saved file on every build. See `DEPLOYMENT.md` section 0b.

## Extending it

**A new choice for an existing component.** Add a code block and a name to the
relevant `vpcAddVariantSubsystem` call in `tools/vpcBuildModel.m`, extend the
matching `Items` constant in the app, rebuild. The helper enforces the atomicity and
port-name rules that deployment depends on.

**A new component.** Add a `vpcAddVariantSubsystem` call, a variant control double in
the model workspace, wiring, and outports. Add the control to the `setVariable`
block in `src/vpcRunCertification.m`.

**A different rule set.** Edit `src/vpcEvaluateCriteria.m`. Each rule is one `rule()`
call returning id, title, status, measured, limit and detail.

**A higher-fidelity electrical model.** The natural extension is a Simscape
Electrical AC network as a further choice of a `PowerDistribution` Variant
Subsystem, giving fidelity variants alongside topology variants. Check the packaging
implications early: Simscape adds run-time libraries to the archive, and this demo's
"all choices compiled in" requirement applies to it too.
