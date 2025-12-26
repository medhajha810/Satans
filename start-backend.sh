#!/bin/bash

# Start Backend Server Script for SatAns Website
# This script starts the PostgreSQL database and Node.js backend server

set -e  # Exit on error

echo "======================================================"
echo "   Starting SatAns Backend Server"
echo "======================================================"
echo ""

# Check if PostgreSQL is installed
if ! command -v psql &> /dev/null; then
    echo "❌ Error: PostgreSQL is not installed"
    echo "Please install PostgreSQL first"
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Error: Node.js is not installed"
    echo "Please install Node.js first"
    exit 1
fi

# Start PostgreSQL if not running
echo "📦 Checking PostgreSQL service..."
if sudo service postgresql status | grep -q "inactive"; then
    echo "Starting PostgreSQL..."
    sudo service postgresql start
    sleep 2
fi

if sudo service postgresql status | grep -q "active"; then
    echo "✅ PostgreSQL is running"
else
    echo "❌ Failed to start PostgreSQL"
    exit 1
fi

# Check if database exists, create if not
echo ""
echo "📦 Checking database..."
DB_EXISTS=$(sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='satans_db'" 2>/dev/null || echo "0")

if [ "$DB_EXISTS" != "1" ]; then
    echo "Creating database satans_db..."
    sudo -u postgres psql -c "CREATE DATABASE satans_db;" 2>&1 | grep -v "already exists" || true
    echo "Importing database schema..."
    sudo -u postgres psql satans_db < database.sql 2>&1 | head -5
    echo "✅ Database created and schema imported"
else
    echo "✅ Database satans_db exists"
fi

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo ""
    echo "📦 Installing Node.js dependencies..."
    npm install
fi

# Start the backend server
echo ""
echo "======================================================"
echo "🚀 Starting Backend Server on port 3000..."
echo "======================================================"
echo ""
echo "Backend API will be available at: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

node server.js
