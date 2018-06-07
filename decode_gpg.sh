#!/bin/sh

echo "Plase input output name."
out=read
gpg --output ${out} --decrypt ${1}
