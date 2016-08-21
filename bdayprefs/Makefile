include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = bdayprefs
bdayprefs_FILES = bdayspotify2RootListController.m
bdayprefs_INSTALL_PATH = /Library/PreferenceBundles
bdayprefs_FRAMEWORKS = UIKit
bdayprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/bdayprefs.plist$(ECHO_END)
