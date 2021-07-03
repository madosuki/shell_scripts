#!/bin/sh

sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --modules="tpm" --disable-shim-lock
