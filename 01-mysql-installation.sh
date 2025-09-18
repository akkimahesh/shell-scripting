#!/bin/bash

#checking the root user or not

USER=$(id -u)

if [ $USER -ne 0 ]
then
	echo "switch User"
	exit 1
else
	echo "you're in Root User"
fi

echo "installing mysql"

Package=$@

dnf install $Package -y

if [ $? -eq 0 ]
then
	echo "$Package installed successfully"
else
	echo "$Package installation failed"
fi


