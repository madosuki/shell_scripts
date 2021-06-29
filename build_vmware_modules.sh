#!/bin/sh

sudo vmware-modconfig --console --build-mod vmmon
sudo vmware-modconfig --console --build-mod vmnet
sudo vmware-modconfig --console --build-mod vmci

sudo modprobe vmmon
sudo modprobe vmnet
sudo modprobe vmci
