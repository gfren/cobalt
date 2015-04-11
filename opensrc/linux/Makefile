
KERNEL_DIR=linux-$(KERNEL_VERSION)

all:config
	make -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);
	make modules -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);
	@echo "build kernel done!"

config:patch
	cp configs/linux.realview.config $(KERNEL_DIR)/.config;
	@echo "config kernel done!"

menuconfig:
	make menuconfig -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);

patch:unpack
	@echo "patch kernel done!"

unpack:
	[ -d $(KERNEL_DIR) ] || tar -xjf $(KERNEL_DIR).tar.bz2;

clean:
	make clean -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);
	@echo "clean kernel done!"

delete:
	[ -d $(KERNEL_DIR) ] && rm -rf ./$(KERNEL_DIR);
	@echo "delete kernel done!"