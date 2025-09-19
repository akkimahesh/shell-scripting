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

#downloading the mysql repository package
wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm

if [ $? -ne 0 ]
then
	echo "mysql repository package download failed"
	exit 1
else
	echo "mysql repository package downloaded successfully"
fi

#installing mysql-community-server
dnf install mysql-community-server -y

if [ $? -ne 0 ]
then
	echo "mysql-community-server installation failed"
else
	echo "mysql-community-server installing completed"
fi