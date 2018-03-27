#!/bin/sh

x264_params='crf=18'
audiocodec='aac'
audio_kb='256k'
fps='-r 24000/1001'
out='out.mp4'
# bwdif option order mode(0=from 2field, 1=from one side field) to parity(either priority top or bottom) to deint(0=all,1=target interlaced field)
# decimate is field decimation
vf='bwdif=0:-1:1,decimate,crop=704:480:8:0'

ffmpeg -i ${1} -c:v libx264 -x264-params ${x264_params} -c:a ${audiocodec} -b:a ${audio_kb} -pix_fmt yuv420p -lavfi ${vf} ${fps} ${out}
