#!/bin/bash

if [ $# == 0 ]; then
    echo "Please DL List File path"
    exit
fi

name=$1
format=22

ptn1="[a-zA-Z]+[[:blank:]]([0-9]+)$"
ptn2="[a-zA-Z]+[[:blank:]]([0-9]+\+[0-9]+)"

cat ${name} | while read line
do
    if [[ ${line} =~ ${ptn1} || ${line} =~ ${ptn2} ]]; then
        format=${BASH_REMATCH[1]}
    else
        youtube-dl -f ${format} ${line}
    fi
done

