
all: install
	echo "make $(APP_NAME) done!"

install: build
	echo "install $(APP_NAME) done!"

build: lib
	echo "build $(APP_NAME) done!"

lib:

clean:
	echo "make clean $(APP_NAME) done!"
