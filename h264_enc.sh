#!/bin/sh

dvd='smpte170m'
normal='bt709'
colormatrix="colormatrix=${dvd}"
# 24fps keyint 240
x264_params="-x264-params "crf=18:keyint=300:me=umh:b-adapt=2:partitions=all:${colormatrix}""
# libfdk_aac or aac(ffmpeg native aac encoder)
audio_kb='256k'
audiooption="libfdk_aac -b:a ${audio_kb}"
setfps="-r 30000/10001"
yuv="-pix_fmt yuv420p"
out="EP${2}.mp4"
# bwdif option order mode(0=from 2field, 1=from one side field) to parity(either priority top or bottom) to deint(0=all,1=target interlaced field)
# decimate is field decimation
# 24fps bwdif=0:-1:1,decimate
# 30fps bwdif=0:-1:1
vf='bwdif=0:-1:1,crop=704:480:8:0'
ffmpeg -i ${1} -c:v libx264 ${x264_params} -c:a ${audiooption}  ${yuv} -lavfi ${vf} ${setfps} ${out}
