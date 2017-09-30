#!/bin/sh
date -s '2000-01-01 00:00:00'

ifconfig eth0 192.168.128.3 netmask 255.255.255.0  up
ifconfig lo up

export LD_LIBRARY_PATH=/mnt/lib:/mnt/usr-lib
export PATH=$PATH:/mnt/bin

cd /mnt/module
szgpio.sh

# Wakening Jetson TK1 
zgpio /dev/zgpio1 set2 40000000
sleep 2
zgpio /dev/zgpio1 set2 00000000

# Wakening Jetson TX1
/mnt/jtxon.sh 100

# Starting aws1
cd /mnt
nohup aws > /dev/null &
sleep 3
cd /mnt/aws1_scripts
./aws1_zed.aws ctrl nmea ahrs env


