#!/bin/sh

LOGFILE="/var/log/tricore_filecheck.log"

echo "=== $(date) ===" >> "$LOGFILE"
aide --check | grep "found" >> "$LOGFILE"
