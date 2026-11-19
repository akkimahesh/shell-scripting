#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m' # No Color (Reset)
USER=$(id -u)
LOGS_FOLDER="/tmp/shellscript"
LOGS_FILE="$LOGS_FOLDER/$0.log"

mkdir -p $LOGS_FOLDER

if [ $USER -ne 0 ]
then
    echo "please run this Script as a $RED root User $NC" | tee -a "$LOGS_FILE"
    exit 1
else
    echo "Perfect you're in  $GREEN Root user $NC" | tee -a "$LOGS_FILE"
fi

VALIDATE(){
    if [ $1 -ne 0  ]
    then
        echo "$2...$RED Failed $NC" | tee -a "$LOGS_FILE"
        exit 1
    else
        echo "$2...$ GREEN Success $NC" | tee -a "$LOGS_FILE"
    fi
}

for package in $@ #nginx, mysql, nodejs
do
    dnf list installed $package &>> $LOGS_FILE
  
    if [ $? -ne 0 ]; then
        echo "$package is not Installed"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed..$YELLOW skip $NC"
    fi
done