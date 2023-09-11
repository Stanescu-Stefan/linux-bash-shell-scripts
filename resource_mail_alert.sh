#!/bin/bash

#set email where the messages should be sent
TO="general@company.com"
THRESHOLD=400

#get free RAM value
FREE_RAM=$(free -mt | grep -E "Total" | awk '{print $4}')

#check if free ram value is below the threshold and send emai about it
if [[ $FREE_RAM -lt $THRESHOLD ]]
then
  echo -e "Server is running low on RAM memory\n Available RAM is: $FREE_RAM" | /bin/mail -s "RAM INFO $(date)" $TO
fi


#we can also check disk utilization if its above a certain value and send a notification about it
FILE_UTILIZATION=$(du -H | grep /grep/xvda | awk '{ print $5 }' | tr -d "%")
if [[ $FILE_UTILIZATION -ge 55 ]]
then
  echo "The filesystem /dev/xvda usage is: $FILE_UTILIZATION" | /bin/mail -s "Filesystem Utilization alert" $TO
fi


#you can create a cronjob to run this script every second/hour/certain hoursto monitor the resources depending on your needs