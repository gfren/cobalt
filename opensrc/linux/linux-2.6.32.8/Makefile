
KERNEL_DIR=linux-$(KERNEL_VERSION)

all:config
	make -j8 -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);
	#make -j8 modules -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);
	@echo "build $(KERNEL_DIR) done!"

config:patch
	cp configs/linux.realview.config $(KERNEL_DIR)/.config;
	@echo "config $(KERNEL_DIR) done!"

menuconfig:patch
	make menuconfig -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);

patch:unpack
	cp -f patches/arch/arm/kernel/kgdb.c $(KERNEL_DIR)/arch/arm/kernel/kgdb.c;
	@echo "patch kernel done!"

unpack:
	[ -d $(KERNEL_DIR) ] || tar -xjf $(KERNEL_DIR).tar.bz2;

clean:
	make clean -C $(KERNEL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);
	@echo "clean $(KERNEL_DIR) done!"

delete:
	@if [ -d $(KERNEL_DIR) ] ; then rm -rf ./$(KERNEL_DIR); fi;
	@echo "delete $(KERNEL_DIR) done!"