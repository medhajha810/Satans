@echo off
REM Master Startup Script for SatAns Website (Windows)
REM This script starts both backend and frontend servers in separate windows

echo ======================================================
echo    Starting SatAns Website (Backend + Frontend)
echo ======================================================
echo.
echo This will start:
echo   - Backend server on http://localhost:3000
echo   - Frontend server on http://localhost:8080
echo.
echo Press any key to continue...
pause >nul

echo.
echo Opening Backend Server in new window...
start "SatAns Backend" cmd /k start-backend.bat

echo Waiting 3 seconds...
timeout /t 3 /nobreak >nul

echo Opening Frontend Server in new window...
start "SatAns Frontend" cmd /k start-frontend.bat

echo.
echo ======================================================
echo Servers are starting...
echo ======================================================
echo.
echo Backend:  http://localhost:3000
echo Frontend: http://localhost:8080/index.html
echo.
echo Close the server windows to stop them.
echo.
pause
