#!/bin/bash

echo "Converting DHCP scope to static IP address"

DEVICE=`route -n|grep '^0.0.0.0'|awk '{print $8}'`
IPADDR=`ifconfig $DEVICE|grep 'inet addr:'|awk '{sub(/addr:/,""); print $2}'`
NETMASK=`ifconfig $DEVICE|grep 'Mask'|awk '{sub(/Mask:/,""); print $4}'`
NETWORK=`ipcalc $IPADDR -n $NETMASK|awk -F= '{print $2}'`
GATEWAY=`route -n|grep '^0.0.0.0'|awk '{print $2}'`
HWADDR=`ifconfig $DEVICE|grep 'HWaddr'|awk '{print $5}'`

#cat <<EOF >/etc/sysconfig/network
cat <<EOF > $HOME/Desktop/network
NETWORKING=yes
HOSTNAME=$HOSTNAME
GATEWAY=$GATEWAY
EOF

cat <<EOF >/etc/sysconfig/network-scripts/ifcfg-$DEVICE
DEVICE=$DEVICE
BOOTPROTO=static
IPADDR=$IPADDR
NETMASK=$NETMASK
ONBOOT=yes
HWADDR=$HWADDR
EOF
