#!/bin/sh

while true
do
        echo "Please Enter: "
        echo "1:UART"
        echo "2:I2C"
        echo "3:USB"
        echo "4:SPI"
        echo "5:EMMC"
        echo "6:Sdcard"
        echo "7:i2s"
        echo "8:ethernet"
	echo "9:csi"
	echo "10:qspi"
	echo "11:display"
	echo "12:CANsend"
	echo "13:soctemp"
        echo "14:Run all SCRIPT together"
        read value

        if [ $value == 1 ]
        then
                ./uart.sh /dev/ttyS5 /dev/ttyS1

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
                ./emmc.sh 0 0
        elif [ $value == 6 ]
        then
                ./sdcard.sh
        elif [ $value == 7 ]
        then
                ./i2s.sh
        elif [ $value == 8 ]
        then
                ./ethernet.sh
	elif [ $value == 9 ]
	then
		./csi.sh
	elif [ $value == 10 ]
	then
		./qspi.sh
	elif [ $value == 11 ]
	then
                ./display.sh
	elif [ $value == 12 ]
        then
                ./can_send.sh
	elif [ $value == 13 ]
        then                 
                ./soctemp.sh	
        elif [ $value == 14 ]
        then
                ./i2c.sh &> /home/root/log/i2c.txt &
                ./spi.sh &> /home/root/log/spi.txt &
                ./usb.sh &> /home/root/log/usb.txt &
                ./sdcard.sh &> /home/root/log/sdcard.txt &
                ./emmc.sh 0 0 &> /home/root/log/emmc.txt &
                ./uart.sh /dev/ttyS5 /dev/ttyS1 &> /home/root/log/uart.txt &
		./uart.sh /dev/ttyS1 /dev/ttyS5 &> /home/root/log/uart2.txt &
                ./i2s.sh &> /home/root/log/i2s.txt &
                ./ethernet.sh &> /home/root/log/eth.txt &
		./csi.sh &> /home/root/log/csi.txt &
	        ./qspi.sh &> /home/root/log/qspi.txt &
		./display.sh &> /home/root/log/display.txt &
		./can_send.sh &> /home/root/log/can.txt &
		./soctemp.sh &> /home/root/log/soctemp.txt &
               while true
               do
               	echo "please Enter: "
               	echo "1:I2C exit"
               	echo "2:SPI exit"
               	echo "3:USB exit"
               	echo "4:EMMC exit"
                echo "5:sdcard exit"
                echo "6:UART exit"
                echo "7:I2S exit"
                echo "8:i2c start"
                echo "9:spi start"
                echo "10:usb start"
                echo "11:emmc start"
                echo "12:sdcard start"
                echo "13:uart start"
                echo "14:i2s start"
                echo "15:Ethernet exit"
                echo "16:Ethernet start"
		echo "17:csi exit"
		echo "18:csi start"
		echo "19:qspi exit"
		echo "20:qspi start"
		echo "21:display exit"
		echo "22:display start"
		echo "23:can exit"
                echo "24:can start"
		echo "25:soctemp exit"
		echo "26:soctemp start"
                echo "q:exit all"
                read val
                if [ "$val" == "q" ]
                then
			`killall i2c.sh &> /dev/null`
                         sleep 1
			`killall spi.sh &> /dev/null`
                         sleep 3
			`killall usb.sh &> /dev/null`
                         sleep 1
			`killall ethernet.sh &> /dev/null`
                         sleep 5
			`killall emmc.sh &> /dev/null`
                         sleep 3
			`killall sdcard.sh &> /dev/null`
                         sleep 3
			`killall uart.sh &> /dev/null`
                         sleep 1
			`killall i2s.sh &> /dev/null`
			 sleep 3
			`killall csi.sh &> /dev/null`
			 sleep 3
			`killall qspi.sh &> /dev/null`
                         sleep 3
			`killall display.sh &> /dev/null`
			 sleep 1
			`killall can_send.sh &> /dev/null`
			 sleep 1
			`killall soctemp.sh &> /dev/null`
			 sleep 1
                         break
                elif [ "$val" == "1" ]
                then
			`killall i2c.sh &> /dev/null`
                        echo "i2c script stoped"
                elif [ "$val" == "2" ]
                then
			`killall spi.sh &> /dev/null`
                        echo "spi script stoped"
                elif [ "$val" == "3" ]
                then
			`killall usb.sh &> /dev/null`
                        echo "usb script stoped"
                elif [ "$val" == "4" ]
                then
			`killall emmc.sh &> /dev/null`
                        echo "emmc script stoped"
                elif [ "$val" == "5" ]
                then
			`killall sdcard.sh &> /dev/null`
                        echo "sdcard script stoped"
                elif [ "$val" == "6" ]
                then
			`killall uart.sh &> /dev/null`
                        echo "uart script stoped"
                elif [ "$val" == "7" ]
                then
			`killall i2s.sh &> /dev/null`
                        echo "i2s script stoped"
                elif [ "$val" == "8" ]
		then
                        ./i2c.sh &> /home/root/log/i2c.txt &
                elif [ "$val" == "9" ]
                then
                        ./spi.sh &> /home/root/log/spi.txt &
                elif [ "$val" == "10" ]
                then
                        ./usb.sh &> /home/root/log/usb.txt &
                elif [ "$val" == "11" ]
                then
                        ./emmc.sh 0 0 &> /home/root/log/emmc.txt &
                elif [ "$val" == "12" ]
                then
                        ./sdcard.sh &> /home/root/log/sdcard.txt &
                elif [ "$val" == "13" ]
                then
                        ./uart.sh /dev/ttyS5 /dev/ttyS6 &> /home/root/log/uart.txt &
                elif [ "$val" == "14" ]
                then
                        ./i2s.sh &> /home/root/log/i2s.txt &
                elif [ "$val" == "15" ]
                then
			`killall ethenet.sh &> /dev/null`
                        echo "ethernet script stoped"
                elif [ "$val" == "16" ]
                then
                        ./ethernet.sh &> /home/root/log/eth.txt &
		elif [ "$val" == "17" ]
		then
			`killall csi.sh &> /dev/null`
		elif [ "$val" == "18" ]
		then
			./csi.sh &> /home/root/log/csi.txt &
		elif [ "$val" == "19" ]
		then
			`killall qspi.sh &> /dev/null`
		elif [ "$val" == "20" ]
		then
			./qspi.sh &> /home/root/log/qspi.txt &
                elif [ "$val" == "21" ]
                then
                        `killall display.sh &> /dev/null`
		elif [ "$val" == "22" ]
                then
                        ./display.sh &> /home/root/log/wifi.txt &
		elif [ "$val" == "23" ]
                then
                        `killall can_send.sh &> /dev/null`
		elif [ "$val" == "24" ]
                then
                        ./can_send.sh &> /home/root/log/can.txt &
		elif [ "$val" == "25" ]                                             
                then                                                                
                        `killall soctemp.sh &> /dev/null`                          
                elif [ "$val" == "26" ]                                             
                then                                                                
                        ./soctemp.sh &> /home/root/log/soctemp.txt &
		else
                        echo "wrong input"
                fi
               	done

        else
                echo "Please Enter valid input from 1 to 10 ..."
        fi
done

