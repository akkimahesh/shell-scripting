#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m' # No Color (Reset)

# -e mandatory
echo -e "Print $RED RED colour $NC"
echo -e "Print $GREEN GREEN colour $NC"
echo -e "Print $YELLOW YELLOW colour $NC"
echo -e "Print $NC NO colour $NC"