#!/bin/sh

(`echo 352 > /sys/class/gpio/export`) > /dev/null 2>&1                                                      
`echo out > /sys/class/gpio/gpio352/direction`

(`echo 319 > /sys/class/gpio/export`) > /dev/null 2>&1
`echo out > /sys/class/gpio/gpio319/direction`

while true
do
echo "[I2C]: i2c hardware test start.... "
echo "[I2C]: testing eeprom 0x57 on i2c 0 .."
if [ -f "/sys/bus/i2c/devices/i2c-0/0-0057/eeprom" ]
then
	date=`date`
        `./hwtest_eeprom -e /sys/bus/i2c/devices/i2c-0/0-0057/eeprom -m "jay swaminarayan" -o 0x60 -s`
        val=`hexdump -C /sys/bus/i2c/devices/i2c-0/0-0057/eeprom`
        a=`echo "$val" | grep "jay swaminarayan" | wc -l`
        if [ $a == 1 ]
        then
                echo "[I2C $date]: testing eeprom 0x57 on i2c 0 Done.."
        else

                echo "[I2C $date]: testing eeprom 0x57 on i2c 0 fail.."
                `echo 1 > /sys/class/gpio/gpio319/value`          
                 sleep 0.1                                        
                `echo 0 > /sys/class/gpio/gpio319/value`
                 sleep 0.1
        fi
else
        echo "[I2C]: EEPROM 0x57 not found on i2c 0 ... "
fi

echo "testing eeprom 0x50 on i2c 0... "
if [ -f "/sys/bus/i2c/devices/i2c-0/0-0050/eeprom" ]
then
	date2=`date`
        `./hwtest_eeprom -e /sys/bus/i2c/devices/i2c-0/0-0050/eeprom -m "jay shree RAM" -o 0x50 -s`
        val=`hexdump -C /sys/bus/i2c/devices/i2c-0/0-0050/eeprom`
        a=`echo "$val" | grep "jay shree RAM" | wc -l`
        if [ $a == 1 ]
        then
                echo "[I2C $date2]: testing eeprom 0x50 on i2c 0 Done.."
        else
                echo "[I2C $date2]: testing eeprom 0x50 on i2c 0 fail.."
                `echo 1 > /sys/class/gpio/gpio319/value`          
                 sleep 0.1                                        
                `echo 0 > /sys/class/gpio/gpio319/value`
                 sleep 0.1
        fi
else
        echo "[I2C]: EEPROM 0x50 not found on i2c 0 ... "
fi

echo "[I2C]: testing eeprom 0x57 on i2c 1 .."
if [ -f "/sys/bus/i2c/devices/i2c-1/1-0057/eeprom" ]
then
	date3=`date`
        `./hwtest_eeprom -e /sys/bus/i2c/devices/i2c-1/1-0057/eeprom -m "JSK" -o 0x60 -s`
        val=`hexdump -C /sys/bus/i2c/devices/i2c-1/1-0057/eeprom`
        a=`echo "$val" | grep "JSK" | wc -l`
        if [ $a == 1 ]
        then
                echo "[I2C $date3]: testing eeprom 0x57 on i2c 1 Done.."
        else
                echo "[I2C $date3]: testing eeprom 0x57 on i2c 1 fail.."
                `echo 1 > /sys/class/gpio/gpio319/value`          
                 sleep 0.1                                        
                `echo 0 > /sys/class/gpio/gpio319/value`
                 sleep 0.1
        fi
else
        echo "[I2C]: EEPROM 0x57 not found on i2c 1 ... "
fi

echo "[I2C]: testing temperature sensor on i2c 2... "
if [ -f "/sys/bus/i2c/devices/i2c-2/2-0075/hwmon/hwmon1/temp1_input" ]
then
	date4=`date`
        Temp=`expr $(cat /sys/bus/i2c/devices/i2c-2/2-0075/hwmon/hwmon1/temp1_input) / 1000`
        echo "current Temp:- $Temp $date4"
else
        echo "[I2C $date4]: Temperature sensor not found... "
        `echo 1 > /sys/class/gpio/gpio319/value`          
         sleep 0.1                                        
        `echo 0 > /sys/class/gpio/gpio319/value`
         sleep 0.1
fi

#sleep 10

echo "[I2C]: testing Pmic 0x30 on i2c 2"
value=`i2cget -f -y 2 0x30 0x17`
echo "$value"
if [ "$value" == "0x4f" ]
then
	date5=`date`
        echo "[I2C $date5]: testing Pmic pass.. "
else
	echo "[I2C $date5]: testing Pmic fail.. "
	`echo 1 > /sys/class/gpio/gpio319/value`               
         sleep 0.1                                              
        `echo 0 > /sys/class/gpio/gpio319/value`               
         sleep 0.1
fi

echo "[I2C $date5]: testing Codec 0x1a on i2c 0"
value=`i2cdump -f -y 0 0x1a`
echo "$value"

echo "[I2C]: testing RTC 0x32 on i2c 2"
`i2cset -f -y 2 0x32 0x01 0x17`
rtc_value=`i2cget -f -y 2 0x32 0x01`
echo "$rtc_value"

if [ "$rtc_value" == "0x17" ]
then
	date6=`date`
        echo "[I2C $date6]: testing RTC pass"
else
	echo "[I2C $date6]: testing RTC fail"
        `echo 1 > /sys/class/gpio/gpio319/value`                                            
         sleep 0.1                                                                       
        `echo 0 > /sys/class/gpio/gpio319/value`                                         
         sleep 0.1	
fi

                 
echo  "[I2C]: testing gpio exp..on 0x22"          
for i in {1..5}                               
do                                              
        `echo 1 > /sys/class/gpio/gpio352/value`              
        sleep 0.1                                                                               
        `echo 0 > /sys/class/gpio/gpio352/value`                 
        sleep 0.1
done


#echo "[I2C]: testing gpio exp..on 0x23"
#for i in {1..5}
#do
#        `echo 1 > /sys/class/gpio/gpio319/value`
#        sleep 0.1
#        `echo 0 > /sys/class/gpio/gpio319/value`
#        sleep 0.1
#done

done
