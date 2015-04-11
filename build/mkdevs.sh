#!/bin/sh

echo "Make Device Files..............................[Start]"
[ -d rootfs/dev ] && rm -rf rootfs/dev;
mkdir -p rootfs/dev;
chmod +x mkdevin.sh;
fakeroot ./mkdevin.sh rootfs/dev;
tar -cjf device.tar.bz2 rootfs;
echo "Make Device Files...............................[Done]"


