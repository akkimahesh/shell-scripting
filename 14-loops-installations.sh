#!/bin/bash

USER=$(id -u)
LOGS_FOLDER="/tmp/shellscript"
LOGS_FILE="$LOGS_FOLDER/$0.log"

mkdir -p $LOGS_FOLDER

if [ $USER -ne 0 ]
then
    echo "please run this Script as a root User" | tee -a "$LOGS_FILE"
    exit 1
else
    echo "Perfect you're in Root user" | tee -a "$LOGS_FILE"
fi

VALIDATE(){
    if [ $1 -ne 0  ]
    then
        echo "$2...Failed" | tee -a "$LOGS_FILE"
        exit 1
    else
        echo "$2...Success" | tee -a "$LOGS_FILE"
    fi
}

for package in $@ #nginx, mysql, nodejs
do
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE $? "Installing $package"
done