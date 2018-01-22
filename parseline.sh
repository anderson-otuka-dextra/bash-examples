#!/bin/bash
lineNum=$1
line=$2

# example fn here
example () {
  echo $line
}

# custom fn
custom () {
  echo -/- $line
}

# split by tabs and count the number of parameters
splitByTabs () {
  echo ""
  IFS=$'\t'
  splitLine=($line)
  nElems=${#splitLine[@]}
  for (( elem = 0; elem < ${nElems}; elem++ ));
  do
    echo [$elem] ${splitLine[$elem]}
  done
}

# split by tabs and get specifig parameters
splitByTabsGetParams () {
  IFS=$'\t'
  splitLine=($line)
  nElems=${#splitLine[@]}
  if [ "${nElems}" == "18" ]
  then
    app=${splitLine[2]}
    platform=${splitLine[3]}
    grade=${splitLine[10]}
    feedback=${splitLine[11]}
    internalDate=${splitLine[12]}
    ratedStore=${splitLine[13]}
    storeDate=${splitLine[14]}
  else
    grade="NULL"
    echo -e "${lineNum}\tNOK\t[${nElems}]\t"
    splitByTabs
  fi

  if [ "$grade" != "NULL" ]
  then
    internalMonth=${internalDate:0:7}
    storeMonth=${storeDate:0:7}
    echo -e "${lineNum}\tOK\t[${nElems}]\t${app}\t${platform}\t${grade}\t${internalMonth}\t${ratedStore}\t${storeMonth}\t${feedback}"
  fi
}


# run fn - uncomment one line below
# example
# custom
# splitByTabs
  splitByTabsGetParams