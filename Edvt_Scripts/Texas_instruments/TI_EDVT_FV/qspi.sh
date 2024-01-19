#!/bin/sh

while true
do
val=`cat /proc/mtd`

for((index=0;index<=30;index++))
do
    a=`echo "$val" | grep "mtd$index" | wc -l`
    if [ $a == 1 ]
    then
        if [ $index == 0 ]
        then
            echo "mtd$index"
            ( `dd if=/dev/urandom of=./qspibootloader.img bs=4k count=4` ) > /dev/null 2>&1
            sleep 1
            ( `dd if=./qspibootloader.img of=/dev/"mtd$index" bs=4k count=4` ) > /dev/null 2>&1
            sleep 1
            ( `dd if=/dev/"mtd$index" of=./reqspibootloader.img bs=4k count=4` ) > /dev/null 2>&1
            if [ -f qspibootloader.img ]
            then
	            date=`date`
                    main_img=$(md5sum ./qspibootloader.img | awk '{print $1}')
                    secd_img=$(md5sum ./reqspibootloader.img | awk '{print $1}')
                    #echo "main_img : $main_img"
                    #echo "secd_img : $secd_img"
                    if [ $main_img == $secd_img ]
                    then
                            echo "[QSPI $date]: qspi flash test successful"
                    else
                            echo "[QSPI $date]: qspi flash test fail"
                    fi
            else
                    echo "[QSPI $date]: file error"
            fi
            flash_erase /dev/"mtd$index" 0 0 > /dev/null 2>&1
            rm ./qspibootloader.img
            rm ./reqspibootloader.img
            #echo "wait for 10 sec..."
            sleep 2
        fi
    fi
done
done
