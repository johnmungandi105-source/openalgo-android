# OpenAlgo Setup Summary

## Environment
- **OS**: Debian GNU/Linux 13 (trixie)
- **Python**: 3.13.5
- **Working Directory**: /root/openalgo

## Issues Fixed

### 1. Missing Dependencies
- Installed Python 3, pip, and curl via apt
- Installed uv package manager

### 2. Package Version Conflicts
- Fixed numpy version constraint from `<2.5` to `<2.3` for pandas compatibility
- Set `UV_LINK_MODE=copy` to avoid hardlink issues

### 3. Git Authentication
- Installed GitHub CLI (gh)
- Configured git user: `john` / `johnmungandi105@gmail.com`
- Generated SSH keys (ed25519)
- Added SSH key to GitHub

## Final Setup
- Repository: https://github.com/johnmungandi105-source/openalgo-android
- Web App: http://127.0.0.1:5000
- WebSocket: ws://127.0.0.1:8765

## Commands Used
```bash
# Install dependencies
apt-get install python3 python3-pip curl gh

# Install uv
pip install --break-system-packages uv

# Run with copy mode
UV_LINK_MODE=copy uv run app.py

# Git setup
git config --global user.name "john"
git config --global user.email "johnmungandi105@gmail.com"
ssh-keygen -t ed25519 -C "johnmungandi105@gmail.com"
git push -u origin main
```
