#!/bin/bash

#checking the root user or not

USER=$(whoami)

if [ $USER -ne root ]
then
	echo "switch User"
else
	echo "you're in Root User"
fi



