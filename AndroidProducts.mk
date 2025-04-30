#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_FRT.mk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/zImage-dtb:kernel
