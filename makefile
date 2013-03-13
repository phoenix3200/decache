

TOOL_NAME = decache

decache_INSTALL_PATH = /usr/bin
decache_OBJCC_FILES = \
    decache.mm\
    reexport.mm

decache_CFLAGS = -ggdb
# -mdynamic-no-pic
decahe_LDFLAGS = -ggdb
# -static -mdynamic-no-pic

# SDKVERSION = 3.0
# TARGET = native
TARGET = iphone

include theos/makefiles/common.mk
include theos/makefiles/tool.mk

