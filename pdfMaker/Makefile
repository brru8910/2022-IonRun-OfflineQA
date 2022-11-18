# $Id$

USER_SRCS := $(wildcard *.cc)
EXE := $(patsubst %.cc,%, $(USER_SRCS))
.PHONY: all clean

CPPFLAGS := $(shell root-config --cflags)
LDFLAGS  := $(shell root-config --glibs)


all: $(EXE)

clean:
	- rm -f run core $(EXE)
