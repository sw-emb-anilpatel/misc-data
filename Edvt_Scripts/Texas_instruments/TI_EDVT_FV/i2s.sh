#!/bin/sh

`./en_hadphon.sh`
`./en_line.sh`
`i2cset -f -y 0 0x1a 0xf0 0x8B`
`i2cset -f -y 0 0x1a 0xf1 0x03` 
`i2cset -f -y 0 0x1a 0xf0 0x00`
while true
do
	aplay "./1.wav"
	aplay "./2.wav"
	aplay "./3.wav"
	aplay "./4.wav"
	aplay "./5.wav"
	aplay "./6.wav"
	aplay "./7.wav"
done

