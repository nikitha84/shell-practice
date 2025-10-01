#!/bin/bash
ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script name: $0"

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
yum install mysql -y  &>> $LOGFILE
VALIDATE $?  "installing mysql"

yum install git -y &>> $LOGFILE
VALIDATE $? "installing git"
   