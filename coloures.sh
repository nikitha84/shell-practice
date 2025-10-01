#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executed at $TIMESTAMP" &>> $LOGFILE

echo "script name: $0"

VALIDATE (){
    if [ $1 -ne 0 ]
then
    echo -e "$R ERROR: Installing $2 failed $N"
else
    echo -e "$G installing $2 sucess $N"
fi
}

if [ $ID -ne 0 ]
then
   echo -e "$R ERROE: please run with root user $N"
   exit 1
else
    echo -e "$G you are root user $N"
fi
yum install mysql -y  &>> $LOGFILE
VALIDATE $?  "installing mysql"

yum install git -y &>> $LOGFILE
VALIDATE $? "installing git"
   