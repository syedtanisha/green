@echo off
title Green Roof AI - Free up port 8787
echo ============================================
echo   Finding what is using port 8787...
echo ============================================
echo.

netstat -aon | findstr ":8787" | findstr "LISTENING"
echo.
echo The number in the LAST column above (e.g. 12345) is the Process ID (PID).
echo.

set /p PID="Type that PID number here and press Enter (or just press Enter to skip): "

if "%PID%"=="" (
    echo No PID entered. Nothing was closed.
    echo.
    pause
    exit /b 0
)

echo.
echo Stopping process %PID% ...
taskkill /PID %PID% /F

echo.
echo Done. Now try running start.bat or diagnose.bat again.
echo.
pause
