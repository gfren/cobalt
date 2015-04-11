#!/bin/sh

echo "Make Basic Library Files.......................[Start]"

[ -d rootfs ] && rm -rf rootfs;
[ -d sys-root ] || tar -xjf sys-root.tar.bz2;
[ -d debug-root ] || tar -xjf debug-root.tar.bz2;

mkdir -p rootfs;
fakeroot cp -rf sys-root/* rootfs;
fakeroot cp -rf debug-root/* rootfs;

tar -cjf basic.tar.bz2 rootfs;

echo "Make Basic Library Files........................[Done]"
