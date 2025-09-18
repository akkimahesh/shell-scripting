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

dnf install mysql -y

if [ $? -eq 0 ]
then
	echo "mysql installed successfully"
else
	echo "mysql installation failed"
fi


