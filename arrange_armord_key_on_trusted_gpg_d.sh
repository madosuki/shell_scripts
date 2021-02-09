#!/bin/sh

# this script is arrange key on trusted.gpg.d after dearmor to armor key.


if [ -p /dev/stdin ]; then
    echo "detect pipe line"
else
    specific=$(file ${1} | awk '{print $2}')
    name=${2}
    if [ "${specific}" = "UTF-8" -o "${specific}" = "ASCII" ]; then
        sudo sh -c "gpg --dearmor ${1} > /etc/apt/trusted.gpg.d/${name}.gpg"
    fi
fi
