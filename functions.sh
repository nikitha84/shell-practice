#!/bin/bash
ID=$(id -u)
VALIDATE (){
    if [ $1 -ne 0 ]
then
    echo "ERROR: Installing $2 failed"
else
    echo "installing $2 sucess"
fi
}

if [$ID -ne 0 ]
then
   echo "ERROE: please run with root user"
   exit 1
else
    echo "you are root user"
fi
yum install mysql -y
VALIDATE $?  "installing mysql"

yum install git -y
VALIDATE $? "installing git"
   