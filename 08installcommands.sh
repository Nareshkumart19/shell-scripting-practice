#!/bin/bash 

userid=$(id -u)

# when im runing normal user
if [ $userid -ne 0 ]
then
   echo " error run the the script with root acess"
   exit 1
else 
   echo " you are runing with root acess"
fi


# root user

dnf list installed mysql
#check alredy installed or not . if installed $? is 0, then
#if not installed $? is not 0. expression is true
 
if [ $? -ne 0 ]
then
    echo "mysql is not installed ...going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "installing msql .....sucess"
    else
        echo "installed mysql is....... fail"
        exit 1
    fi
else
    echo "mysql is alredy installd..... nothing to do"
fi    


#dnf install mysql -y

#
#
#
#if [ $? -eq 0 ]
#then
#    echo "installing musql  is .... sucess"
#else
#    echo "installing my sql is ....fail"   
#    exit 1
#fi    