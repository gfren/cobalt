#!/bin/bash

### CONFIG #########
#

cmdline_initrd="console=ttyAMA0 mem=256M initrd=0x0f800000,8M root=/dev/ram0 rw"
cmdline_nfs="console=ttyAMA0 mem=256M root=/dev/nfs rw nfsroot=192.168.9.9:/home/dafu/Lab/smp-over-qemu/busybox/_install-bb,rsize=1024,wsize=1024 ip=192.168.9.10:192.168.9.9::255.255.255.0::eth0:on"

####################

log=$1

if [ "$log" == "log" ];
then
    ser2log="-serial file:serial.log"
else
    ser2log=""
fi

### qemu-system-arm -cpu arm11mpcore -m 256 -M realview -kernel zImage -append "$cmdline_initrd" $ser2log
### sudo qemu-system-arm -cpu arm11mpcore -m 256 -M realview-eb-mpcore -kernel zImage \
###                -net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=tap-up.sh \
###                -append "$cmdline_nfs" $ser2log

qemu-system-arm -nographic -cpu arm11mpcore -smp 4 -m 256 -M realview-eb-mpcore -kernel zImage.ok -initrd _install-bb.tgz -append "$cmdline_initrd"
