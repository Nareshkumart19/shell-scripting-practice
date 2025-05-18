#!/bin/bash

userid=(id -u)
if [ $userid -nq 0 ]
then
    echo "ERROR,  run the script with root user"
    exit 1
else
    echo " you are running root access"
fi



dnf install mysql -y
if [ $? -eq 0 ]
then
    echo "mysql is inastlled .....sucessfully"
else
    echo "mysql is not installed ......failure"
    exit 1
fi


#dnf list installed  mysql
#if [ $? -ne 0 ]
#then
#    echo " my sql is not installed  going to  install it"
#    dnf install mysql -y
#    if [ $? -eq 0 ]
#    then
#        echo "mysql is inastlled .....sucessfully"
#    else
#        echo "mysql is not installed ......failure"
#        exit 1
#    fi
#else
#    echo " mysql is alresy installed in your system"
#fi
