#!/bin/sh

while [ true ]
do

date=`date`
iw wlan0 scan | grep -i SSID
sleep 2
done
