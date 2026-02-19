#!/bin/bash

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/shell-logs"

if [ ! -d $SOURCE_DIR ]; then
echo -e "$R ERROR: $SOURCE_DIR does not exist $N"
mkdir -p "$SOURCE_DIR"
echo -e "$G $SOURCE_DIR created ..$N"
else
   echo  "$SOURCE_DIR already exist"
fi

FILES_TO_DELETE=$(find "$SOURCE_DIR" -type f -mtime +14 -name "*.log")

while IFS= read -r logfile
do
    echo "Deleting the file: $logfile"
    rm -rf "$logfile"
    echo "Deleted the file: $logfile"
done <<< $FILES_TO_DELETE

