#!/bin/bash

DISK_USAGE=$( df -hT | grep -vE 'tmp|File|fat' | awk '{print $6f}' | cut -d % -f1 )
Treshold=10
while IFS= read -r USAGE; do
    if [ "$USAGE" -ge "$Treshold" ]; then
        echo "Warning: Disk usage is at ${USAGE}%"
    fi
done <<< "$DISK_USAGE"