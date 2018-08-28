#!/bin/sh

ffmpeg -i test.mp4 -vcodec libaom-av1 -crf 30 -cpu-used 4 -acodec libopus -b:a 192k -strict -2 test.mkv
