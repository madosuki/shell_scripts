#!/bin/sh

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig:/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig
export AS="as -arch x86_64"
export CC="cc -arch x86_64 -framework CoreFoundation"

mkbundle $1 --deps -o $2 --sdk /Library/Frameworks/Mono.framework/Versions/Current
