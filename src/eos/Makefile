TARGET=bin/ostheme
SRC=src/eos/ostheme_eos.vala

.PHONY: all
all: $(TARGET)

.PHONY: clean
clean:
	rm -f $(TARGET)

$(TARGET): $(SRC)
	valac --pkg=gio-2.0 --pkg=granite -o $(TARGET) $(SRC)
