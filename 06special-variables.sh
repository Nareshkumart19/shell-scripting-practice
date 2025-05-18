#!/bin/bash

echo "All varibles as an array:  $@"
echo "Number of varibles: $#" 
echo "The name of the script : $0" 
echo "current directory $PWD"
echo "user rununing the script: $USER"
echo "home directory user $HOME"
echo "PID OF THE SCRIPT  $$"
sleep 10 &
echo " The process ID of the last background command : $!"