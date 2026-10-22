#!/bin/bash

STARTTIME=$(date +%s)
echo "Script started at: $STARTTIME"

sleep 10

ENDTIME=$(date +%s)
echo "Script ended at: $ENDTIME"

TOTAL=$((ENDTIME - STARTTIME))
echo "Script executed time: $TOTAL seconds"
