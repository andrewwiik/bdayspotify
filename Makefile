export ARCHS = armv7 arm64
export TARGET = iphone:clang
export SDKVERSION = 7.0
include theos/makefiles/common.mk

TWEAK_NAME = BDaySpotify2
BDaySpotify2_FILES = Tweak.xm
BDaySpotify2_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

