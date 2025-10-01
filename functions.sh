#!/bin/bash
ID=$(id -u)
VALIDATE (){
    if [ $? -ne 0 ]
then
    echo "ERROR: Installing  failed"
else
    echo "installing  sucess"
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
VALIDATE $? 

yum install git -y
VALIDATE $?
   