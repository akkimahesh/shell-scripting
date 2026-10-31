#!/bin/bash
#logs more important while performing scriptings in automation.
#because when scheduled scripts we check logs whether it is success or not.
#1> if success then only terminal output stored in logs
#2> if failure then only terminal output stored in logs
#&> if success or failure then only terminal output stored in logs.
# tee command used to print output on display and log file.
USER=$(id -u)
LOGS_FOLDER="/tmp/shellscript"
LOGS_FILE="$LOGS_FOLDER/$0.log"

mkdir -p $LOGS_FOLDER

if [ $USER -ne 0 ]
then
    echo "please run this Script as a root User"
    exit 1
else
    echo "Perfect you're in Root user" | tee "$LOGS_FILE"
fi

VALIDATE(){
    if [ $1 -ne 0  ]
    then
        echo "$2...Failed" | tee "$LOGS_FILE"
        exit 1
    else
        echo "$2...Success" | tee "$LOGS_FILE"
    fi
}

dnf install nginx -y &> $LOGS_FILE
VALIDATE $? "Installing Nginx" 