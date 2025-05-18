#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "ERROR run the script with root user"
    exit 1
else
    echo "you are in root user"
fi 

#i want to run 3 services at atime
#validate function takes input as exit status, what commnad they tried to install

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "is inastlling $2    ......sucessfully"
    else
        echo "is  installing $2 ...failure"
        exit 1
    fi
}


dnf list installed  mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed  going to  install it"
    dnf install mysql -y
    VALADATE $? "MYSQL"
else
    echo "mysql is alresy installed in your system"
fi

dnf list installed  python3
if [ $? -ne 0 ]
then
    echo "my python3 is not installed  going to  install it"
    dnf install python3 -y
    VALADATE $? "python3"
else
    echo "python3 is already installed in your system"
fi

dnf list installed  nginx
if [ $? -ne 0 ]
then
    echo "my nginx is not installed  going to  install it"
    dnf install nginx -y
    VALADATE $? "nginx"
else
    echo "nginx is already installed in your system"
fi