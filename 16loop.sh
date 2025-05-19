#!/bin/bash

userid=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFOLDER="/var/log/shellscript.logs"
SCRIPT_NAME=$(echo $0  | cut -d "." -f1)
LOGFILE="$LOGFOLDER/$SCRIPT_NAME.log"
PAKAGES=("mysql" "python" "httpd")

mkdir -p $LOGFOLDER
echo "script started exeuted at : $(date)" &>>$LOGFILE

if [ $userid -ne 0 ]
then
    echo -e "ERROR $R run the script with root use $N" | tee -a $LOGFILE
    exit 1
else
    echo "you are in root user"
fi 

#i want to run 3 services at atime
#validate function takes input as exit status, what commnad they tried to install



VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "is inastlling $2    ....$G sucessfully $N" | tee -a $LOGFILE
    else
        echo -e "is  installing $2 . $R   failure $N" | tee -a $LOGFILE
        exit 1s
    fi
}


#if you dont want intrest chage  in side cide always for pakage  give like this =  for pakages in $@



#for pakages in ${PAKAGES[@]}

#we are using aruments

for pakages in $@
do
 dnf list installed $pakages &>>$LOGFILE
 if [ $? -ne 0 ]
 then
    echo -e "$pakages is not installed  going to install it" | tee -a $LOGFILE
    dnf install $pakages -y &>>$LOGFILE
    VALIDATE $? "pakages"
else
    echo -e "pakages is alresy installed  ...$Y in your system $N" | tee -a $LOGFILE
fi
done



#dnf list installed  mysql
#if [ $? -ne 0 ]
#thens
#    echo -e "mysql is not installed  going to install it" | tee -a $LOGFILE
#    dnf install mysql -y &>>$LOGFILE
#    VALIDATE $? "MYSQL"
#else
#    echo -e "mysql is alresy installed  ...$Y in your system $N" | tee -a $LOGFILE
#fi
#
#dnf list installed  python3
#if [ $? -ne 0 ]
#then
#    echo -e "my python3 is not installed  going to $Y install it $N" &>>$LOGFILE
#    dnf install python3 -y &>>$LOGFILE
#    VALIDATE $? "python3"
#else
#    echo -e  "python3 is already $Y installed in your system $N" | tee -a $LOGFILE
#fi
#
#dnf list installed  nginx
#if [ $? -ne 0 ]
#then
#    echo -e "my nginx is not installed  going to  install it" | tee -a $LOGFILE
#    dnf install nginx -y &>>$LOGFILE
#    VALIDATE $? "nginx"
#else
#    echo -e "nginx is $Y already installed in your system $N" | tee -a $LOGFILE
#fi


























