#!/bin/sh

sudo sbsign --key MOK.key --cert MOK.crt --output ${1} ${1}
sudo sbsign --key MOK.key --cert MOK.crt --output ${2} ${2}
