#!/bin/sh

ffmpeg -i $1 -c copy -hls_list_size 0 -hls_segment_type fmp4 $2
