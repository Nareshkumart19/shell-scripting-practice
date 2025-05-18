#!/bin/bash 

userid=$(id -u)

if [ $userid -ne 0 ]
then
   echo " error run the the script with root acess"
   exit 1
else 
   echo " you are runing with root acess"
fi

dnf install mysql -y

