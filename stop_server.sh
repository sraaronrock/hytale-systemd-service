#!/usr/bin/env bash

PID_FILE="/home/<your_user>/hytale-server/server.pid"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    echo "shutdown" > /proc/$PID/fd/0

    sleep 5
    
    if kill -0 "$PID" 2>/dev/null; then
        kill "$PID"
    fi

    rm -f "$PID_FILE"
fi
