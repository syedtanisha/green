#!/usr/bin/env bash
cd "$(dirname "$0")"
echo "============================================"
echo "  Green Roof AI - starting local server"
echo "============================================"
echo

if ! command -v node >/dev/null 2>&1; then
  echo "[ERROR] Node.js was not found on this computer."
  echo
  echo "This app needs Node.js to run its backend server."
  echo "1. Go to https://nodejs.org"
  echo "2. Download and install the 'LTS' version"
  echo "3. Open a new terminal and run this script again"
  echo
  exit 1
fi

echo "Node.js found: $(node --version)"
echo

if [ ! -f "server.js" ]; then
  echo "[ERROR] server.js was not found in this folder."
  echo "Make sure start.sh is inside the extracted project folder,"
  echo "next to server.js, package.json and the public folder."
  exit 1
fi

if lsof -i :8787 -sTCP:LISTEN >/dev/null 2>&1; then
  echo "[NOTE] Port 8787 already looks like it's in use."
  echo "If http://localhost:8787 already works in your browser, you're good."
  echo "If not, stop the other process using port 8787 and run this again."
  exit 0
fi

echo "Starting server on http://localhost:8787 ..."
echo "Keep this terminal open while you use the app."
echo "Press Ctrl+C to stop the server."
echo
node server.js
