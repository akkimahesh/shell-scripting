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

dnf install mysql80-community-release-el9-1.noarch.rpm -y

if [ $? -ne 0 ]
then
	echo "mysql repository package installation failed"
	exit 1
else
	echo "mysql repository package installed successfully"
fi
#Import MySQL GPG Key
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
if [ $? -ne 0 ]
then
	echo "Importing GPG key failed"
	exit 1
else
	echo "GPG key imported successfully"
fi


#installing mysql-community-server
dnf install mysql-community-server -y

if [ $? -ne 0 ]
then
	echo "mysql-community-server installation failed"
else
	echo "mysql-community-server installing completed"
fi