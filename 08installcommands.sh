#!/bin/bash 

userid=$(id -u)

if [ $userid -ne 0 ]
then
   echo " error run the the script with root acess"
   exit 1
else 
   echo " you are runing with root acess"
fi

dnf install mysqloppkio -y

#dnf remove mysql -y

if [ $? -ne 0 ]
then
   echo "installing musql  is .... sucess"
else
    echo "installing my sql is .... fail"   
    #exit 1
fi    