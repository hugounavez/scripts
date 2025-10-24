#!/usr/bin/env bash

# --- resolve path under current user's home ---
LOGDIR="$HOME/logs/speed-internet-history"
LOGFILE="$LOGDIR/speed.log"

# --- ensure directory exists ---
mkdir -p "$LOGDIR"

# --- timestamp ---
TS=$(date '+%Y-%m-%d %H:%M:%S')

# --- run speedtest and flatten output to 1 line ---
RESULT=$(speedtest-cli --simple 2>&1 | tr '\n' ' ')

# --- append to logfile ---
echo "$TS $RESULT" >> "$LOGFILE"
