TARGET=bin/ostheme
SRC=src/macos/ostheme_macos.swift

.PHONY: all
all: $(TARGET)

.PHONY: clean
clean:
	rm -f $(TARGET)

$(TARGET): $(SRC)
	swiftc -o $(TARGET) $(SRC)
