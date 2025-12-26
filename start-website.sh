#!/bin/bash

# Master Startup Script for SatAns Website
# This script starts both backend and frontend servers in separate terminals

echo "======================================================"
echo "   Starting SatAns Website (Backend + Frontend)"
echo "======================================================"
echo ""
echo "This will start:"
echo "  - Backend server on http://localhost:3000"
echo "  - Frontend server on http://localhost:8080"
echo ""

# Make scripts executable
chmod +x start-backend.sh start-frontend.sh

# Check if we're in a terminal that supports gnome-terminal or xterm
if command -v gnome-terminal &> /dev/null; then
    echo "Opening servers in separate terminal windows..."
    gnome-terminal -- bash -c "./start-backend.sh; exec bash"
    sleep 2
    gnome-terminal -- bash -c "./start-frontend.sh; exec bash"
    echo ""
    echo "✅ Servers started in separate windows"
    echo ""
    echo "Access the website at: http://localhost:8080/index.html"
    echo ""
elif command -v xterm &> /dev/null; then
    echo "Opening servers in separate terminal windows..."
    xterm -e "./start-backend.sh" &
    sleep 2
    xterm -e "./start-frontend.sh" &
    echo ""
    echo "✅ Servers started in separate windows"
    echo ""
    echo "Access the website at: http://localhost:8080/index.html"
    echo ""
else
    echo "⚠️  Could not detect terminal emulator for automatic startup"
    echo ""
    echo "Please run the following commands in separate terminals:"
    echo ""
    echo "Terminal 1 (Backend):"
    echo "  ./start-backend.sh"
    echo ""
    echo "Terminal 2 (Frontend):"
    echo "  ./start-frontend.sh"
    echo ""
    echo "Then access: http://localhost:8080/index.html"
fi
