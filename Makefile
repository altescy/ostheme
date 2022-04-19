PLATFORM := "auto"

ifeq ($(PLATFORM),"auto")
	ifeq ($(shell uname),Darwin)
		PLATFORM = macos
	else ifeq ($(shell uname),Linux)
		ifeq ($(lastword $(shell lsb_release --id)),Elementary)
			PLATFORM = eos
		endif
	endif
endif

all:
	make -f src/$(PLATFORM)/Makefile

clean:
	make -f src/$(PLATFORM)/Makefile clean
