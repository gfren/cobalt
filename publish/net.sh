#! /bin/sh

ifconfig eth0 down
brctl addbr br0
brctl addif br0 eth0
brctl stp br0 off
brctl setfd br0 1
brctl sethello br0 1
ifconfig br0 0.0.0.0 promisc up
ifconfig eth0 0.0.0.0 promisc up

ifconfig br0 192.168.100.101 netmask 255.255.255.0
route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.168.100.101

brctl show br0
brctl showstp br0

tunctl -t tap0 -u centos
brctl addif br0 tap0
ifconfig tap0 0.0.0.0 promisc up
brctl showstp br0

