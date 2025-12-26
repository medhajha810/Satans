#!/bin/bash

# Start Frontend Server Script for SatAns Website
# This script starts a simple HTTP server for the frontend

echo "======================================================"
echo "   Starting SatAns Frontend Server"
echo "======================================================"
echo ""

# Check if Python is installed
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
else
    echo "❌ Error: Python is not installed"
    echo "Please install Python first"
    exit 1
fi

echo "🚀 Starting Frontend Server on port 8080..."
echo ""
echo "Frontend will be available at:"
echo "  👉 http://localhost:8080/index.html"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

$PYTHON_CMD -m http.server 8080
