#!/bin/bash
ID=(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "script executed at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$R ERROR: $1  ... Failed $N"
        exit 1
    else
        echo -e "$G $2 ....Success $N"
    fi        
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR: please run with root user $N"
    exit 1
else
    echo -e "$G you are root user $N"
fi

for $package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "installing of $package
    else
        echo -e $package is already installed ..$Y SKIPPING $N"
    fi     
done