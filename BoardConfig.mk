#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/alps/FRT

# Build Broken Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
DEXPREOPT_GENERATE_APEX_IMAGE := true
PRODUCT_ENFORCE_VINTF_MANIFEST := false
PRODUCT_IGNORE_VINTF_VERSION_CHECK := true

# Architecture (32-bit ARMv8-A)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6737m
TARGET_NO_BOOTLOADER := true

# Boot Image
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 buildvariant=userdebug
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_KERNEL_TAGS_OFFSET := 0xE000000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)


# Display
TARGET_SCREEN_DENSITY := 240

# Kernel
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
#TARGET_FORCE_PREBUILT_KERNEL := false

# Use kernel source
TARGET_KERNEL_SOURCE := kernel/alps/FRT
TARGET_KERNEL_CONFIG := FRT_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_CLANG_COMPILE := false
KERNEL_TOOLCHAIN := /media/hausemaster8281/1599b391-ccbc-44f7-827b-1515f7a8a7ab/android/lineage/kernel/alps/FRT/toolchain/gcc-arm-none-eabi-10.3-2021.10/bin
KERNEL_TOOLCHAIN_PREFIX := arm-none-eabi-
TARGET_KERNEL_TOOLCHAIN := $(KERNEL_TOOLCHAIN)$(KERNEL_TOOLCHAIN_PREFIX)

# Partitions
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_ROOT_EXTRA_FOLDERS := cache
BOARD_SUPPRESS_SECURE_ERASE := true
PRODUCT_FULL_TREBLE_OVERRIDE := true

# system-as-root configuration
BOARD_SUPPRESS_EMMC_WIPE := true
TARGET_NO_RECOVERY := false
BOARD_USES_RECOVERY_AS_BOOT := false
#BOARD_ROOT_EXTRA_SYMLINKS := vendor

# A/B-related flags — explicitly disable
AB_OTA_UPDATER := false
TARGET_NO_AB := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216         # 0x1000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 19096128     # 0x1230000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1634066432     # 0x61400000
BOARD_VENDORIMAGE_PARTITION_SIZE := 335544320      # 0x14000000
BOARD_DATAIMAGE_PARTITION_SIZE := 5474615296       # 0x147800000
BOARD_CACHEIMAGE_PARTITION_SIZE := 159383552        # 0x9800000 (optional but listed in scatter)
BOARD_FLASH_BLOCK_SIZE := 131072                    # 0x20000 (already present, just confirming)
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
# Filesystem Types
TARGET_COPY_OUT_VENDOR := vendor


# Platform
TARGET_BOARD_PLATFORM := mt6737m
BOARD_HAS_MTK_HARDWARE := true

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6737m
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_VNDK_VERSION := current

# Verified Boot
BOARD_AVB_ENABLE := false  # Disable for older devices
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_ALGORITHM := SHA256_RSA4096
PLATFORM_SEPOLICY_VERSION := 202404
SELINUX_IGNORE_NEVERALLOWS := true

# Security Patch
VENDOR_SECURITY_PATCH := 2021-04-05
BOARD_SEPOLICY_VERS := 202404

# Inherit vendor
include vendor/alps/FRT/BoardConfigVendor.mk
