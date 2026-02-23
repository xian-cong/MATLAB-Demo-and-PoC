@echo off
:: ─────────────────────────────────────────────────────────────────────────────
:: build.bat – Compile MatlabController.java
:: ─────────────────────────────────────────────────────────────────────────────
setlocal
cd /d "%~dp0"
echo [BUILD] Compiling MatlabController.java ...
javac MatlabController.java
if %ERRORLEVEL% neq 0 (
    echo [BUILD] FAILED. Make sure javac is on your PATH.
    pause
    exit /b 1
)
echo [BUILD] Success - MatlabController.class produced.
endlocal
