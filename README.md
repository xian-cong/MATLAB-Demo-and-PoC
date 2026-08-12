# Claude Code + MATLAB MCP + Local Ollama Model — Setup Guide

This guide documents how to set up a machine so that **Claude Code** runs against a
**local Ollama model** (no Anthropic account sign-in required) while also having full
access to **MATLAB and Simulink tools via the MATLAB Agentic Toolkit's MCP server**.

Routing between Claude Code and the local model is handled by
**Claude Code Router (`ccr`)** — specifically `@musistudio/claude-code-router`, which
runs a local gateway that translates Claude Code's Anthropic-format API calls into
calls against an OpenAI-compatible backend (Ollama).

## Architecture

```
Claude Code (CLI)
      │  (Anthropic Messages API format)
      ▼
ccr core gateway  (127.0.0.1:3457, local only)
      │  (translates to OpenAI-compatible chat completions)
      ▼
Ollama  (127.0.0.1:11434)  →  local model (e.g. qwen3.6-cc-long:latest)

Claude Code (CLI)
      │  (MCP / stdio JSON-RPC)
      ▼
matlab-mcp-server.exe  →  MATLAB (R2021a+)
```

Claude Code talks to two independent things at once: the **model** (via ccr → Ollama)
and **tools** (via the MATLAB MCP server, spawned directly as a local subprocess —
no ccr involvement here).

---

## Prerequisites

| Component | Version | Notes |
|---|---|---|
| Windows | 10/11 x64 | This guide is Windows-specific (PowerShell commands) |
| MATLAB | R2021a or later | MCP server requires this minimum |
| Node.js | LTS | Required by both Claude Code and ccr |
| Claude Code CLI | latest | `npm install -g @anthropic-ai/claude-code` |
| Ollama | latest | For running local models |
| GPU (optional) | any | Large models will mostly run on CPU/RAM if VRAM is small (e.g. 8GB) — still works, just slower |

---

## 1. Install the MATLAB + Simulink Agentic Toolkits (MCP server + skills)

This is the piece that lets Claude Code call into MATLAB/Simulink directly. The
Simulink Agentic Toolkit ([matlab/simulink-agentic-toolkit](https://github.com/matlab/simulink-agentic-toolkit))
installs on top of / alongside the MATLAB one and shares the same MCP server —
its official installer sets up **both** in one pass.

### Recommended: automated installer (`setupAgenticToolkit`)

1. **Prerequisites**: MATLAB R2023a+ with Simulink, and one of the supported agents
   (Claude Code, GitHub Copilot, OpenAI Codex, Gemini CLI, Sourcegraph Amp).
2. Download `agenticToolkitInstaller.mltbx` from the
   [latest release](https://github.com/matlab/simulink-agentic-toolkit/releases).
3. Install it as a MATLAB add-on — either double-click it to open in Add-On Manager,
   or run programmatically in MATLAB:
   ```matlab
   matlab.addons.toolbox.installToolbox("agenticToolkitInstaller.mltbx")
   ```
4. In the MATLAB command window, run the setup function:
   ```matlab
   setupAgenticToolkit("install")
   ```
   This is interactive — when prompted for which AI coding agent to configure,
   **choose Claude Code**. It will:
   - Install the MATLAB MCP server binary
   - Configure the Claude Code connection (global or per-project — global is
     simplest and is what this guide assumes elsewhere)
   - Register both the MATLAB and Simulink skill sets
   - Write `~/.matlab/agentic-toolkits/config.json` (toolkits, MATLAB root, MCP
     server version, per-agent configuration)
5. Maintenance, if needed later:
   ```matlab
   setupAgenticToolkit("update")     % upgrade to latest
   setupAgenticToolkit("uninstall")  % remove
   ```

### Per-MATLAB-session initialization (Simulink toolkit only)

Unlike the MATLAB-only toolkit, the Simulink extension needs to be initialized
**inside each MATLAB session** before its tools are usable:

```matlab
addpath("~/.matlab/agentic-toolkits/simulink")
satk_initialize
```

If the MCP server isn't in its default location:
```matlab
satk_initialize(MCPServerPath="//server/share/bin/matlab-mcp-server")
```

To avoid doing this by hand every session, add it to `startup.m` (gate it on the
MATLAB version if you run multiple releases):
```matlab
if contains(version, 'R2026a')
    addpath("~/.matlab/agentic-toolkits/simulink")
    satk_initialize
end
```

Registering custom Simulink block libraries (one-time, optional):
```matlab
satk.Configuration.setCustomLibraries("C:\path\to\customLibs")
% satk.Configuration.clearConfig()   % to clear
```

Verify by opening a model and asking Claude Code about it:
```matlab
openExample('simulink_general/sldemo_househeatExample')
```
Then in Claude Code: `Describe the structure of the currently open model.`

### ⚠️ Gotcha: `model_edit` fails and Simscape blocks are "unavailable" on an auto-launched session

Symptom, observed directly from a recorded session: with `--matlab-session-mode=auto`
and no MATLAB already running, Claude Code auto-launched a fresh MATLAB instance to
build a Simulink model, and then hit two failures back to back:

- The specialized `model_edit` MCP tool didn't dispatch (plain `evaluate_matlab_code`
  calls kept working fine — only the Simulink-specific tools broke).
- Adding blocks from Simscape / Simscape Electrical failed, even though
  `detect_matlab_toolboxes` confirmed both are installed and licensed. Claude's own
  diagnosis in-session: *"Simscape library paths aren't loading in this constrained
  MATLAB session."*

**Root cause (same for both):** a session auto-launched by the MCP server is not the
same as a normal, fully-initialized MATLAB desktop session a human opens by hand.
Two initialization steps that normally happen implicitly hadn't run:

1. `satk_initialize` — this is what wires up the Simulink-specific MCP tools
   (`model_edit`, `model_read`, `model_overview`, etc.) on the MATLAB side. It's a
   **per-session** step. Since nobody is sitting at the command window when the MCP
   server spins up MATLAB unattended, it never got called — and the gated
   `if contains(version, 'R2026a')` snippet in `startup.m` (above) is opt-in, not a
   guarantee it fires on every launch path.
2. Simulink's library customization cache (what makes a library's blocks addable via
   `add_block`) is normally built during a full interactive startup. An
   automation-launched session can come up without that scan having run, so Simscape's
   toolbox files exist on disk but Simulink doesn't yet know its libraries exist for
   *this* session.

**Fix:** make both steps unconditional in `startup.m` so they run on every MATLAB
launch, regardless of how it started — not gated on a version check, and not left as
a manual step. On the machine running the MCP server, in PowerShell:

```powershell
$startupDir = "$env:USERPROFILE\Documents\MATLAB"
New-Item -ItemType Directory -Force -Path $startupDir | Out-Null
$startupFile = Join-Path $startupDir "startup.m"
$marker = "%% BEGIN matlab-agentic-toolkit auto-init"

$block = @"
$marker
try
    addpath(fullfile(getenv('USERPROFILE'), '.matlab', 'agentic-toolkits', 'simulink'));
    satk_initialize;
catch ME
    warning('satk_initialize failed: %s', ME.message);
end
try
    sl_refresh_customizations;  % rebuild the library browser cache so Simscape etc. are addable
catch ME
    warning('sl_refresh_customizations failed: %s', ME.message);
end
%% END matlab-agentic-toolkit auto-init
"@

if (-not (Test-Path $startupFile) -or -not (Select-String -Path $startupFile -Pattern [regex]::Escape($marker) -Quiet -ErrorAction SilentlyContinue)) {
    Add-Content -Path $startupFile -Value $block -Encoding utf8
    Write-Host "Added auto-init block to $startupFile"
} else {
    Write-Host "Auto-init block already present in $startupFile"
}

Get-Content $startupFile
```

Notes:
- `Documents\MATLAB` is MATLAB's default `userpath` on Windows — confirm yours by
  running `userpath` inside MATLAB itself if it's been customized.
- The script is idempotent (checks a marker comment before appending), so it's safe
  to re-run and won't duplicate the block or clobber any existing `startup.m` content.
- `sl_refresh_customizations` is the documented MATLAB function for forcing Simulink
  to rescan all `sl_customization.m` files and rebuild the library registry — the
  correct fix here, not a GUI workaround like manually opening the Library Browser.
- This directly targets the actual gap (session initialization) rather than falling
  back to hand-written `add_block`/`add_line` MATLAB script calls, which is what
  Claude Code did as a workaround in the recorded session.

### Alternative: fully manual installation

If you'd rather not use the `.mltbx` installer (e.g. no GUI access, or you want to
manage the MCP server registration yourself), you can do it by hand instead:

1. Download the MCP server binary for this platform from the
   [matlab-mcp-core-server releases](https://github.com/matlab/matlab-mcp-core-server/releases)
   (asset `matlab-mcp-server-windows-x64.exe` for Windows x64).
2. Place it at `~/.matlab/agentic-toolkits/bin/matlab-mcp-server.exe`
   (i.e. `C:\Users\<you>\.matlab\agentic-toolkits\bin\matlab-mcp-server.exe`).
3. Verify it runs:
   ```powershell
   & "$env:USERPROFILE\.matlab\agentic-toolkits\bin\matlab-mcp-server.exe" --version
   ```
4. Register it with Claude Code globally:
   ```powershell
   claude mcp add matlab --scope user -- `
     "$env:USERPROFILE\.matlab\agentic-toolkits\bin\matlab-mcp-server.exe" `
     --matlab-session-mode=auto `
     --extension-file="$env:USERPROFILE\.matlab\agentic-toolkits\simulink\tools\tools.json"
   ```
   (the `--extension-file` flag is what wires in the **Simulink** toolkit — omit it if
   you only want MATLAB tools, no Simulink; it points at the Simulink toolkit repo's
   `tools/tools.json`, which the automated installer would otherwise place for you.
   See the `--matlab-session-mode` gotcha below before picking a value other than
   `auto`.)
5. New user-scope MCP servers need a one-time interactive approval. Run:
   ```powershell
   claude
   ```
   and approve the `matlab` server when prompted (it'll otherwise sit as
   `⏸ Pending approval` in `claude mcp list` and silently not connect).
6. Register skills manually by symlinking the toolkit repo's skill folders into
   `~/.agents/skills/`.
7. Verify registration:
   ```powershell
   claude mcp list
   ```
   You should see:
   ```
   matlab: <path>\matlab-mcp-server.exe --matlab-session-mode=auto --extension-file=... - ✔ Connected
   ```

Either path (automated or manual) writes `~/.matlab/agentic-toolkits/config.json`,
which tracks MATLAB root, MCP server version, and which toolkits (`matlab`,
`simulink`) are enabled globally.

> **Note:** if migrating from an older manual/agent-driven setup, uninstall it first
> before running the automated installer — see the toolkit's
> `Migrate-from-Previous-Installation.md`.

### ⚠️ Gotcha: project-level `.mcp.json` overrides the global config

Claude Code checks for a **project-scoped** `<project-dir>\.mcp.json` file first. If
one exists and defines a `matlab` server entry, it **silently shadows** the working
global registration from step 4 — even if the project file is wrong.

We hit exactly this: a project had a `.mcp.json` that tried to launch
`matlab.exe -automation` directly as if MATLAB spoke the MCP protocol (it doesn't),
causing `/mcp` inside Claude Code to show `matlab · ✗ failed` with a generic
JSON-RPC error, even though the global config was correct and verified working.

**Fix:** if a project directory has its own `.mcp.json`, make sure its `matlab` entry
(if present at all) points at the actual `matlab-mcp-server.exe` binary with the same
args as the global config — not at `matlab.exe` itself. Simplest is to delete the
project-level file entirely and let the global config apply, unless you specifically
need per-project MCP overrides.

### ⚠️ Gotcha: `--matlab-session-mode=existing` doesn't auto-launch MATLAB

`matlab-mcp-server.exe --help` documents three values for `--matlab-session-mode`:

| Value | Behavior |
|---|---|
| `new` | Always starts a new MATLAB session |
| `existing` | Only attaches to an already-running, already-shared session — **never launches MATLAB itself** |
| `auto` (**default**, and the one you actually want) | Tries to attach to an existing session first; if none is found, starts a new one automatically |

If you ever explicitly set `existing` (e.g. copying an example config verbatim), asking
Claude Code to do something in MATLAB/Simulink when MATLAB isn't already open will
fail with something like *"MATLAB desktop needs to be open and running"* — it is not
a bug, it's just working as configured. Use `auto` (or omit the flag, since it's the
default) unless you specifically need to control this.

If you do want `existing` mode deliberately (e.g. attaching to a specific long-running
MATLAB session), you must manually run `shareMATLABSession()` inside that MATLAB
session before the MCP server can attach to it.

Related flags worth knowing:
- `--matlab-display-mode` — `desktop` (default, GUI visible) or `nodesktop` (headless,
  starts faster, no window to watch)
- `--matlab-root` — which MATLAB installation to use, if more than one is on the system
- `--initial-working-folder` — where MATLAB starts

---

## 2. Install Node.js, Claude Code, and Ollama

```powershell
# Node.js: install from nodejs.org or via winget
winget install OpenJS.NodeJS.LTS

# Claude Code CLI
npm install -g @anthropic-ai/claude-code
claude --version

# Ollama
winget install Ollama.Ollama
ollama --version
```

Pull whatever local model(s) you want to use, e.g.:
```powershell
ollama pull qwen3.6-cc
```
Models with a `-cc` suffix in this environment are tuned for Claude-Code-style
tool-calling — prefer those over the plain (non-`-cc`) variants when available.

---

## 3. Fix the model's output limit before using it with Claude Code

Check the model's defaults:
```powershell
ollama show <model>:latest
```

Two parameters matter:
- **`num_ctx`** — total context window (input + output). Usually fine by default.
- **`num_predict`** — max output tokens **per turn**. This is the one that bites:
  thinking-capable models spend part of this budget on internal reasoning tokens,
  so a small `num_predict` (e.g. the common default of 8192) causes responses to
  get cut off well before they're actually "long."

**Fix:** create a new model tag with `num_predict` unbounded and a larger context
window (don't overwrite the original — safer to revert if needed):

```powershell
ollama show <model>:latest --modelfile   # copy the FROM <blob-path> line from this output

@"
FROM <blob-path-from-above>
TEMPLATE {{ .Prompt }}
PARAMETER num_ctx 131072
PARAMETER num_predict -1
"@ | Set-Content -Path "$env:TEMP\model-long.Modelfile" -Encoding utf8

ollama create <model>-long:latest -f "$env:TEMP\model-long.Modelfile"
ollama show <model>-long:latest    # confirm num_ctx / num_predict took effect
```

Use `<model>-long:latest` (not the original tag) everywhere below.

---

## 4. Install and configure Claude Code Router (ccr)

```powershell
npm install -g @musistudio/claude-code-router
ccr --help
```

### Start the gateway + management UI

```powershell
ccr ui
```

This opens a browser UI (default `http://127.0.0.1:3458`) and starts the background
gateway service (default `http://127.0.0.1:3457`).

### ⚠️ Gotcha: stale gateway process blocks a clean restart

If you see **"Service failed to start — Core gateway exited with 3221225786"**
(Windows exit code `0xC000013A`, abnormal termination) in the UI, it usually means a
**stale gateway process from a previous session** is still holding the port. Fix:

```powershell
ccr stop
Get-Process | Where-Object {$_.ProcessName -match 'node'} | Select-Object Id, StartTime
Get-NetTCPConnection -LocalPort 3456,3457 -ErrorAction SilentlyContinue
```

Confirm no leftover `node` processes and both ports are free, then run `ccr ui` again.

### ⚠️ Gotcha: "502 fetch failed" in Claude Code means the ccr gateway isn't running

Symptom: Claude Code shows something like `502 fetch failed · Retrying in 3s · attempt
5/10` when you send a message. This looks like it could be an MCP/MATLAB problem, but
it isn't — `/mcp` can show `matlab` as connected just fine while this happens, because
this error is about the **model** connection, not tools. It means Claude Code can't
reach the ccr gateway it's configured to talk to.

Diagnose which link in the chain is actually broken:

```powershell
Write-Host "=== Ollama responsive? ==="
try { Invoke-RestMethod -Uri "http://localhost:11434/api/tags" -TimeoutSec 5 | Out-Null; Write-Host "OK" } catch { Write-Host "FAILED: $($_.Exception.Message)" }

Write-Host "=== Ollama loaded models (ps) ==="
ollama ps   # empty is fine if idle - Ollama unloads models after inactivity and reloads on next request

Write-Host "=== ccr gateway port 3457 ==="
Get-NetTCPConnection -LocalPort 3457 -ErrorAction SilentlyContinue   # empty = gateway is NOT listening - this is the problem

Write-Host "=== ccr processes ==="
Get-Process | Where-Object {$_.ProcessName -match 'node'} | Select-Object Id, ProcessName, StartTime
```

If Ollama responds fine but port 3457 comes back empty, the ccr **gateway** process
died (or never came back up) even though a leftover `node` process (e.g. the
management UI) may still be running. Same fix as the stale-gateway gotcha above:

```powershell
ccr stop
ccr ui
Get-NetTCPConnection -LocalPort 3457 -ErrorAction SilentlyContinue   # should now show LISTEN
```

Also confirm the UI doesn't show a "Service failed to start" banner this time. This
can recur any time the machine restarts or MATLAB/other work causes the ccr process
to get killed — `ccr` isn't installed as a Windows service here, so nothing brings the
gateway back up automatically after a reboot; it has to be started again by hand
(`ccr ui`) each time.

### Add Ollama as a provider

In the UI's **Providers** page: add a provider of type `openai_chat_completions`
(Ollama exposes an OpenAI-compatible endpoint) with:
- Base URL: `http://localhost:11434/v1`
- API key: any placeholder string (Ollama doesn't require auth) — e.g. `ollama`
- Models: list your Ollama model tag(s), e.g. `<model>-long:latest`

ccr auto-discovers models already pulled in Ollama once the provider is added, so
new tags (like the `-long` one from step 3) should appear automatically — refresh
the provider's model list if not.

For each model entry, double-check:
- **Context Window (Tokens)** field matches what you actually set via `num_ctx`
  (ccr defaults this to a guess like 32768 — update it to match, e.g. `131072`)
- **Web search** is **unchecked** unless the model can genuinely do it (a local
  Ollama model cannot)

### Create/edit the Claude Code profile

In **Agent Config** → edit (or add) the profile for agent = **Claude Code**:
- **Model Override**: `ollama/<model>-long:latest`
- **Small Fast Model**: same, or a lighter model if you have one
- Toggle the profile **on**

---

## 5. Launch Claude Code through the router

```powershell
ccr default-claude-code cli
```

(the profile id may vary — check `%APPDATA%\claude-code-router\bin\` for the
generated `ccr-claude-code-wrapper-<profile-id>.cmd` files if `default-claude-code`
doesn't match, or use the profile's **display name** in quotes instead, e.g.
`ccr "Claude Code" cli`)

You'll likely see a one-time warning that Claude Code doesn't recognize the custom
model name and is falling back to a 200k-token context assumption for auto-compact
accounting — harmless, just cosmetic bookkeeping.

---

## 6. Verify everything end-to-end

Inside the Claude Code session:

```
/mcp
```
Confirm `matlab` shows as connected, not failed.

```
Use the matlab MCP tool to check the installed MATLAB version.
```
Confirm it actually invokes the tool (rather than guessing from general knowledge)
and returns a real version string. Expect responses to be slow (multiple minutes)
if the model is running mostly on CPU — this is expected, not a bug.

---

## Summary of files/locations touched

| Purpose | Location |
|---|---|
| MATLAB MCP server binary | `%USERPROFILE%\.matlab\agentic-toolkits\bin\matlab-mcp-server.exe` |
| Toolkit state | `%USERPROFILE%\.matlab\agentic-toolkits\config.json` |
| Global Claude Code MCP config | `%USERPROFILE%\.claude.json` (`mcpServers.matlab`) |
| Project-level MCP override (if any) | `<project-dir>\.mcp.json` — **check this first if MCP tools mysteriously fail** |
| ccr gateway config | `%APPDATA%\claude-code-router\gateway.config.json` |
| ccr service state | `%APPDATA%\claude-code-router\service.json` |
| ccr generated launch wrappers | `%APPDATA%\claude-code-router\bin\ccr-*.cmd` |
| Ollama models | `ollama list` / `ollama show <model>` |
