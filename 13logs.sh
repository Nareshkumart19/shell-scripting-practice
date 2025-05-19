#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo -e "ERROR $R run the script with root use $N"
    exit 1
else
    echo "you are in root user"
fi 

LOGFOLDER="/var/log/shell-scripting-practice"
SCRIPT_NAME=$(echo  $0 |cut -d "." -f1)
LOGFILE="$LOGFOLDER/$SRIPT_NAME.log"

mkdir -p $LOGFOLDER

echo "script started executing at: $(date)" &>>$LOGFILE

#i want to run 3 services at atime
#validate function takes input as exit status, what commnad they tried to install


VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "is inastlling $2    ....$G sucessfully $N"
    else
        echo -e "is  installing $2 . $R .... failure $N"
        exit 1
    fi
}


dnf list installed  mysql &>>$LOGFILE
if [ $? -ne 0 ]
then
    echo -e "mysql is not installed  going to install it" &>>$LOGFILE
    dnf install mysql -y &>>$LOGFILE
    VALIDATE $? "MYSQL"
else
    echo -e "mysql is alresy installed  ...$Y in your system $N" &>>$LOGFILE
fi

dnf list installed  python3 &>>$LOGFILE
if [ $? -ne 0 ]
then
    echo -e "my python3 is not installed  going to $Y install it $N" &>>$LOGFILE
    dnf install python3 -y &>>$LOGFILE
    VALIDATE $? "python3"
else
    echo -e  "python3 is already $Y installed in your system $N" &>>$LOGFILE
fi

dnf list installed  nginx &>>$LOGFILE
if [ $? -ne 0 ]
then
    echo -e "my nginx is not installed  going to  install it" &>>$LOGFILE
    dnf install nginx -y &>>$LOGFILE
    VALIDATE $? "nginx"
else
    echo -e "nginx is $Y already installed in your system $N " &>>$LOGFILE
fi