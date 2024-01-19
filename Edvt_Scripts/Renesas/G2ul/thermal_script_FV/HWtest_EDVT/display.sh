#!/bin/sh

FILE=/tmp/display_param_export
if [ -f "$FILE" ]
then
        #echo "gpio alredy exported"
        /usr/share/qt5/examples/widgets/widgets/analogclock/analogclock
else

        echo 0 > /sys/class/pwm/pwmchip0/export

        echo 1000000 > /sys/class/pwm/pwmchip0/pwm0/period
        echo 500000 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle
        echo 1 > /sys/class/pwm/pwmchip0/pwm0/enable

        echo 345 > /sys/class/gpio/export
        echo out > /sys/class/gpio/gpio345/direction
        echo 1 > /sys/class/gpio/gpio345/value


        echo 346 > /sys/class/gpio/export
        echo out > /sys/class/gpio/gpio346/direction
        echo 1 > /sys/class/gpio/gpio346/value
        echo 317 > /sys/class/gpio/export
        echo out > /sys/class/gpio/gpio317/direction
        echo 1 > /sys/class/gpio/gpio317/value

        touch /tmp/display_param_export

        /usr/share/qt5/examples/widgets/widgets/analogclock/analogclock
fi

