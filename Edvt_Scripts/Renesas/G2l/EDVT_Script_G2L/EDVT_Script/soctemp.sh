#!/bin/sh

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
fi
sleep 4
done    
