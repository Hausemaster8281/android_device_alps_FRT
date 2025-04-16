# device/alps/FRT/Android.mk

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := dtbo.img
LOCAL_PREBUILT_MODULE_FILE := $(LOCAL_PATH)/dtbo/dtbo.img
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(PRODUCT_OUT)
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
