

TOOL_NAME = decache

decache_INSTALL_PATH = /usr/bin
decache_OBJCC_FILES = \
    decache.mm\
    reexport.mm

# SDKVERSION = 3.0
TARGET = native
# TARGET = iphone

include theos/makefiles/common.mk
include theos/makefiles/tool.mk

