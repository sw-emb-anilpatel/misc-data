#!/bin/sh

(`echo 319 > /sys/class/gpio/export`) > /dev/null 2>&1
`echo out > /sys/class/gpio/gpio319/direction`

while true
do
val=`cat /proc/mtd`

for((index=0;index<=30;index++))
do
    a=`echo "$val" | grep "mtd$index" | wc -l`
    if [ $a == 1 ]
    then
        if [[ ($index == 0) || ($index == 1) ]]
        then
            echo "mtd$index"
            ( `dd if=/dev/urandom of=./spibootloader.img bs=4k count=4` ) > /dev/null 2>&1
            sleep 1
            ( `dd if=./spibootloader.img of=/dev/"mtd$index" bs=4k count=4` ) > /dev/null 2>&1
            sleep 1
            ( `dd if=/dev/"mtd$index" of=./respibootloader.img bs=4k count=4` ) > /dev/null 2>&1
            if [ -f ./spibootloader.img ]
            then
                    date=`date`
                    main_img=$(md5sum ./spibootloader.img | awk '{print $1}')
                    secd_img=$(md5sum ./respibootloader.img | awk '{print $1}')
                    #echo "main_img : $main_img"
                    #echo "secd_img : $secd_img"
                    if [ $main_img == $secd_img ]
                    then
                            echo "[SPI $date]: spi flash test successful"
                    else
                            echo "[SPI $date]: spi flash test fail"
        		    `echo 1 > /sys/class/gpio/gpio319/value`                        
        	            sleep 0.1                                                       
        		    `echo 0 > /sys/class/gpio/gpio319/value`                                            
        		    sleep 0.1  
                    fi
            else
                    echo "[SPI $date]: file error"
		    `echo 1 > /sys/class/gpio/gpio319/value`
                    sleep 0.1
                    `echo 0 > /sys/class/gpio/gpio319/value`
                    sleep 0.1
            fi
            flash_erase /dev/"mtd$index" 0 0 > /dev/null 2>&1 
            rm ./spibootloader.img
            rm ./respibootloader.img
            #echo "wait for 10 sec..."
            sleep 1
        fi
    fi
done
done

