#! /bin/bash

if [ "$1" == "2.6.32" ] ; then
	export KERNEL_VERSION=2.6.32.8
	export TOOLSCHAIN_VERSION=4.4.1
elif [ "$1" == "3.5.4" ] ; then
	export KERNEL_VERSION=3.5.4
	export TOOLSCHAIN_VERSION=4.7.2
else
	echo "you should set your kernel version 2.6.32 or 3.5.4!";
	return
fi

#project evn
export PROJECT_HOME=$PWD/..
export KERNEL_HOME=$PROJECT_HOME/opensrc/linux/linux-$KERNEL_VERSION

	
#toolschian evn
export TOOLSCHAIN_HOME=$PROJECT_HOME/tools/toolschain/arm-linux-gcc-$TOOLSCHAIN_VERSION
if [ ! -d $TOOLSCHAIN_HOME ]; then
	echo "extract toolschain arm-linux-gcc-$TOOLSCHAIN_VERSION.tar.bz2!"
	tar xjf $PROJECT_HOME/tools/toolschain/arm-linux-gcc-$TOOLSCHAIN_VERSION.tar.bz2 -C $PROJECT_HOME/tools/toolschain;
fi

export PATH=$PATH:$TOOLSCHAIN_HOME/bin
export LD_LIBRARY=$LD_LIBRARY:$TOOLSCHAIN_HOME/lib

#cross complier
export CROSS_COMPILE=arm-none-linux-gnueabi-

echo "set kernel $KERNEL_VERSION and toolschain $TOOLSCHAIN_VERSION done!"
