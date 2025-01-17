#
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2018-2021 The Xiaomi-SDM660 Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common tree and GCam makefiles
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)
$(call inherit-product-if-exists, packages/apps/GoogleCamera/gcam.mk)

# Device Path
DEVICE_PATH := device/xiaomi/lavender

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	 $(DEVICE_PATH)/overlay

# Audio
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
	$(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_BOOTANIMATION_SIZE := 1080
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

BOARD_HAVE_IR := true

# Device properties
$(call inherit-product, $(DEVICE_PATH)/device_prop.mk)

# FM
BOARD_HAVE_QCOM_FM := true

# Media
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml

# Properties ($PATH.prop)
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Keylayout
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/keylayout/sdm660-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sdm660-snd-card_Button_Jack.kl

# Ramdisk
PRODUCT_PACKAGES += \
	init.device.rc

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sensors
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf \
	$(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
	$(DEVICE_PATH)/configs/sensors/elliptic.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/elliptic.conf

# Vibrator
PRODUCT_PACKAGES += \
	vendor.qti.hardware.vibrator@1.2-service

# Wifi
PRODUCT_PACKAGES += \
    LavenderWifiOverlay

# Vendor files
$(call inherit-product, vendor/xiaomi/lavender/lavender-vendor.mk)
