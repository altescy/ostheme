ifeq ($(shell uname),Darwin)
	PLATFORM = macos
endif

all:
	make -f src/$(PLATFORM)/Makefile

clean:
	make -f src/$(PLATFORM)/Makefile clean
