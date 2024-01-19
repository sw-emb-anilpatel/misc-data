#!/bin/sh
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
        fi
done

 

# none reachable
echo all pings failed, network is down
exit 1

