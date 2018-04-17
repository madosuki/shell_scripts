#!/bin/sh

check=`brew list | grep ffmpeg`

function install_ffmpeg() {
    brew install ffmpeg --with-fdk-aac --with-sdl2 --with-freetype --with-libass --with-libvorbis --with-libvpx --with-opus --with-x265 --with-rtmpdump --withh-rubberband --with-tools --with-xz --with-zimg --with-webp --with-opencore-amr --wtih-openssl --with-openjpeg --wtih-snappy --HEAD
    brew install mpv --with-bundle
}


if [ -z ${check} ]; then
    install_ffmpeg
else
    brew reinstall ffmpeg
    brew reinstall mpv
fi
