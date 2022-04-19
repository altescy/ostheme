PLATFORM := "auto"

ifeq ($(PLATFORM),"auto")
	ifeq ($(shell uname),Darwin)
		PLATFORM = macos
	endif
endif

all:
	make -f src/$(PLATFORM)/Makefile

clean:
	make -f src/$(PLATFORM)/Makefile clean
