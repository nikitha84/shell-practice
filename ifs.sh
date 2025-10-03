#!/bin/bash
file=/etc/passwd

if[ ! -f $file ];
then
echo "$file not exist"
fi

while ifs= ":" read -r username password user_id group_id user_fullname
do
    echo "username : $username"
    echo "user_id: $user_id
done < $file    