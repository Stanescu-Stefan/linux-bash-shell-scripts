#!/bin/bash

#we will create a script that will display files in a certain (directory)location, search for specific file extensions
# like .conf, or display statistics like sum of total size of those files, the largest/smallest size of those files.

# ./files.sh [-l location] [--location location] [-e extensions] [--extension extension] [-h] [--help]

function usage() {
  echo "USAGE $0 [-l location] [--location location] [-e extensions] [--extension extension] [-h] [--help] "
  echo "Examples:"
  echo "$0 -l /etc/ -e txt -s"
  echo
  exit 1
}

LOC_SET=0 #0 represents that location is not set, use current location 1-location was set
STATS=0   #0-do not display statistics    1- display statistics

while [ $# -gt 0 ]
do
  case $1 in
    -l|--location)
      LOCATION=$2
      if ! [ -d "$LOCATION" ]; then
        usage
      fi 
      LOC_SET=1
      shift
      shift
      ;;
    -e|--extension)
      EXT="$2"
      shift
      shift
      ;;
    -s|--stats)
      STATS=1
      shift
      ;;
    -h|--help)
      shift
      usage
      ;;
    *)
      usage
      ;;
  esac
done

#we check if location is set, if not, we use the present directory location

if [ $LOC_SET -ne 1 ]; then
  LOCATION=$(pwd)
fi

echo "Location: $LOCATION"

#now we check for file extensions

if [ "$EXT" != "" ]; then
  ls -l $LOCATION | awk '/^-/' | grep "\.$EXT$" &>/dev/null
  if [ $? -ne 0 ]; then
    echo "No file with extension: $EXT found"
    exit 2
  fi

  #count size of files with specific extension
  #size.awk file must be either placed in same directory as files.sh script or given the absolute path
  #-v parameter(custom parameter) in awk sets the value of the awk stats variable to the BASH STATS variable(1)
  # in size.awk file, if the stats variable is set to 1, script will display the largest and smallest file size in MB

  ls -l $LOCATION | awk '/^-/' | grep "\.$EXT$" | awk -v stats=$STATS -f size.awk
else 
  ls -l $LOCATION | awk '/^-/' | awk -v stats-$STATS -f size.awk
fi