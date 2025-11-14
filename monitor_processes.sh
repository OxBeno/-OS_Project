#!/bin/sh

LOGFILE="/var/log/tricore_process.log"
PREV="/tmp/prev_proc.txt"
CURR="/tmp/curr_proc.txt"

ps aux > "$CURR"

if [ -f "$PREV" ]; then
    echo "=== $(date) ===" >> "$LOGFILE"
    diff "$PREV" "$CURR" | grep ">" | grep -v "ps aux" >> "$LOGFILE"
fi

mv "$CURR" "$PREV"
