@echo off
setlocal enabledelayedexpansion
title Green Roof AI - Urban Sustainability Platform
echo ================================================================
echo   GREEN ROOF AI (SIH PROTOTYPE)
echo   Launching the local server + app in your Default Browser...
echo ================================================================
echo.
echo NOTE: This app now uses real AI (Gemini Vision) to verify that
echo uploaded photos are genuine rooftops, so it needs the local
echo server running (it can no longer be opened as a plain HTML file).
echo.

cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Node.js was not found on this computer.
    echo.
    echo This app needs Node.js installed to run its backend server.
    echo   1. Go to https://nodejs.org
    echo   2. Download and install the "LTS" version
    echo   3. Restart this computer if asked to
    echo   4. Double-click this launcher again
    echo.
    echo (See RUN_ON_ANY_LAPTOP.md for options that don't require
    echo installing anything on this specific laptop.)
    echo.
    pause
    exit /b 1
)

if not exist "server.js" (
    echo [ERROR] server.js was not found in this folder.
    echo Make sure this launcher is inside the extracted project folder.
    echo.
    pause
    exit /b 1
)

echo Checking and clearing port 8787 if needed...
for /f "tokens=5" %%p in ('netstat -aon ^| findstr ":8787" ^| findstr "LISTENING"') do (
    taskkill /F /PID %%p >nul 2>nul
)

echo Starting server on http://localhost:8787 ...
start "Green Roof AI Server" cmd /k "node server.js"

echo Waiting for the server to come up...
timeout /t 2 /nobreak >nul

start "" "http://localhost:8787"

echo.
echo A second window titled "Green Roof AI Server" is now running the
echo backend - keep it open while you use the app. Close it when done.
echo.
