#!/bin/sh

# 24fps keyint 240
x264_params='crf=18,keyint=300,me=umh,b-adapt=2,partitions=all'
# libfdk_aac or aac(ffmpeg native aac encoder)
audiocodec='libfdk_aac'
audio_kb='256k'
fps='-r 30000/1001'
out='out.mp4'
# bwdif option order mode(0=from 2field, 1=from one side field) to parity(either priority top or bottom) to deint(0=all,1=target interlaced field)
# decimate is field decimation
# 24fps bwdif=0:-1:1,decimate
# 30fps bwdif=0:-1:1
vf='bwdif=0:-1:1,crop=704:480:8:0'

ffmpeg -i ${1} -c:v libx264 -x264-params ${x264_params} -c:a ${audiocodec} -b:a ${audio_kb} -pix_fmt yuv420p -lavfi ${vf} ${fps} ${out}
