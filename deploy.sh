#!/bin/bash
set -e

echo "🚀 Starting OpenAlgo deployment..."

# Install dependencies if not present
if ! command -v python3 &> /dev/null; then
    echo "Installing Python 3..."
    apt-get update -qq && apt-get install -y python3 python3-pip curl
fi

if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    pip install --break-system-packages uv
fi

if ! command -v gh &> /dev/null; then
    echo "Installing GitHub CLI..."
    apt-get install -y gh
fi

# Configure git if not set
if [ -z "$(git config --global user.name)" ]; then
    read -p "Enter git username: " GIT_USER
    read -p "Enter git email: " GIT_EMAIL
    git config --global user.name "$GIT_USER"
    git config --global user.email "$GIT_EMAIL"
fi

# Set environment variable for uv
export UV_LINK_MODE=copy

# Run OpenAlgo
echo "Starting OpenAlgo..."
uv run app.py
