#
# Copyright (C) 2020 The OctaviOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_USES_QCOM_HARDWARE := true
PRODUCT_BOARD_PLATFORM := sdm660
TARGET_BOARD_PLATFORM := sdm660
OVERRIDE_QCOM_HARDWARE_VARIANT := msm8998-asus
#USE_GAPPS := true


# Inherit from sdm660-common
$(call inherit-product, device/asus/sdm660-common/sdm660.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk

PRODUCT_PACKAGES += \
    NoCutoutOverlay

# Ramdisk
PRODUCT_PACKAGES += \
    init.device.rc

# Thermal configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Wifi
PRODUCT_PACKAGES += \
    X01BDWifiOverlay

# Inherit the proprietary files
$(call inherit-product, vendor/asus/X01BD/X01BD-vendor.mk)
