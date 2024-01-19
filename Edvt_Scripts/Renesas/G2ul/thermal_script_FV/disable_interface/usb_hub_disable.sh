#!/bin/sh

`echo 328 > /sys/class/gpio/export`
`echo out > /sys/class/gpio/gpio328/direction`
#`echo 1 > /sys/class/gpio/gpio328/value`
