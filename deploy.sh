#!/bin/bash
set -e

echo "🚀 Starting OpenAlgo..."

# Install dependencies if not present
if ! command -v python3 &> /dev/null; then
    echo "Installing Python 3..."
    apt-get update -qq && apt-get install -y python3 python3-pip curl
fi

if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    pip install --break-system-packages uv
fi

# Set environment variable for uv
export UV_LINK_MODE=copy

# Run OpenAlgo in background
cd /root/openalgo
nohup uv run app.py > /root/openalgo/openalgo.log 2>&1 &

echo "OpenAlgo started in background. PID: $!"
echo "Logs: /root/openalgo/openalgo.log"
echo "Access at: http://127.0.0.1:5000"
