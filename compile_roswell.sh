#!/bin/sh

cd ~/roswell
make uninstall && make distclean
git pull
./bootstrap && ./configure --prefix=/Users/kouf/.local && make -j2 && make install
