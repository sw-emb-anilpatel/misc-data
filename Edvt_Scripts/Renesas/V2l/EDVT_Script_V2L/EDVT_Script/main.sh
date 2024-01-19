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
        echo "9:wifi"
        echo "10:i2s"
	echo "11:CAN"
	echo "12:ethernet"
	echo "13:Qspi"
	echo "14:soctemp"
        echo "15:Run all SCRIPT together"
        read value

        if [ $value == 1 ]
        then
		./uart.sh /dev/ttySC3 /dev/ttySC2
		./uart.sh /dev/ttySC2 /dev/ttySC3
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
                ./emmc.sh 1 0
        elif [ $value == 8 ]
        then
                ./display.sh
	elif [ $value == 10 ]
	then
		./i2s.sh
        elif [ $value == 11 ]
	then
		./can_send.sh
        elif [ $value == 12 ]
	then
		./ethernet.sh
        elif [ $value == 13 ]
	then
		./qspi.sh
	elif [ $value == 9 ]
	then
		./wifi.sh
	elif [ $value == 14 ]
	then
		./soctemp.sh
	elif [ $value == 15 ]
        then  
		./i2c.sh &> /home/root/log/i2c.txt &
		./usb.sh &> /home/root/log/usb.txt &
		./spi.sh &> /home/root/log/spi.txt &
		./csi.sh &> /home/root/log/csi.txt &
		./pwm.sh &> /home/root/log/pwm.txt &
		./emmc.sh 1 0 &> /home/root/log/emmc.txt &
		./ethernet.sh &> /home/root/log/eth.txt &
		./qspi.sh &> /home/root/log/qspi.txt &
		./can_send.sh &> /home/root/log/can.txt &
		#./wifi.sh &> /home/root/log/wifi.txt &
		./i2s.sh &> /home/root/log/i2s.txt &
		./uart.sh /dev/ttySC3 /dev/ttySC2 &> /home/root/log/uart.txt &	
		./uart.sh /dev/ttySC2 /dev/ttySC3 &> /home/root/log/uart2.txt &
		./display.sh &> /home/root/log/display.txt &
		./soctemp.sh &> /home/root/log/soctemp.txt &	
		while true
		do
		echo "please Enter: "
                echo "1:I2C exit"
                echo "2:SPI exit"
                echo "3:USB exit"
                echo "4:CSI exit"
                echo "5:EMMC exit"
		echo "7:Display exit"
		echo "8:UART exit"
		echo "9:I2S exit"
		echo "10:CAN exit"
		echo "11:i2c start"
		echo "12:spi start"
		echo "13:usb start"
		echo "14:csi start"
		echo "15:emmc start"
		echo "17:display start"
		echo "18:uart start"
		echo "19:i2s start"
		echo "20:CAN start"
		echo "21:Ethernet exit"
		echo "22:Ethernet start"
		echo "23:Qspi exit"
		echo "24:Qspi start"
		echo "25:wifi exit"
		echo "26:wifi start"
		echo "27:soctemp exit"
		echo "28:soctemp start"
		echo "q:exit all"
		read val
                if [ "$val" == "q" ]
                then
                        `pkill -f i2c.sh`
			 sleep 1
                        `pkill -f spi.sh`
			 sleep 3
                        `pkill -f usb.sh`
			 sleep 1
                        `pkill -f csi.sh`
			 sleep 5
                        `pkill -f emmc.sh`
			 sleep 3
                        `pkill -f display.sh`
			 sleep 3
			`pkill -f uart.sh`
			 sleep 1
			`pkill -f i2s.sh`
			 sleep 3	
			`pkill -f can_send.sh`
			 sleep 1
			`pkill -f analogclock`
			sleep 1
			`pkill -f ethernet.sh`
			echo 0 > /sys/class/gpio/gpio317/value
			echo 0 > /sys/class/gpio/gpio346/value
			echo 0 > /sys/class/gpio/gpio345/value
			echo 0 > /sys/class/pwm/pwmchip0/pwm0/enable
			`pkill -f qspi.sh`
			`pkill -f wifi.sh`
			`pkill -f soctemp.sh`
			
			 break
		elif [ "$val" == "1" ]
		then
			`pkill -f i2c.sh`
			echo "i2c script stoped"
		elif [ "$val" == "2" ]
		then
			`pkill -f spi.sh`
			echo "spi script stoped"
		elif [ "$val" == "3" ]
		then
			`pkill -f usb.sh`
			echo "usb script stoped"
		elif [ "$val" == "4" ]
		then
			`pkill -f csi.sh`
			echo "csi script stoped"
		elif [ "$val" == "7" ]
		then
			`pkill -f display.sh`
			sleep 1
			`pkill -f analogclock`
			echo 0 > /sys/class/gpio/gpio317/value
			echo 0 > /sys/class/gpio/gpio346/value
			echo 0 > /sys/class/gpio/gpio345/value
			echo 0 > /sys/class/pwm/pwmchip0/pwm0/enable
			echo "display script stoped"
		elif [ "$val" == "5" ]
		then
			`pkill -f emmc.sh`
			echo "emmcy script stoped"
		elif [ "$val" == "5" ]
		then
			`pkill -f emmc.sh`
			echo "emmc script stoped"
		elif [ "$val" == "8" ]
		then
			`pkill -f uart.sh`
			echo "uart script stoped"
		elif [ "$val" == "9" ]
		then
			`pkill -f i2s.sh`
			echo "i2s script stoped"
		elif [ "$val" == "10" ]
		then
			`pkill -f can_send.sh`
			echo "CAN script stoped"
		elif [ "$val" == "11" ]
		then
			./i2c.sh &> /home/root/log/i2c.txt &
		elif [ "$val" == "12" ]
		then
			./spi.sh &> /home/root/log/spi.txt &
		elif [ "$val" == "13" ]
		then
			./usb.sh &> /home/root/log/usb.txt &
		elif [ "$val" == "14" ]
		then
			./csi.sh &> /home/root/log/csi.txt &
		elif [ "$val" == "17" ]
		then
			./display.sh &> /home/root/log/display.txt &
		elif [ "$val" == "15" ]
		then
			./emmc.sh 1 1 &> /home/root/log/emmc.txt &
		elif [ "$val" == "18" ]
		then
			./uart.sh /dev/ttySC3 /dev/ttySC4 &> /home/root/log/uart.txt &
		elif [ "$val" == "19" ]
		then
			./i2s.sh &> /home/root/log/i2s.txt &
		elif [ "$val" == "20" ]
		then
			./can_send.sh &> /home/root/log/can.txt &			
		elif [ "$val" == "21" ]
		then
			`pkill -f ethernet.sh`
			echo "ethernet script stoped"
		elif [ "$val" == "23" ]
		then
			`pkill -f qspi.sh`
			echo "Qspi script stoped"
		elif [ "$val" == "22" ]
		then
			./ethernet.sh &> /home/root/log/eth.txt &			
		elif [ "$val" == "24" ]
		then
			./qspi.sh &> /home/root/log/qspi.txt &
		elif [ "$val" == "25" ]
		then
			`pkill -f wifi.sh`
			echo "wifi script stoped"
		elif [ "$val" == "26" ]
		then
			./wifi.sh &> /home/root/log/wifi.txt &
		elif [ "$val" == "27" ]
		then
			`pkill -f soctemp.sh`
			echo "soctemp script stoped"
		elif [ "$val" == "28" ]
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

