#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "please run this Script as a root User"
    exit 1
else
    echo "Perfect you're in Root user"
fi

VALIDATE(){
    if [ echo $1 -ne 0  ]
    then
        echo "$2...Failed"
        exit 1
    else
        echo "$2...Success"
    fi
}

dnf install nginx -y
#ikkada above command exist status value storaged in $?.
#that $? is parameter for function.
VALIDATE() $? "Installing Nginx" 