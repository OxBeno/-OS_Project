#!/bin/sh

LOGFILE="/var/log/tricore_network.log"
PREV="/tmp/prev_net.txt"
CURR="/tmp/curr_net.txt"

netstat -ant > "$CURR"

if [ -f "$PREV" ]; then
    echo "=== $(date) ===" >> "$LOGFILE"
    diff "$PREV" "$CURR" | grep ">" >> "$LOGFILE"
fi

mv "$CURR" "$PREV"
