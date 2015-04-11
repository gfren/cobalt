

SOURCR_DIR=qemu-1.4.0

all:config
	cd $(SOURCR_DIR); make; cd -;
	echo "build $(SOURCR_DIR) done!"

config:patch
	cd $(SOURCR_DIR); ./configure --cc=/usr/bin/gcc --host-cc=/usr/bin/gcc --prefix= --target-list=arm-softmmu --audio-drv-list=alsa
	echo "config $(SOURCR_DIR) done!"

patch:unpack
	echo "patch $(SOURCR_DIR) done!"

unpack:
	[ -d $(SOURCR_DIR) ] || tar -xjf $(SOURCR_DIR).tar.bz2;

clean:
	make clean -C $(SOURCR_DIR);
	echo "clean $(SOURCR_DIR) done!"

delete:
	[ -d $(SOURCR_DIR) ] && rm -rf ./$(SOURCR_DIR);
	echo "delete $(SOURCR_DIR) done!"
