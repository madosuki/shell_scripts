#!/bin/sh

find /Volumes/Ext/* -name ".DS_Store" -print0 | xargs -0 rm
find /Volumes/Ext/* -name "._*" -print0 | xargs -0 rm
