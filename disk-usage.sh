#!/bin/bash

DISK_USAGE=$( df -hT | grep -vE 'tmp|File|fat')
Treshold=10

while IFS= read -r line; do

    USAGE=$( echo "$line" | awk '{print $6f}' | cut -d '%' -f1)
    partion=$( echo "$line" | awk '{print $1f}' )

    if [ "$USAGE" -ge "$Treshold" ]; then
        echo "Warning: Partition $partion is at ${USAGE}% usage."
    fi
done <<< "$DISK_USAGE"