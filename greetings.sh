#!/bin/bash

NAME=""
WISHES="Good Morning"

usage() {
    echo "Usage: $0 -n <name> -w <wishes>"
    echo "  -n   Specify the name to greet"
    echo "  -w   Specify the wishes (e.g., 'Good Morning', 'Good Evening')"
    exit 1
}

while getopts "n:w:h" opt; do
    case $opt in
        n) NAME="$OPTARG" ;;
        w) WISHES="$OPTARG" ;;
        h|*) 
            echo "Invalid option: -$OPTARG" >&2
            usage
            exit 1
            ;;
    esac
done

#if [ -z "$NAME" ] || [ -z "$WISHES" ]; then
if [ -z "$NAME" ]; then
    echo "Error: Name is required."
    usage
    exit 1
fi
echo "HI  $NAME, $WISHES! Have a nice day!"