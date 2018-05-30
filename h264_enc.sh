#!/bin/sh

dvd='smpte170m'
normal='bt709'
colormatrix="colormatrix=${dvd}"
tvrange="-color_range 1"
pcrange="-color_range 2"
# 24fps keyint 240
# 30fps keyint 300
# 60fps keyint 600
x264_params="-x264-params "crf=18:keyint=300:me=umh:bframes=0:b-adapt=0:partitions=all:${colormatrix}""
mp4="-movflags faststart"
# libfdk_aac or aac(ffmpeg native aac encoder)
audio_kb='320k'
audiooption="libfdk_aac -b:a ${audio_kb} -cutoff 20000"
yuv="-pix_fmt yuv420p"
out="${2}.mp4"
# bwdif option order mode(0=from 2field, 1=from one side field) to parity(either priority top or bottom) to deint(0=all,1=target interlaced field)
# decimate is field decimation
# 24fps bwdif=0:-1:1,decimate
# 30fps bwdif=0:-1:1
dvdvf=",crop=704:480:8:0" #,scale=704:396:flags=lanczos"
vf="bwdif=0:-1:1${dvdvf}"
# vf="bwdif=0:-1:1,decimate${dvdvf}"
# vf="nnedi=weights='./nnedi3_weights.bin':deint=1:field=af${dvdvf}"
aspect="-aspect 4:3"
ffmpeg -i ${1} -c:v libx264 ${x264_params} ${aspect} -c:a ${audiooption} ${yuv} -lavfi ${vf} -r 30000/1001 ${tvrange} ${mp4} ${out}
