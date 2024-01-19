#!/bin/sh

 

if [ -d "/home/root/csi_images" ]
then
        echo "path alredy exist"
else
        mkdir /home/root/csi_images
fi

 

media-ctl --set-v4l2 "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1280x720@1/30 field:none]"
sleep 3

while true
do
        for number in {1..10}
        do
                echo "caputring image $number ..."
                #gst-launch-1.0 v4l2src num-buffers=1 device=/dev/video0 ! video/x-raw , width=1280, height=720 ! jpegenc ! multifilesink location=/home/root/csi_images/$number.jpg
		gst-launch-1.0 v4l2src num-buffers=10 device=/dev/video0 ! video/x-raw , width=1280, height=720 ! jpegenc ! multifilesink location=/home/root/csi_images/image_1280x720_%d.jpg
                sleep 15
        done
done
