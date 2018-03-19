#!/bin/sh

if [[ $1 =~ "m3u8" ]]; then
    ffmpeg -i $1 -movflags faststart -c copy -bsf:a aac_adtstoasc $2
else
    echo "Please m3u8 file url And Output Name."
fi
