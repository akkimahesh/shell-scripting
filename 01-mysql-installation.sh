#!/bin/bash

#checking the root user or not

USER=$(id -u)

if [ $USER -ne 0 ]
then
	echo "switch User"
else
	echo "you're in Root User"
fi



