#!/bin/sh

# this script is arrange key on trusted.gpg.d after dearmor to armor key.

OPTIONS=`getopt -o n -l name -- "$@"`

if [ -p /dev/stdin ]; then
	name=""
	eval set -- ${OPTIONS}
	for opt in "$@"; do
		case ${opt} in
			-n) name=${3}; shift 2;;
			--name) name=${3}; shift;;
			--) shift; break;;
		esac
		shift
	done
	sudo sh -c "cat - | gpg --dearmor > /etc/apt/trusted.gpg.d/${name}.gpg"
else
	specific=$(file ${1} | awk '{print $2}')
	name=${2}
	if [ "${specific}" = "UTF-8" -o "${specific}" = "ASCII" ]; then
		sudo sh -c "gpg --dearmor ${1} > /etc/apt/trusted.gpg.d/${name}.gpg"
	fi
fi
