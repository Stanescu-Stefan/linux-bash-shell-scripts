#!/bin/bash

#we define an array based on the output of a command(it can be something simple as ls or something more complicated)
#then we check the items of the array for permissions(or perform other commands on them)

ARRAY=($(ls *.txt))
COUNT=0 

echo -e "FILE NAME \t WRITABLE"

for FILE in "${ARRAY[@]}"
do
  echo -n $FILE
  echo -n "[${#ARRAY[$COUNT]}]"
  if [ -w "$FILE" ]; then
    echo -e "\t YES"
  else 
    echo -e "\t NO"
  fi 

  let COUNT++
done