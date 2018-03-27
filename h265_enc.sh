#!/bin/sh

filepath=${1}

jqcommand=".streams[].field_order"
jqoptions=""

data=`ffprobe -v quiet -show_streams -of json ${filepath}`
fieldorder=`echo ${data} | jq ${jqoptions} ${jqcommand}`
IF=' '
set -- ${fieldorder}


# Please add next line writed option to Multi track.
# "-map 0:2"

# deblock=1
x265params="crf=18:colormatrix=bt709:transfer=bt709:colorprim=bt709:me=Umh:subme=4:weightb:qcomp=0.8:bframes=6" 

filterparams="dejudder"

echo "Please Input FPS value. to select 24 or 30 or 60"
read fps

if [ ${fps} = 24 ]; then
    filterparams+=",fps=24000/1001"
fi

checkstr="\"progressive\""
if [ ${1} != ${checkstr} ]; then
    filterparams+=",pullup"
fi

ffmpeg -i ${filepath} -c:v libx265 -x265-params ${x265params} -filter_complex ${filterparams} -c:a libfdk_aac -b:a 320k -sn -map 0:0 -map 0:1 -pix_fmt yuv420p -tag:v hvc1 result.mp4
