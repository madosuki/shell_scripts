#!/bin/sh

ffmpeg -i title00.mkv -map 0:0 -map 0:3 -map 0:1 -c:v copy -c:a copy -metadata:s:a:0 track=1 -metadata:s:a:0 language=ja -disposition:s:a:0 default -metadata:s:a:1 track=2 tmp.mkv

mkvpropedit tmp.mkv --edit tack:a1 --set flag-default=1
