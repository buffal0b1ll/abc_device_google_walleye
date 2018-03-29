#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Include aquarios phone config
include vendor/aquarios/configs/aquarios_phone.mk
include vendor/aquarios/products/walleye.mk

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Call some device specific files for taimen
$(call inherit-product, device/google/walleye/device.mk)
$(call inherit-product, device/google/walleye/device-walleye.mk)
$(call inherit-product-if-exists, vendor/google_devices/walleye/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google/walleye/walleye-vendor.mk)

# Build with gapps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)

# Audio effects
PRODUCT_COPY_FILES += \
    device/google/walleye/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# Include AmbientSense if it's available
-include vendor/ambientmusic/AmbientMusic.m

PRODUCT_PACKAGES += \
    netutils-wrapper-1.0 \
    vndk_package

PRODUCT_RESTRICT_VENDOR_FILES := false

# Boot animation resolution
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
