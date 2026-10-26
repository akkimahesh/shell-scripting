#!/bin/bash

NUM1=20 #NUM1=$1 args
# Operator Meaning	    Example
# -eq	   Equal to	    [ $a -eq $b ]
# -ne	   Not equal to	[ $a -ne $b ]
# -gt	   Greater than	[ $a -gt $b ]
# -lt	   Less than	[ $a -lt $b ]
# -ge	   Greater than or equal to	[ $a -ge $b ]
# -le	   Less than or equal to	[ $a -le $b ]

if [ $NUM1 -gt 100 ] #spaces must 
then
    echo "Yes, you're correct"
# elif [ $NUM1 -eq 100 ]
# then
    # echo "Yes, $NUM1 is equal to 100 "
else
    echo "No, $NUM1 is lessthan 100" 
fi

# String operators (only for strings)
# Operator	Meaning
# =	        Strings are equal
# !=	    Strings are not equal
# -z        "$str"	String is empty
# -n        "$str"	String is not empty

ENV="production"

if [ "$ENV" = "production" ]
then
    echo "Production environment"
else
    echo "Non-production environment"
fi

# File and directory conditions
# These are especially useful for DevOps tasks.
# Operator	Checks whether
# -f file	A regular file exists
# -d directory	A directory exists
# -e path	A file or other filesystem path exists
# -r file	A file is readable
# -w file	A file is writable
# -x file	A file is executable

if [ -f "/etc/nginx/nginx.conf" ]
then
    echo "Nginx configuration file exists"
else
    echo "Nginx configuration file is missing"
fi

# Logical operators
# Use these to combine conditions.
# - && — AND: both conditions must be true.
# - || — OR: at least one condition must be true.
# - ! — NOT: reverses the condition.

CPU=40
MEMORY=60

if [ "$CPU" -lt 80 ] && [ "$MEMORY" -lt 80 ]
then
    echo "CPU and memory usage are within limits"
else
    echo "Check server resource usage"
fi


