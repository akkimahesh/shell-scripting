#!/bin/bash

STARTTIME=$(date +%s)
echo "Script started at: $STARTTIME"

sleep 10

ENDTIME=$(date +%s)
echo "Script ended at: $ENDTIME"
# ( ) — In Bash, single parentheses are commonly used to run commands in a subshell.
# (( )) — Used for arithmetic operations.
# $(( )) — Used for arithmetic expansion: calculate the result and substitute the resulting number into the command.
TOTAL=$((ENDTIME - STARTTIME))
echo "Script executed time: $TOTAL seconds"