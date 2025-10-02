#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

SOURCE_DIR="/tmp/shell-script-logs"
if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
    exit 1
 else
    echo -e "$G Source directory exists $N"
fi

FILE_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")
while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE