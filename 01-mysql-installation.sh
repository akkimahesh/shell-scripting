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

echo "installing mysql server"

dnf install mysql-server -y

if [ $? -eq 0 ]
then
	echo "mysql server installed successfully"
else
	echo "mysql server installation failed"
fi


