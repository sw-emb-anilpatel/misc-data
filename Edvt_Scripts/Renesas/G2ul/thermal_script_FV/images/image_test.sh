#!/bin/sh

#sleep 60


# Set environment variables
export DISPLAY=:0  # Replace :0 with your display number if needed
export XDG_RUNTIME_DIR=/run/user/$(id -u)



while [ 1 ]
do
	FILE=/tmp/display_param_export
	if [ -f "$FILE" ]
	then
        	echo "gpio alredy exported"
        	gst-launch-1.0 multifilesrc location="/home/root/images/image%02d.png" index=1 caps="image/png,framerate=1/8" loop=true ! decodebin ! videoconvert ! videoscale ! video/x-raw,width=1280,height=800 ! autovideosink
        	#gst-launch-1.0 multifilesrc location="/home/root/images/image%02d.png" index=1 caps="image/png,framerate=1/8" ! decodebin ! videoconvert ! videoscale ! video/x-raw,width=1280,height=800 ! waylandsink
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

	        gst-launch-1.0 multifilesrc location="/home/root/images/image%02d.png" index=1 caps="image/png,framerate=1/8" loop=true ! decodebin ! videoconvert ! videoscale ! video/x-raw,width=1280,height=800 ! autovideosink
	        #gst-launch-1.0 multifilesrc location="/home/root/images/image%02d.png" index=1 caps="image/png,framerate=1/8" ! decodebin ! videoconvert ! videoscale ! video/x-raw,width=1280,height=800 ! waylandsink
	fi
	sleep 5
done
