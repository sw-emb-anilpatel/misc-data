#!/bin/sh

(`echo 319 > /sys/class/gpio/export`) > /dev/null 2>&1
`echo out > /sys/class/gpio/gpio319/direction`

if [ -d "/mnt/hwtestsdcard" ]
then
	echo "[SDCARD] /mnt/hwtestsdcard is exist.... "
else
`mkdir /mnt/hwtestsdcard`
fi

value=`ls /dev/mmcblk* | grep -i "mmcblk$1p1"`

echo $value

while true
do
if [ "$value" == "/dev/mmcblk$1p1" ]
then
	date=`date`
        (mount  $value /mnt/hwtestsdcard) > /dev/null 2>&1
        sleep 2
	echo "emmc hw test done" > /mnt/hwtestsdcard/sdcard_hw.txt
	strcmp=$(cat /mnt/hwtestsdcard/sdcard_hw.txt)
        if [ "$strcmp" == "emmc hw test done" ]
        then
        	echo "[SDCARD $date]: sdcard test done"
        else
        	echo "[SDCARD $date]: sdcard test fail"
		`echo 1 > /sys/class/gpio/gpio319/value`                        
        	sleep 0.1                                                       
        	`echo 0 > /sys/class/gpio/gpio319/value`                                            
        	sleep 0.1 
        fi
        umount $value
	#echo "sdcard umount Done.."
        sleep 2
fi
done
