#!/bin/sh


BT_ENABLE_PIN=322

if lsmod | grep -wq "brcmfmac"; then
  echo "WiFi moudule is loaded!"
else
  insmod /lib/modules/5.10.184-cip36-yocto-standard/extra/compat.ko
  insmod /lib/modules/5.10.184-cip36-yocto-standard/extra/cfg80211.ko
  insmod /lib/modules/5.10.184-cip36-yocto-standard/extra/brcmutil.ko
  insmod /lib/modules/5.10.184-cip36-yocto-standard/extra/brcmfmac.ko
fi
#insmod /lib/modules/5.10.184-cip36-yocto-standard/extra/compat.ko
#insmod /lib/modules/5.10.184-cip36-yocto-standard/extra/cfg80211.ko 
#insmod /lib/modules/5.10.184-cip36-yocto-standard/extra/brcmutil.ko 
#insmod /lib/modules/5.10.184-cip36-yocto-standard/extra/brcmfmac.ko
sleep 2
echo $BT_ENABLE_PIN > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio$BT_ENABLE_PIN/direction
echo 1 > /sys/class/gpio/gpio$BT_ENABLE_PIN/value


rfkill unblock all

/etc/rc5.d/S20bluetooth start
hciattach /dev/ttySC2 bcm43xx 115200 flow -t 2

ifconfig wlan0 up
ifconfig

