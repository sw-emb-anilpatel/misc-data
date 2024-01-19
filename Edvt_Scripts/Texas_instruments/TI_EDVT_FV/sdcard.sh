#!/bin/sh

while true
do

    echo "q w e r t y u i o p a s d f g h j k l z x c v b n m" > /home/root/sdcard.txt
    strcmp=$(cat /home/root/sdcard.txt)
    if [ "$strcmp" == "q w e r t y u i o p a s d f g h j k l z x c v b n m" ]
    then
	date=`date`		
        echo "[SDCARD $date]: sdcard test done"
    else
        echo "[SDCARD $date]: sdcard test fail"
    fi
    sleep 2
done
