#!/bin/sh

`echo 325 > /sys/class/gpio/export`
`echo out > /sys/class/gpio/gpio325/direction`
#`echo 1 > /sys/class/gpio/gpio325/value`
