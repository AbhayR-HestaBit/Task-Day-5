#!/bin/sh

LOG_FILE="validate.log"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

log() {
  echo "[$TIMESTAMP] $1" >> "$LOG_FILE"
}

# Check src directory
if [ ! -d "src" ]; then
  log "ERROR: src/ directory missing"
  exit 1
fi

# Check config.json exists
if [ ! -f "config.json" ]; then
  log "ERROR: config.json missing"
  exit 1
fi

# Validate config.json
node -e "JSON.parse(require('fs').readFileSync('config.json'))" 2>/dev/null
if [ $? -ne 0 ]; then
  log "ERROR: config.json is invalid JSON"
  exit 1
fi

log "Validation passed"
exit 0
