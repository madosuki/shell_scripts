#!/bin/sh

function AutoText() {
    echo "Please 2 or 3 key."
}
AutoText
read version

if [ ${version} = "3" ]; then
    pip3 list --format=columns | awk '{if(NR>2)print $1}' | xargs pip3 install -U
elif [ ${version} = "2" ]; then
    pip2 list --format=columns | awk '{if(NR>2)print $1}' | xargs pip2 install -U
else
    AutoText
fi
