#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/alps/FRT/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_FRT
PRODUCT_DEVICE := FRT
PRODUCT_MANUFACTURER := alps
PRODUCT_BRAND := alps
PRODUCT_MODEL := Nokia 1
PRODUCT_SYSTEM_NAME := FRT_global
PRODUCT_SYSTEM_DEVICE := FRT
PRODUCT_GMS_CLIENTID_BASE := android-alps

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="FRT-user 10 QP1A.190711.020 00WW_3_11D release-keys" \
    BuildFingerprint="Nokia/FRT_00WW/FRT:10/QP1A.190711.020/00WW_3_11D:user/release-keys" \
    SystemName=$(PRODUCT_SYSTEM_NAME) \
    SystemModel=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME) \
    ProductModel=$(PRODUCT_SYSTEM_DEVICE)
