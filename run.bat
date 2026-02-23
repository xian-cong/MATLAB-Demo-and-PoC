@echo off
:: ─────────────────────────────────────────────────────────────────────────────
:: run.bat – Build then run the Java ↔ MATLAB IPC demo
:: ─────────────────────────────────────────────────────────────────────────────
setlocal
cd /d "%~dp0"

echo ============================================================
echo  Java ^<^-^> MATLAB Persistent IPC Demo
echo ============================================================

:: Step 1 – build
call build.bat
if %ERRORLEVEL% neq 0 exit /b 1

echo.
echo [RUN] Launching MatlabController ...
echo       (MATLAB will open in a separate window on first run)
echo.

:: Step 2 – run
java MatlabController

echo.
echo [DONE] Demo finished.
pause
endlocal
