PLATFORM     := auto
INSTALL_PATH := /usr/bin

ifeq ($(PLATFORM),auto)
	ifeq ($(shell uname),Darwin)
		PLATFORM = macos
	else ifeq ($(shell uname),Linux)
		ifeq ($(lastword $(shell lsb_release --id)),Elementary)
			PLATFORM = eos
		endif
	endif
endif

.PHONY: all
all:
	make -f src/$(PLATFORM)/Makefile

.PHONY: clean
clean:
	make -f src/$(PLATFORM)/Makefile clean

.PHONY: install
install:
	cp bin/ostheme $(INSTALL_PATH)/ostheme
