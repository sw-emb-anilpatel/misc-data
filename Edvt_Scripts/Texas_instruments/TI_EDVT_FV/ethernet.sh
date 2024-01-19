#!/bin/sh
IP1=192.168.4.39



while [ 1 ]
do
date=`date`
#start first ping, remember its pid
        ping -W 1 -c 5 $IP1 >/dev/null&
        PID1=$!



# wait for pings to finish
        if wait $PID1
        then echo $IP1 [$date] is reachable, network is working;
        fi
sleep 3
done



# none reachable
echo all pings failed, network is down[$date]
sleep 5
exit 1
