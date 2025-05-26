#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes

# Include GSI keys

# Get non-open-source specific aspects
PRODUCT_NAME := lineage_FRT
PRODUCT_DEVICE := FRT
PRODUCT_BRAND := alps
PRODUCT_MODEL := Nokia 1
PRODUCT_MANUFACTURER := alps
$(call inherit-product, vendor/alps/FRT/FRT-vendor.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio@2.1-impl

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.2-service \
    android.hardware.graphics.mapper@2.0-impl-2.1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_FRT.mk
# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.5 \
    android.hardware.radio.config@1.2
# Rootdir
PRODUCT_PACKAGES += \
    fstab.enableswap \
    init.mt6735.rc \
    init.mt6735.usb.rc \
    init.project.rc \
    fstab.mt6735m \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6735.rc \
    init.mt6735.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Properties
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml

#BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := false
#BOARD_SUPER_PARTITION_SIZE := 0
#BOARD_SUPER_PARTITION_GROUPS :=

DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

#PRODUCT_ENFORCE_VINTF_MANIFEST := false
#PRODUCT_IGNORE_VINTF_VERSION_CHECK := true
#BOARD_SEPOLICY_VERS := 202404
#FCM_VERSION := 5
#SEPOLICY_VERSION := 202404
# temp
#Copy missing prebuilts from kernel (Network specific files)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/br_netfilter.ko:system/lib/modules/br_netfilter.ko \
    $(LOCAL_PATH)/prebuilt/modules.alias:system/lib/modules/modules.alias \
    $(LOCAL_PATH)/prebuilt/modules.dep:system/lib/modules/modules.dep \
    $(LOCAL_PATH)/prebuilt/modules.softdep:system/lib/modules/modules.softdep \
    $(LOCAL_PATH)/prebuilt/xt_physdev.ko:system/lib/modules/xt_physdev.ko

$(call inherit-product, vendor/alps/FRT/FRT-vendor.mk)
