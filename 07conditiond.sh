#!/bin/bash


#-gt greter than
#-lt less than
#-eq  equal 
#-ne  not equal
number=$1

if [ $number -lt 10 ]
then
    echo " give  the $number less then 10"
else
    echo " give the $number not less then 10"
fi