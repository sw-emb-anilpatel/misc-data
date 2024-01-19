#!/bin/sh

while true
do
        gst-launch-1.0 uridecodebin uri=file:/home/root/EDVT_TI_THERMAL/Tom_and_Jerry.mp4 ! waylandsink display=/run/wayland-0  > /dev/null 2>&1
        sleep 5
done

