# How to Use deploy.sh

## What deploy.sh Does
- Installs Python 3, pip, curl if missing
- Installs uv package manager if missing
- Starts OpenAlgo in background
- Logs output to `/root/openalgo/openalgo.log`
- Auto-starts when you open a new shell (via .bashrc)

## Usage

### First Time Setup
```bash
cd /root/openalgo
./deploy.sh
```

### Starting OpenAlgo Manually
```bash
./deploy.sh
```

### Check Status
```bash
# Check if running
ps aux | grep "app.py" | grep -v grep

# View logs
tail -f /root/openalgo/openalgo.log

# Test connection
curl http://127.0.0.1:5000
```

### Stop OpenAlgo
```bash
pkill -f "uv run app.py"
```

## Auto-Start
The script is added to `.bashrc` so OpenAlgo starts automatically when you open a new shell.

## Files Location
- `deploy.sh` - Main deployment script
- `openalgo.log` - Application logs
- `.bashrc` - Contains auto-start command
