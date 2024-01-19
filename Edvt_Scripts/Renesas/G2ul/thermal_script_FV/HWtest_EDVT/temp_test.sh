#!/bin/sh

while true
do
        echo "Please Enter: "
        echo "1:UART"
        echo "2:I2C"
        echo "3:USB"
        echo "4:SPI"
        echo "5:PWM"
        echo "6:CSI"
        echo "7:EMMC"
        echo "8:Display"
        echo "9:Sdcard"
        echo "10:Run all SCRIPT together"
        read value
        if [ $value == 1 ]
        then
                ./uart.sh

        elif [ $value == 2 ]
        then
                ./i2c.sh
        elif [ $value == 3 ]
        then
                ./usb.sh
        elif [ $value == 4 ]
        then
                ./spi.sh
        elif [ $value == 5 ]
        then
                ./pwm.sh
        elif [ $value == 6 ]
        then
                ./csi.sh
        elif [ $value == 7 ]
        then
                ./emmc.sh 1
        elif [ $value == 8 ]
        then
                ./display.sh
        elif [ $value == 9 ]
        then
                ./sdcard.sh
        elif [ $value == 10 ]
        then
                ./i2c.sh &> /dev/ttySC1 &
                ./spi.sh &> /dev/ttySC1 &
                ./usb.sh &> /dev/ttySC4 &
               ./csi.sh &> /dev/ttySC4 &
                ./pwm.sh &> /dev/ttySC4 &
                ./sdcard.sh &> /dev/ttySC4 &
                ./emmc.sh 1 &> /dev/ttySC4 &
                ./display.sh &> /dev/ttySC4 &
                read -p "enter q for exit: " val
                if [ "$val" == "q" ]
                then
                        `pkill -f i2c.sh`
                        `pkill -f spi.sh`
                        `pkill -f usb.sh`
                        `pkill -f csi.sh`
                        `pkill -f emmc.sh`
                        `pkill -f sdcard.sh`
                        `pkill -f display.sh`
                elif [ "$val" == "i" ]
                then
                        `pkill -f i2c.sh`
                elif [ "$val" == "s" ]
                then
                        `pkill -f spi.sh`
                fi
        else
                echo "Please Enter valid input from 1 to 10 ..."
        fi
done
