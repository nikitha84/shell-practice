#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ];
then
    echo "ERROR:: Please run with root user"
    exit 1
else
    echo "You rea root user"
fi
yum install mysql -y

if [ $? -ne 0 ]
then
    echo "ERROR: Installing Mysql failed"
    exist 1
else
    echo "Installing Mysql suscess"
fi  

yum install git -y

if [ $? -ne 0 ]
then
    echo "ERROR: Installing git failed"
    exist 1
else
    echo "Installing git suscess"
fi



