#!/bin/sh

function AutoText() {
    echo "Please 2 or 3 key."
}
AutoText
read version

if [ ${version} = "3" ]; then
    pip3 list --outdated --format=legacy | awk '{print $1}' | xargs sudo pip3 install -U
elif [ ${version} = "2" ]; then
    pip list --outdated --format=legacy | awk '{print $1}' | xargs sudo pip install -U
else
    AutoText
fi
