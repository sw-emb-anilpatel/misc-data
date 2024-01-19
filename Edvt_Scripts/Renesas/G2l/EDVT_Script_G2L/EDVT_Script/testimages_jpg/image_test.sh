!/bin/sh

FILE=/tmp/display_param_export
if [ -f "$FILE" ]
then
        echo "gpio alredy exported"
        gst-launch-1.0 multifilesrc location="image%01d.jpg" index=1 caps="image/jpeg,framerate=1/8" ! decodebin ! videoconvert ! videoscale ! video/x-raw,width=1280,height=720 ! autovideosink
else

        echo 0 > /sys/class/pwm/pwmchip0/export

        echo 1000000 > /sys/class/pwm/pwmchip0/pwm0/period
        echo 500000 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle
        echo 1 > /sys/class/pwm/pwmchip0/pwm0/enable

        touch /tmp/display_param_export
	
	gst-launch-1.0 multifilesrc location="image%01d.jpg" index=1 caps="image/jpeg,framerate=1/8" ! decodebin ! videoconvert ! videoscale ! video/x-raw,width=1280,height=720 ! autovideosink
        
fi

