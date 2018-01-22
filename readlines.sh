#!/bin/bash
file=$1
maxLinesToRead=$2 || 0

showHelp () {
  echo 'Usage: ./readlines.sh [file] [maxLinesToRead (optional)]'
}

parseline_grab_result () {
  lineNum=$1
  line=$2
  ./parseline.sh "$lineNum" "$line"
}

parseline () {
  parseline_grab_result "$1" "$2"
}

main () {
  i=0
  while read line || [ -n "$line" ]
  do
    parseline "$i" "$line"
    i=$(($i+1))
    if [ "$maxLinesToRead" = "$i" ]
      then break
    fi
  done < $file
}

if [ "$file" = "" ]
  then showHelp
  else main
fi

