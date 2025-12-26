@echo off
REM Start Frontend Server Script for SatAns Website (Windows)
REM This script starts a simple HTTP server for the frontend

echo ======================================================
echo    Starting SatAns Frontend Server
echo ======================================================
echo.

REM Check if Python is installed
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    set PYTHON_CMD=python
) else (
    where python3 >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        set PYTHON_CMD=python3
    ) else (
        echo Error: Python is not installed
        echo Please install Python first
        pause
        exit /b 1
    )
)

echo Starting Frontend Server on port 8080...
echo.
echo Frontend will be available at:
echo   http://localhost:8080/index.html
echo.
echo Press Ctrl+C to stop the server
echo.

%PYTHON_CMD% -m http.server 8080
