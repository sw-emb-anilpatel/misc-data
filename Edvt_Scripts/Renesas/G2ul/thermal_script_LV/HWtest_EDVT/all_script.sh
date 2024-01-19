#!/bin/sh

./i2c.sh &>> /home/root/log/i2c.txt &
echo "i2c script is running"
sleep 1

./usb.sh &>> /home/root/log/usb.txt &
echo "usb script is running"
sleep 1

./spi.sh &>> /home/root/log/spi.txt &
echo "spi script is running"
sleep 1

./csi.sh &>> /home/root/log/csi.txt &
echo "csi script is running"
sleep 1

./pwm.sh &>> /home/root/log/pwm.txt &
echo "pwm script is running"
sleep 1

./emmc.sh 1 1 &>> /home/root/log/emmc.txt &
echo "emmc script is running"
sleep 1

./ethernet.sh &>> /home/root/log/eth.txt &
echo "eth script is running"
sleep 1

./qspi.sh &>> /home/root/log/qspi.txt &
echo "qspi script is running"
sleep 1

./can_send.sh &>> /home/root/log/can.txt &
echo "can script is running"
sleep 1

./i2s.sh &>> /home/root/log/i2s.txt &
echo "i2s script is running"
sleep 1

./uart.sh /dev/ttySC3 /dev/ttySC4 &>> /home/root/log/uart.txt &
./uart.sh /dev/ttySC4 /dev/ttySC3 &>> /home/root/log/uart2.txt &
sleep 1

./soctemp.sh &>> /home/root/log/soctemp.txt &
echo "soctemp script is running"  
sleep 1

while true
do
   sleep 60
   echo "service alive"
done

