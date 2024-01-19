#!/bin/sh

echo 0 > /sys/class/pwm/pwmchip0/unexport
echo "[PWM]: PWM test started"

echo 0 > /sys/class/pwm/pwmchip0/export
echo 1000000 > /sys/class/pwm/pwmchip0/pwm0/period
echo 500000 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle
echo 1 > /sys/class/pwm/pwmchip0/pwm0/enable
echo "[PWM]: PWM run finished"

