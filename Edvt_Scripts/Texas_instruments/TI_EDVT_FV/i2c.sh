#!/bin/sh

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
        fi
else
        echo "[I2C $date2]: EEPROM 0x57 not found on i2c 0 ... "
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
        fi
else
        echo "[I2C $date2]: EEPROM 0x50 not found on i2c 0 ... "
fi

echo "[I2C]: testing eeprom 0x57 on i2c 2 .."
if [ -f "/sys/bus/i2c/devices/i2c-2/2-0057/eeprom" ]
then
        date3=`date`
	`./hwtest_eeprom -e /sys/bus/i2c/devices/i2c-2/2-0057/eeprom -m "JSK" -o 0x60 -s`
        val=`hexdump -C /sys/bus/i2c/devices/i2c-2/2-0057/eeprom`
        a=`echo "$val" | grep "JSK" | wc -l`
        if [ $a == 1 ]
        then
                echo "[I2C $date3]: testing eeprom 0x57 on i2c 2 Done.."
        else
                echo "[I2C $date3]: testing eeprom 0x57 on i2c 2 fail.."
        fi
else
        echo "[I2C $date3]: EEPROM 0x57 not found on i2c 2 ... "
fi

echo "[I2C]: testing temperature sensor on i2c 4... "
if [ -f "/sys/bus/i2c/devices/4-0075/hwmon/hwmon0/temp1_input" ]
then
	date4=`date`
        Temp=`expr $(cat /sys/bus/i2c/devices/4-0075/hwmon/hwmon0/temp1_input) / 1000`
        echo "current Temp:- $Temp [$date4]"
else
        echo "[I2C $date4]: Temperature sensor not found... "
fi


echo "[I2C]: testing Pmic 0x30 on i2c 4"
value=`i2cget -f -y 4 0x30 0x17`
echo "$value"
if [ "$value" == "0x5d" ]
then
	date5=`date`
        echo "[I2C $date5]: testing Pmic pass.. "
fi

echo "[I2C]: testing RTC 0x32 on i2c 4"
`i2cset -f -y 4 0x32 0x01 0x17`
rtc_value=`i2cget -f -y 4 0x32 0x01`
echo "$rtc_value"

if [ "$rtc_value" == "0x17" ]
then
	date6=`date`
        echo "[I2C $date6]: testing RTC pass"
fi

echo "[I2C $date6]: testing Codec 0x1a on i2c 0"
value=`i2cdump -f -y 0 0x1a`
echo "$value"

#sleep 10

sleep 3
done
