#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "ERROR,  run the script with root user"
    exit 1
else
    echo " you are running root access"
fi

#check alredy installed or not . if installed $? is 0, then
#if not installed $? is not 0. expression is true

#dnf install mysql -y
#if [ $? -eq 0 ]
#then
#    echo "mysql is inastlled .....sucessfully"
#else
#    echo "mysql is not installed ......failure"
#    exit 1
#fi



dnf list installed  mysql
if [ $? -ne 0 ]
then
    echo " my sql is not installed  going to  install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "mysql  is inastlling .....sucessfully"
    else
        echo "mysql is  installing ......failure"
        exit 1
    fi
else
    echo " mysql is alresy installed in your system"
fi