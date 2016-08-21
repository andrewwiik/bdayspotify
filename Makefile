FOR_RELEASE=1
GO_EASY_ON_ME=1
export ARCHS = armv7 arm64
export TARGET = iphone:clang
export THEOS_DEVICE_IP=192.168.1.7
export SDKVERSION = 7.0
include theos/makefiles/common.mk

TWEAK_NAME = BDaySpotify2
BDaySpotify2_FILES = Tweak.xm
BdaySpotify2_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += bdayprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
