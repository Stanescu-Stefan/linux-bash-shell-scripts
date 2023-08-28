#!/bin/bash

#backup all .pdf(in our case, but also we can choose other file formats) files from 
# prod location(this is an example) /home/bob/app/prod to backup destination(/home/bob/app/backup).Both /prod and /backup exist in /home/bob/app.
#script takes one argument:
#destination path - which needs to end with /backup e.g. /home/bob/app/backup

PROD=/home/bob/app/prod

#argument check
if [ $# -ne 1 ]; then
  echo "Only one argument is needed, run $0 destination path"
  exit 1
fi

#destination path check
DESTINATION=$1
if [[ $DESTINATION !=*/backup ]]; then
  echo "Wrong destination path, destination path must end with /backup"
  exit 2
fi

#create destination folder
DATE=$(date +%Y-%m-%d_%H:%M:%S)
mkdir -p $DESTINATION/$DATE

#copy from prod to destination
cp $PROD/*.pdf $DESTINATION/$DATE

#test exit status of copy command
if [ $? -eq 0 ]; then
  echo backup OK
else
  echo backup FAILED
fi	


#you run the command like ./backupprod.sh /home/bob/app/backup