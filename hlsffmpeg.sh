ffmpeg -i a.mp4 -c copy -bsf:v h264_mp4toannexb -flags +loop-global_header -f segment -segment_format mpegts -segment_time 10 -segment_list happy.m3u8 split_%04d.ts
