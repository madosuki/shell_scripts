#!/bin/sh

sudo efibootmgr -c -d ${1} -p ${2} -L "shims" -l "\EFI\gentoo\BOOTX64.EFI"
