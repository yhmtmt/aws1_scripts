#!/bin/sh
date -s '2000-01-01 00:00:00'

ifconfig eth0 192.168.128.3 netmask 255.255.255.0  up
ifconfig lo up

export LD_LIBRARY_PATH=/mnt/lib:/mnt/usr-lib
export PATH=$PATH:/mnt/bin

cd /mnt/module
szgpio.sh

# Wakening Jetson TK1
cd /mnt/aws1_scripts
if [ -e reboot_from_hsys ]; then
    rm reboot_from_hsys
else
    zgpio /dev/zgpio1 set2 40000000
    sleep 2
    zgpio /dev/zgpio1 set2 00000000
fi

# Wakening Jetson TX1
/mnt/jtxon.sh 100





