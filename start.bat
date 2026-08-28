@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
title Green Roof AI - Local Server
echo ============================================
echo   Green Roof AI - starting local server
echo ============================================
echo.

where node >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Node.js was not found on this computer.
    echo.
    echo This app needs Node.js to run its backend server locally.
    echo On THIS laptop, you have two choices:
    echo.
    echo   OPTION 1 - Install Node.js on this laptop
    echo   1. Go to https://nodejs.org
    echo   2. Download and install the "LTS" version
    echo   3. Restart this computer if asked to
    echo   4. Double-click start.bat again
    echo.
    echo   OPTION 2 - Skip installing anything
    echo   If you already deployed this project online (see
    echo   RUN_ON_ANY_LAPTOP.md in this folder), just open that
    echo   website link in this laptop's browser instead. No
    echo   install needed at all.
    echo.
    echo This window will stay open so you can read this message.
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%v in ('node --version') do set NODEVER=%%v
echo Node.js found: %NODEVER%
echo.

if not exist "server.js" (
    echo [ERROR] server.js was not found in this folder.
    echo Make sure start.bat is inside the extracted project folder,
    echo next to server.js, package.json and the public folder.
    echo.
    pause
    exit /b 1
)

echo Checking and clearing port 8787 if needed...
for /f "tokens=5" %%p in ('netstat -aon ^| findstr ":8787" ^| findstr "LISTENING"') do (
    echo Freeing port 8787 from previous process %%p ...
    taskkill /F /PID %%p >nul 2>nul
)

echo Starting Green Roof AI on http://localhost:8787 ...
echo Keep this window open while you use the app.
echo.
node server.js

echo.
echo [SERVER STOPPED] The server process exited.
echo If this happened right after starting, scroll up to read the
echo error message above. Common causes: another program using
echo port 8787, or a missing/corrupted server.js file.
echo.
pause
