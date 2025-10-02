#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

SOURCE_DIR="/tmp/shellscript-logs"

if [ ! -d $SOURCE_DIR ];     #! = Negates the condition. -d directory
then
    echo -e "$R source directory: $SOURCE_DIR does not exist $N"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line
do 
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE