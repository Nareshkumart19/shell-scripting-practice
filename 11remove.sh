#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "run the script with root user"
else
    echo "you are in root user"
fi 

#i want to run 3 services at atime

#check alredy installed or not . if installed $? is 0, then
#if not installed $? is not 0. expression is true

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "is inastlling $2 ......remove"
        exit 1
    else
        echo "is  installing $2 ...sucefully"
    fi
}


dnf list installed  mysql
if [ $? -ne 0 ]
then
    echo "mysql insatlled  going to remove it  "
    dnf remove mysql -y
    VALADATE $? "MYSQL"
else
    echo "removed mysql susefully"
fi

dnf list installed  python3
if [ $? -ne 0 ]
then
    echo "python3 insatlled  going to remove it"
    dnf remove python3 -y
    VALADATE $? "python3"
else
    echo "removed  python3 susefully""
fi

#dnf list installed  nginx
#if [ $? -ne 0 ]
#then
#    echo "my sql is not installed  going to  install it"
#    dnf  nginx -y
#    VALADATE $? "nginx"
#else
#    echo "nginx is already installed in your system"
#fi