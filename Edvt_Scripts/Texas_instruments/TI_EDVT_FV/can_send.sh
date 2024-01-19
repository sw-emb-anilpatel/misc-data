#!/bin/sh

`ip link set can0 down`
`ip link set can0 type can bitrate 333333 dbitrate 666666 fd on`
`ip link set can0`
`ip link set can0 up`

while true
do
	date=`date`
        echo "[CAN $date]: CAN data send successful" 
	cansend can0 123#01020304050607
        sleep 3
done

