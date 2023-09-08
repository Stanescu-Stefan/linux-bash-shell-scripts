#!/bin/bash

#set email where the messages should be sent
TO="general@company.com"
THRESHOLD=400

#get free RAM value
FREE_RAM=$(free -mt | grep -E "Total" | awk '{print $4}')

if [[ $FREE_RAM -lt $THRESHOLD ]]
then
  echo -e "Server is running low on RAM memory\n Available RAM is: $FREE_RAM" | mail -s "RAM INFO $(date)" $TO
fi

#you can create a cronjob to run this script every second to monitor the resources