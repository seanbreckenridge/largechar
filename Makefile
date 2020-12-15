.DEFAULT_GOAL := copy_script
TARGET_BIN="${HOME}/.local/bin"

copy_script: build
	echo "Attempting to install to $(TARGET_BIN)"
	cp ./largechar $(TARGET_BIN)

build: help.bash install
	./install

