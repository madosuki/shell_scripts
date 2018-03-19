#!/usr/bin/bash

installlist=("")
ffmpegOptions="--enable-gpl --enable-nonfree"
tmpvar=""

x86path=${HOME}"/build_ffmpeg/x86"
x86_64path=${HOME}"/build_ffmpeg/x86_64"
toppath=${HOME}"/build_ffmpeg"

function CheckNonArchDepCommand() {
    for n in "$@"
    do
        if ! type $n > /dev/null 2>&1; then
            pacman -S --noconfirm $n
        fi
    done
    buildFFmpeg
}

function CheckArchDepBuildTools() {
    case "$1" in
    "1" )
    for n in "$@"
    do
        if [ ! -f /mingw32/bin/$n.exe ]; then
            case "$n" in
            "gcc" ) installlist+=" mingw-w64-i686-gcc ";;
            "yasm" ) installlist+=" mingw-w64-i686-yasm ";;
            "pkg-config" ) installlist+=" mingw-w64-i686-pkg-config ";;
            "x264" ) installlist+=" mingw-w64-i686-x264-git ";;            
            esac
        fi

        if [ -f /mingw32/lib/$n.dll ]; then
            case "$n" in
            "SDL2" ) installlist+=" mingw-w64-i686-SDL2 ";;
            "libvpx" ) installlist+=" mingw-w64-i686-libvpx ";;
            "libopus-0" ) installlist+=" mingw-w64-i686-opus ";;
            "libvorbis-0" ) installlist+=" mingw-w64-i686-libvorbis ";;
            
            esac
        fi

        if [ $n = libtool ]; then
            if [ ! -f /mingw64/bin/libtool ]; then
                installlist+=" mingw-w64-x86_64-libtool "
            fi
        fi

        if [ $n = fdk-aac ]; then
            if [ ! -f /mingw64/lib/libfdk-aac.a ]; then
                installlist+=" mingw-w64-x86_64-fdk-aac "
            fi
        fi

    done;;
    "2" )
    for n in "$@"
    do
        if [ ! -f /mingw64/bin/$n.exe ]; then
            case "$n" in
            "gcc" ) installlist+=" mingw-w64-x86_64-gcc ";;
            "yasm" ) installlist+=" mingw-w64-x86_64-yasm ";;
            "pkg-config" ) installlist+=" mingw-w64-x86_64-pkg-config ";;
            esac
        fi

        if [ $n = "libtool" ]; then
            if [ ! -f /mingw64/bin/libtool ]; then
                installlist+=" mingw-w64-x86_64-libtool "
            fi
        fi

        if [ $n = "libfdk-aac" ]; then
            if [ ! -f /mingw64/lib/libfdk-aac.a ]; then
                installlist+=" mingw-w64-x86_64-fdk-aac "
            fi
        fi

        if [ $n = "x264" ]; then
            if [ ! -f /mingw64/lib/libx264.a ]; then
                installlist+=" mingw-w64-x86_64-x264-git "
            fi
        fi

        if [ $n = "libmp3lame" ]; then
            if [ ! -f /mingw64/lib/libmp3lame.a ]; then
                installlist+=" mingw-w64-x86_64-lame "
            fi
        fi

        if [ $n = "opus" ]; then
            if [ ! -f /mingw64/lib/libopus.a ]; then
                installlist+=" mingw-w64-x86_64-opus "
            fi
        fi

        if [ $n = "libvorbis" ]; then
            if [ ! -f /mingw64/lib/libvorbis.a ]; then
                installlist+=" mingw-w64-x86_64-libvorbis "
            fi
        fi

        if [ $n = "libvpx" ]; then
            if [ ! -f /mingw64/lib/libvpx.a ]; then
                installlist+=" mingw-w64-x86_64-libvpx "
            fi
        fi

    done;;
    esac
    if [ ! ${#installlist[*]} -eq 0 ]; then
        for name in ${installlist[@]}; do
            pacman -S --noconfirm ${name}
        done
    fi
}

function setConfigureFFmpeg() {
    case "$arch" in
    "1" )
    for n in "$@"
    do
 #       if [ -f /mingw32/bin/$n.dll ]; then
 #           case "$n" in
 #           "libx264-148" ) ffmpegOptions=$ffmpegOptions" --enable-libx264 ";;
 #           "SDL2" ) ffmpegOptions=$ffmpegOptions" --enable-libsdl2 ";;
 #           "libvpx" ) ffmpegOptions=$ffmpegOptions" --enable-libvpx ";;
 #           "libopus-0" ) ffmpegOptions=$ffmpegOptions" --enable-libopus";;
 #           "libvorbis-0" ) ffmpegOptions=$ffmpegOptions" --enable-libvorbis";;
            
 #           esac
 #       fi

        if [ $n = "libfdk-aac" ]; then
            if [ -f /mingw32/lib/libfdk-aac.a ]; then
                ffmpegOptions+=" --enable-libfdk-aac "
            fi
        fi

        if [ $n = "x264" ]; then
            if [ -f /mingw32/lib/libx264.a ]; then
                ffmpegOptions+=" --enable-libx264 "
            fi
        fi

                if [ $n = "SDL2" ]; then
            if [ -f /mingw32/lib/libSDL2.a ]; then
                ffmpegOptions+=" --enable-sdl2 "
            fi
        fi

                if [ $n = "libmp3lame" ]; then
            if [ -f /mingw32/lib/libmp3lame.a ]; then
                ffmpegOptions+=" --enable-libmp3lame "
            fi
        fi

                if [ $n = "opus" ]; then
            if [ -f /mingw32/lib/libopus.a ]; then
                ffmpegOptions+=" --enable-libopus "
            fi
        fi

                if [ $n = "libvorbis" ]; then
            if [ -f /mingw32/lib/libvorbis.a ]; then
                ffmpegOptions+=" --enable-libvorbis "
            fi
        fi

                if [ $n = "libvpx" ]; then
            if [ -f /mingw32/lib/libvpx.a ]; then
                ffmpegOptions+=" --enable-libvpx "
            fi
        fi

    done;;
    "2" )
    for n in "$@"
    do

        if [ $n = "libfdk-aac" ]; then
            if [ -f /mingw64/lib/libfdk-aac.a ]; then
                ffmpegOptions+=" --enable-libfdk-aac "
            fi
        fi

        if [ $n = "x264" ]; then
            if [ -f /mingw64/lib/libx264.a ]; then
                ffmpegOptions+=" --enable-libx264 "
            fi
        fi

        if [ $n = "SDL2" ]; then
            if [ -f /mingw64/lib/libSDL2.a ]; then
                ffmpegOptions+=" --enable-sdl2 "
            fi
        fi

        if [ $n = "libmp3lame" ]; then
            if [ -f /mingw64/lib/libmp3lame.a ]; then
                ffmpegOptions+=" --enable-libmp3lame "
            fi
        fi

        if [ $n = "opus" ]; then
            if [ -f /mingw64/lib/libopus.a ]; then
                ffmpegOptions+=" --enable-libopus "
            fi
        fi

        if [ $n = "libvorbis" ]; then
            if [ -f /mingw64/lib/libvorbis.a ]; then
                ffmpegOptions+=" --enable-libvorbis "
            fi
        fi

        if [ $n = "libvpx" ]; then
            if [ -f /mingw64/lib/libvpx.a ]; then
                ffmpegOptions+=" --enable-libvpx "
            fi
        fi

    done;;
    esac
}

function updateffmpeg() {
    make distclean
    git pull
}

function buildFFmpeg() {

    case "$arch" in
    "1")
    if [ ! -e ${HOME}/ffmpeg ]; then
        git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg && cd ${HOME}/ffmpeg
        setConfigureFFmpeg x264 SDL2 libvpx opus libvorbis libmp3lame libfdk-aac SDL2
        ./configure --prefix=${x86path} ${ffmpegOptions} --enable-static
        make -j4 && make install

    elif [ -e ${HOME}/ffmpeg ]; then
        cd ${HOME}/ffmpeg
        updateffmpeg
        setConfigureFFmpeg x264 SDL2 libvpx opus libvorbis libmp3lame libfdk-aac SDL2
        ./configure --prefix=${x86path} ${ffmpegOptions} --enable-static
        make -j4 && make install
    fi

    "2")
    if [ ! -e ${HOME}/ffmpeg ]; then
        git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg && cd ${HOME}/ffmpeg
        setConfigureFFmpeg x264 SDL2 libvpx opus libvorbis libmp3lame libfdk-aac SDL2
        ./configure --prefix=${x86_64path} ${ffmpegOptions} --enable-static
        make -j4 && make install

    elif [ -e ${HOME}/ffmpeg ]; then
        cd ${HOME}/ffmpeg
        updateffmpeg
        setConfigureFFmpeg x264 SDL2 libvpx opus libvorbis libmp3lame libfdk-aac SDL2
        ./configure --prefix=${x86_64path} ${ffmpegOptions} --enable-static
        make -j4 && make install
    fi
    esac
}

echo "32bit(1) or 64bit(2)? > "
while :
do
    read arch
    case "$arch" in
    "1" ) 
        echo $arch
        CheckArchDepBuildTools ${arch} gcc yasm pkg-config libtool SDL2 fdk-aac libvpx libopus-0 libvorbis-0
        break;;
    "2" )
        echo $arch
        CheckArchDepBuildTools ${arch} gcc yasm pkg-config libtool SDL2 libfdk-aac libvpx opus libvorbis x264 libmp3lame
        break;;
    * ) echo "Please input '32bit(1)' or '64bit(2)'";;
    esac
done

CheckNonArchDepCommand make autoconf automake unzip tar git