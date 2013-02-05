
CC = g++
CFLAGS = -c
UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
	LFLAGS += -lrt
endif

all: decache

decache:
	@echo "Making decache..."
	@$(CC) -O3 decache.c -c -ggdb $(LFLAGS)
	@$(CC) -O3 reexport.c -c -ggdb $(LFLAGS)
	@$(CC) -O3 decache.o reexport.o -o decache -ggdb $(LFLAGS)

compare:
	@echo "Making compare..."
	@$(CC) -O3 compare.c -o compare -ggdb $(LFLAGS)



.PHONY: decache compare



