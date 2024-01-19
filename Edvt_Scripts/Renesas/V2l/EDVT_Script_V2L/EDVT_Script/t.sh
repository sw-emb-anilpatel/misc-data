#!/bin/sh

while [ 1 ]
do 
	i2cget -f -y 2 0x30 0x4d &> /dev/ttySC1 
done
