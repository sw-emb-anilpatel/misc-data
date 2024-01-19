#!/bin/sh

(`echo 319 > /sys/class/gpio/export`) > /dev/null 2>&1 
`echo out > /sys/class/gpio/gpio319/direction`

IP1=192.168.3.54

 

while [ 1 ]
do
date=`date`
#start first ping, remember its pid
        ping -W 1 -c 5 $IP1 >/dev/null&
        PID1=$!

 

# wait for pings to finish
        if wait $PID1
        then echo $IP1 is reachable, network is working;
	echo "[eth $date]: ethernet test successful";
	else
		echo "[eth $date]: ethernet test fail";
		sleep 1
		`echo 1 > /sys/class/gpio/gpio319/value` 
		sleep 0.1 
		`echo 0 > /sys/class/gpio/gpio319/value`
		sleep 0.1 
        fi
done

 

# none reachable
echo all pings failed, network is down
exit 1

