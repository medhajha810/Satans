@echo off
REM Start Backend Server Script for SatAns Website (Windows)
REM This script starts the Node.js backend server

echo ======================================================
echo    Starting SatAns Backend Server
echo ======================================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Node.js is not installed
    echo Please install Node.js first
    pause
    exit /b 1
)

REM Check if node_modules exists
if not exist "node_modules\" (
    echo.
    echo Installing Node.js dependencies...
    call npm install
)

REM Start the backend server
echo.
echo ======================================================
echo Starting Backend Server on port 3000...
echo ======================================================
echo.
echo Backend API will be available at: http://localhost:3000
echo.
echo Press Ctrl+C to stop the server
echo.

node server.js
