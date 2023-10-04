#!/bin/bash

#we are creating a bash script that will read the /etc/passwd file and compare it to the user password
#that will be manually input. if they match, a message will be printed


FILE='/etc/shadow'

#we are reading the username and loading it into a variable
read -p "Enter a username: " USER_NAME

#we are asking for a password and loading it into a variable
#the -s flag is for silent, so we dont echo the password

read -sp "Enter user password: " USER_PASSWORD
echo ""

#we are returning the stored hashed and salted password from /etc/shadow

ORIGINAL_PASSWORD=$(sudo awk -F: -v pattern="$USER_NAME" '$0 ~ pattern { print $2 }' /etc/shadow)


#we can load the stored password into an array(-a flag)

IFS='$' read -a PWD_ARRAY <<< $ORIGINAL_PASSWORD

#usually a stored password is made out of 3 parts, the hashing algorithm, the salt and the hash
#the algorithm echo ${PWD_ARRAY[1]} will echo 6, it means SHA512
#the second part is the salt(echo ${PWD_ARRAY[2]}), which is random. but if you provide the same salt and the same password
#to the hashing algorithm, it will create the same hash.
#the third part is the password hash itself, echo ${PWD_ARRAY[3]}

ENTERED_PASSWORD=$(openssl passwd -${PWD_ARRAY[1]} -salt ${PWD_ARRAY[2]} $USER_PASSWORD)

#now we can check if the entered password is the same as the one in /etc/passwd

if [ $ORIGINAL_PASSWORD == $ENTERED_PASSWORD ]; then
  echo "Authenticated"
else
  echo "Not Authenticated"
fi


#for testing purposes, we can quickly do something like, sudo useradd joe
# and to add his password,  "joe:Password1" | sudo chpasswd, to create an user and generate his password