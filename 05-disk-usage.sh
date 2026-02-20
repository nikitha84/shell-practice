#!/bin/bash
DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo  $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -ge $DISK_THRESHOLD ]; then
    #echo "Hight usage on $PARTITION : $USAGE"
    MESSAGE+="High usage on $PARTITION : $USAGE % <br>" 
    fi
done <<< "$DISK_USAGE"

echo -e "Message body=$MESSAGE"

sh 06-mail.sh "nikitha84640@gmail.com" "High disk usage Alert" "High disk usage" "$MESSAGE" "$IP_ADDRESS"

#rbpvtvximyzqugky=app tocken

# {
# echo "To: devopsteam84640@gmail.com"
# echo "Subject: Mail alert fron devopsteam"
# echo "Content-Type: text/html"
# echo ""
# echo "this is test email"
# } | msmtp "devopsteam84640@gmail.com"

#curl http://checkip.amazonaws.com
# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5