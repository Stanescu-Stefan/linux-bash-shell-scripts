#!/usr/bin/env bash

#the script will run like ./script.sh service_name(the service name will be the argument, it can be docker,squid,httpd etc)

#we check if the user is root

SERVICE=$1
if [[ $(id -u) -eq 0 ]]
then
  if systemctl status $SERVICE 1>/dev/null 2>/dev/null
  then
    echo "$SERVICE service is up and running"
  else
    echo "Starting $SERVICE service...."
    systemctl start $SERVICE
    echo "Successfully started $SERVICE service"
  fi
else
  if sudo -v 1>/dev/null 2>/dev/null
  then
    if systemctl status $SERVICE 1>/dev/null 2>/dev/null
    then
      echo "$SERVICE service is up and running"
    else
      echo "Starting $SERVICE service...."
      sudo systemctl start $SERVICE
      echo "Successfully started $SERVICE service"
    fi
  else
    echo "Sorry, you are not allowed to start $SERVICE service, because you are not root user and also you don't have sudo privileges"
  fi
fi