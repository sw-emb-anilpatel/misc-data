#!/bin/sh

if [ -d "/mnt/hwtestdir" ]
then
        echo "[USB] /mnt/hwtestdir is exist.... " > /dev/null
else
`mkdir /mnt/hwtestdir`
fi

while true
do
date=`date`
val=`lsblk -o name | grep -i sd | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]'`
num=`lsblk -o name | grep -i sd | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]' | wc -l`
if [ "$num" -ne 0 ]
then
for a in $val
do
        condition=`ls /dev/$a | wc -l`
        num=$(grep -o '[[:digit:]]*' <<< "/dev/$a")
        if [ $condition -ne 0 ]
        then
                if [ $num ]
                then
                        echo "/dev/$a is present"
                        mount /dev/$a /mnt/hwtestdir > /dev/null 2>&1
                        sleep 2
                        echo "usb hw test done" > /mnt/hwtestdir/name.txt
                        strcmp=$(cat /mnt/hwtestdir/name.txt)
                        if [ "$strcmp" == "usb hw test done" ]
                        then
                                echo "[USB $date]: USB test done"
                        else
                                echo "[USB $date]: USB test fail"
                        fi
                        #rm /mnt/hwtestdir/name.txt
                        umount /dev/$a > /dev/null 2>&1
                        sleep 2
                fi
        else
                echo "/dev/$a is not present"
         fi
done
else
        echo "[USB $date]: No device connected"
fi
done

