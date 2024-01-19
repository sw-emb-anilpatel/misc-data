#!/bin/sh

if [ -d "/home/root/csi_images" ]
then
        echo "[CSI]: path alredy exist"
else
        mkdir /home/root/csi_images
fi

media-ctl -d /dev/media0 -r
sleep 3
media-ctl -d /dev/media0 -l "'rzg2l_csi2 10830400.csi2':1 -> 'CRU output':0 [1]"
sleep 3
media-ctl -d /dev/media0 -V "'rzg2l_csi2 10830400.csi2':1 [fmt:UYVY8_2X8/1280x720 field:none]"
sleep 3
media-ctl -d /dev/media0 -V "'ov5640 3-003c':0 [fmt:UYVY8_2X8/1280x720 field:none]"
sleep 3
while true
do
        for number in {1..10}
        do
         	date=`date`
	 	echo "[ CSI: $date ]: caputring image $number ..."
                gst-launch-1.0 v4l2src num-buffers=1 device=/dev/video0 ! videoconvert ! jpegenc ! multifilesink location=/home/root/csi_images/$number.jpg > /dev/null
                sleep 15
        done
done

