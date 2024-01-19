#!/bin/sh

`echo 317 > /sys/class/gpio/export`
`echo out > /sys/class/gpio/gpio317/direction`
#`echo 1 > /sys/class/gpio/gpio317/value`
