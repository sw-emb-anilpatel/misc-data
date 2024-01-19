#!/bin/sh

(`echo 319 > /sys/class/gpio/export`) > /dev/null 2>&1
`echo out > /sys/class/gpio/gpio319/direction`

if [ -d "/mnt/hwtestdir" ]
then
        echo "[USB] /mnt/hwtestdir is exist.... " > /dev/null
else
`mkdir /mnt/hwtestdir`
fi

val=`lsblk -o name | grep -i sd | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]' | grep -E '[0-9]'`
echo "$val"

while true
do
date=`date`
new_val=`lsblk -o name | grep -i sd | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]' | grep -E '[0-9]'`
num=`lsblk -o name | grep -i sd | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]' | wc -l`
if [ "$num" -ne 0 ]
then
for a in $val
do
        echo "$new_val"
	condition=`ls /dev/$a | wc -l`
        num=$(grep -o '[[:digit:]]*' <<< "/dev/$a")
        if [ $condition -ne 0 ]
        then
                if [ $num ]
                then
                        echo "/dev/$a is present"
                        (mount /dev/$a /mnt/hwtestdir) > /dev/null 2>&1
                        sleep 2
                        (echo "usb hw test done" > /mnt/hwtestdir/name.txt) > /dev/null 2>&1
                        strcmp=$(cat /mnt/hwtestdir/name.txt)
                        if [ "$strcmp" == "usb hw test done" ]
                        then
                                echo "[USB $date]: USB test done"
                        else
                                echo "[USB $date]: USB test fail"                                                                      
        			`echo 1 > /sys/class/gpio/gpio319/value`                        
        			 sleep 0.1                                                       
        			`echo 0 > /sys/class/gpio/gpio319/value`                                            
        			sleep 0.1                                                       
                        fi
                        #rm /mnt/hwtestdir/name.txt
                        umount /dev/$a > /dev/null 2>&1
                        sleep 2
                fi
        else
                echo "/dev/$a is not present"
               `echo 1 > /sys/class/gpio/gpio319/value`
                sleep 0.1                              
               `echo 0 > /sys/class/gpio/gpio319/value`
                sleep 0.1   
	fi
done
else
        echo "[USB $date]: No device connected"
	`echo 1 > /sys/class/gpio/gpio319/value`
        sleep 0.1                       
        `echo 0 > /sys/class/gpio/gpio319/value`
        sleep 0.1   
fi
done

