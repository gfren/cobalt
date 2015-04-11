
SOURCR_DIR=busybox-1.20.2

all:install
	@echo "build and install $(SOURCR_DIR) done!"

install:build
	make install -C $(SOURCR_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);
	@mv $(SOURCR_DIR)/_install rootfs;
	@tar -cjf busybox.tar.bz2 rootfs;
	@echo "install $(SOURCR_DIR) done!"

build:config
	make -C $(SOURCR_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);
	@echo "build $(SOURCR_DIR) done!"

config:patch
	cp -f configs/$(SOURCR_DIR).config $(SOURCR_DIR)/.config;
	@echo "config $(SOURCR_DIR) done!"

menuconfig:patch
	make menuconfig -C $(SOURCR_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE);

patch:unpack
	@echo "patch $(SOURCR_DIR) done!"

unpack:
	@[ -d $(SOURCR_DIR) ] || tar -xjf $(SOURCR_DIR).tar.bz2;
	@echo "unpack $(SOURCR_DIR) done!"

clean:
	@if [ -d $(SOURCR_DIR) ]; then  make clean -C $(SOURCR_DIR); fi;
	@if [ -d rootfs ]; then rm -rf ./rootfs; fi;
	@if [ -f busybox.tar.bz2 ]; then rm -rf busybox.tar.bz2; fi;
	@echo "clean $(SOURCR_DIR) done!"

delete:
	@if [ -d $(SOURCR_DIR) ]; then rm -rf ./$(SOURCR_DIR); fi;
	@if [ -d rootfs ]; then rm -rf ./rootfs; fi;
	@if [ -f busybox.tar.bz2 ]; then rm -rf busybox.tar.bz2; fi;
	@echo "delete $(SOURCR_DIR) done!"

