#!/bin/sh

LOGDIR="/var/log"
ALERTLOG="/var/log/tricore_alerts.log"

for f in tricore_*.log; do
    if grep -q ">" "$LOGDIR/$f"; then
        echo " ALERT: Change detected in $f at $(date)" >> "$ALERTLOG"
        echo "[!] Security alert detected in $f"
    fi
done
