# 🚀 Quick Start - Run the Website

The SatAns website requires both backend and frontend servers to run.

## For Windows Users

1. Double-click `start-website.bat`
2. Wait for both servers to start
3. Open http://localhost:8080/index.html in your browser

## For Linux/Mac Users

1. Open terminal in this directory
2. Run: `./start-website.sh`
3. Wait for both servers to start
4. Open http://localhost:8080/index.html in your browser

## Troubleshooting

**Sites refusing to connect?**
- Make sure both backend and frontend servers are running
- Check that no other applications are using ports 3000 or 8080
- On Linux/Mac, PostgreSQL must be installed and running

**Need more help?**
- See [RUN_WEBSITE.md](RUN_WEBSITE.md) for detailed instructions
- See [SETUP_GUIDE.md](SETUP_GUIDE.md) for complete setup guide

## What Each Script Does

- `start-website.bat/.sh` - Starts both servers automatically
- `start-backend.bat/.sh` - Starts only the backend (port 3000)
- `start-frontend.bat/.sh` - Starts only the frontend (port 8080)

## Stopping the Servers

Press `Ctrl+C` in each terminal window running a server, or close the terminal windows.
