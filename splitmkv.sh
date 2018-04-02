#!/bin/sh

echo "Set Chapter Range."
echo "Please from chapter number."
read from
echo "Please to chapter number"
read to
echo "Last Input output name."
read out
mkvmerge -o ${out}.mkv --split chapters:${from},${to} ${1}
