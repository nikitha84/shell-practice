TO_ADDRESS=$1
SUBJECT=$2
ALERT_TYPE=$3
MESSAGE_BODY=$4
IP_ADDRESS=$5
TO_TEAM=$6

FINAL_BODY=$(echo -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/IP_ADDRESS/$IP_ADDRESS/g" -e "s/MESSAGE/$FORMATTED_BODY/g" template.html)
{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: $ALERT_TYPE"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"


# Hi, TO_TEAM #(Devops team) conver into html 
# There is an ALERT_TYPE in the system IP_ADDRESS. Please find the detailes below

# MESSAGE
# Regards,
# Monitoring team

# {
# echo "To: $TO_ADDRESS #devopsteam84640@gmail.com"
# echo "Subject: Mail alert fron devopsteam"
# echo "Content-Type: text/html"
# echo ""
# echo "this is test email"
# } | msmtp "devopsteam84640@gmail.com"