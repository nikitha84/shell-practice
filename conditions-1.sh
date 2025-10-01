#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ];
then
    echo "ERROR:: Please run with root user"
else
    echo "You rea root user"
fi
yum install mysql -y


