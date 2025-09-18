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



dnf install mysql-community-server -y

if [ $? -eq 0 ]
then
	echo "mysql-community-server installed successfully"
else
	echo "mysql-community-server installation failed"
fi


