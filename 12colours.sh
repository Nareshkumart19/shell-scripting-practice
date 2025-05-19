#!/bin/bash


R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo -e "ERROR $R run the script with root use $N"
    exit 1
else
    echo "you are in root user"
fi 

#i want to run 3 services at atime
#validate function takes input as exit status, what commnad they tried to install


VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "is inastlling $2    ....$G..sucessfully $N"
    else
        echo "is  installing $2 . $R..failure$N"
        exit 1
    fi
}


dnf list installed  mysql
if [ $? -ne 0 ]
then
    echo -e "mysql is not installed  going to $Y install it $N"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "mysql is alresy installed  ...$Y in your system$N"
fi

dnf list installed  python3
if [ $? -ne 0 ]
then
    echo -e "my python3 is not installed  going to $Y install it $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo  "python3 is already installed in your system"
fi

dnf list installed  nginx
if [ $? -ne 0 ]
then
    echo -e "my nginx is not installed  going to  install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx is already installed in your $Y system $N"
fi