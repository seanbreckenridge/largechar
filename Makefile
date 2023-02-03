.DEFAULT_GOAL := largechar
TARGET_BIN="${HOME}/.local/bin"

install: build
	@@ echo "Attempting to install to $(TARGET_BIN)"
	cp ./largechar $(TARGET_BIN)

largechar: help.bash main.js renderer.js style.css index.html
	./build

clean:
	rm -f largechar
