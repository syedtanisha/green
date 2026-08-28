@echo off
title Green Roof AI - Diagnostic Start
echo ============================================
echo   Green Roof AI - DIAGNOSTIC MODE
echo   This window will NOT close by itself.
echo ============================================
echo.
echo Step 1: Checking current folder...
echo Current folder is: %CD%
echo.
pause

echo.
echo Step 2: Switching to the folder this script is in...
cd /d "%~dp0"
echo Now in folder: %CD%
echo.
pause

echo.
echo Step 3: Listing files in this folder (you should see server.js, package.json, public)...
dir
echo.
pause

echo.
echo Step 4: Checking for Node.js...
where node
echo (If you see "INFO: could not find files" above, Node.js is NOT installed.)
echo.
pause

echo.
echo Step 5: Checking Node.js version...
node --version
echo.
pause

echo.
echo Step 6: Checking if server.js exists here...
if exist "server.js" (
    echo FOUND: server.js is here.
) else (
    echo MISSING: server.js was NOT found in this folder.
    echo This means start.bat is in the wrong folder, or the
    echo project did not extract correctly from the zip file.
)
echo.
pause

echo.
echo Step 7: Attempting to start the server now...
echo If this closes immediately, note the LAST message above it.
echo.
node server.js

echo.
echo ============================================
echo Step 8: The server process has stopped or failed.
echo Scroll up and read every message above carefully.
echo Screenshot this whole window and share it for help.
echo ============================================
pause
