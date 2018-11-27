#!/bin/sh

cd ~/.rbenv
git pull
src/configure && make -C src
cd ~/.rbenv/plugins/ruby-build
git pull
