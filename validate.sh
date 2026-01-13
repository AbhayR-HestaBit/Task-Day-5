#!/bin/sh

LOG="validate.log"
echo "$(date -Iseconds) validation started" >> "$LOG"

[ -d src ] || { echo "src/ missing" >> "$LOG"; exit 1; }

[ -f config.json ] || { echo "config.json missing" >> "$LOG"; exit 1; }

node -e "JSON.parse(require('fs').readFileSync('config.json'))" \
|| { echo "invalid config.json" >> "$LOG"; exit 1; }

echo "$(date -Iseconds) validation passed" >> "$LOG"
