#!/bin/sh

if [ $2 == 1 ]
then
while true
do
    date=`date`
    echo "q w e r t y u i o p a s d f g h j k l z x c v b n m" > /home/root/emmccard.txt
    strcmp=$(cat /home/root/emmccard.txt)
    if [ "$strcmp" == "q w e r t y u i o p a s d f g h j k l z x c v b n m" ]
    then
        echo "[EMMC $date]: emmc test done"
    else
        echo "[EMMC $date]: emmc test fail"
    fi
    sleep 5
done
	
fi

if [ -d "/mnt/hwtestemmc" ]
then
	echo "[EMMC] /mnt/hwtestemmc is exist.... "
else
`mkdir /mnt/hwtestemmc`
fi

value=`ls /dev/mmcblk* | grep -i "mmcblk$1p1"`

echo $value

while true
do
if [ "$value" == "/dev/mmcblk$1p1" ]
then
        mount  $value /mnt/hwtestemmc > /dev/null 2>&1
        sleep 2
	echo "emmc hw test done" > /mnt/hwtestemmc/emmc_hw.txt
	strcmp=$(cat /mnt/hwtestemmc/emmc_hw.txt)
        if [ "$strcmp" == "emmc hw test done" ]
        then
        echo "[EMMC]: emmc test done"
        else
        echo "[EMMC]: emmc test fail"
        fi
        #umount $value
	#echo "emmc umount Done.."
        sleep 2
fi
done
