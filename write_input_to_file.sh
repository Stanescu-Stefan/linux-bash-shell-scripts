#!/bin/bash

#read data from users and make an option for them to recheck if provided data is correct or not
#we will store that data into a file(for example employee data)

echo -n "Enter your name: "
read NAME
echo -n "Enter your age: "
read AGE
echo -n "Enter your department: "
read DEP

echo "You have entered the following: "
echo "Name:         $NAME"
echo "Age:          $AGE"
echo "Department:   $DEP"

CHECK=0

while [ $CHECK -eq 0 ]
do

echo -n "Is that correct? [Y/n] "
read ANSWER

case "$ANSWER" in
  "Y"|"y" )
        echo "Name:         $NAME" >> employee.txt
        echo "Age:          $AGE" >> employee.txt
        echo "Department:   $DEP" >> employee.txt
        echo "=================================" >> employee.txt
        echo "Your data was saved into employee file"
        CHECK=1
        ;;
    N|n )
        echo "Nothing was saved, run the script again if you want to add data to the employee file"
        CHECK=1
        ;;
    * )
        echo "Wrong answer provided"
        ;;
esac
done