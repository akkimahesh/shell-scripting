#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "please run this Script as a root User"
    exit 1
else
    echo "Perfect you're in Root user"
fi

dnf install nginx -y

if [ echo $? -ne 0  ]
then
    echo "INSTALLING nginx Failed"
    exit 1
else
    echo "INSTALLING nginx Success"
fi
