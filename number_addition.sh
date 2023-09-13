#!/bin/bash


#we will create a function that will add 2 numbers together and print the result

function addition {
  local FIRST=$1
  local SECOND=$2
  let RESULT=FIRST+SECOND
  echo "Result is: $RESULT"
}

#store the 2 numbers from the user input and do the addition of those numbers
echo -n "Enter the first number: "
read FIRST
echo -n "Enter the second number: "
read SECOND
addition $FIRST $SECOND

echo "Printing variables:"
echo "FIRST: $FIRST"
echo "SECOND $SECOND"
echo "RESULT: $RESULT"