#!/bin/sh

(`echo 319 > /sys/class/gpio/export`) > /dev/null 2>&1
`echo out > /sys/class/gpio/gpio319/direction`

while true
do
echo "[Thermal]: testing temperature sensor on SOC... "                                    
if [ -f "/sys/devices/virtual/thermal/thermal_zone0/temp" ]                   
then                                                             
	date=`date`
        Temp=`expr $(cat /sys/devices/virtual/thermal/thermal_zone0/temp) / 1000`
        echo "current Temp:- $Temp $date "                                  
else                                                             
        echo "[I2C]: Temperature sensor not found... "
	`echo 1 > /sys/class/gpio/gpio319/value`                        
        sleep 0.1                                                       
        `echo 0 > /sys/class/gpio/gpio319/value`                                            
        sleep 0.1                                               
fi
sleep 4
done    
