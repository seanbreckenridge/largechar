.DEFAULT_GOAL := largechar
TARGET_BIN="${HOME}/.local/bin"
BIN=largechar

install: build
	@@ echo "Installing $(BIN) to install to $(TARGET_BIN)"
	@@ cp -v ./$(BIN) $(TARGET_BIN)

$(BIN): help.bash main.js renderer.js style.css index.html
	./build

clean:
	rm -f ./$(BIN)
