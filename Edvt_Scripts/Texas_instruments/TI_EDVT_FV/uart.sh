#!/bin/sh

IN_PORT=$1 #/dev/ttymxc2
OUT_PORT=$2 #/dev/ttymxc2
stty -F $IN_PORT raw ispeed 9600 ospeed 9600 cs8 -ignpar -cstopb -echo
stty -F $OUT_PORT raw ispeed 9600 ospeed 9600 cs8 -ignpar -cstopb -echo

if [ -w $IN_PORT ]
then
  cat $IN_PORT &
  sleep 3
else
  echo "$IN_PORT does not exist"
  exit 1
fi

while true
do

date=`date`
VALUE="Avnet_Test $date"
#Run this in loop for contineous read write
if [ -w $OUT_PORT ]
then
    echo $VALUE > $OUT_PORT
   sleep 3
else
  echo "$OUT_PORT does not exist"
  exit 1
fi
done
exit 0
