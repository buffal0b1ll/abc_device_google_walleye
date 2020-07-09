# Copyright (C) 2017-2019 The Dirty Unicorns Project
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

# Include DU common configuration
include vendor/nexus/config/common_full_phone.mk

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit AOSP device configuration for Walleye
$(call inherit-product, device/google/walleye/aosp_walleye.mk)

# Override AOSP build properties
PRODUCT_NAME := abc_walleye
PRODUCT_DEVICE := walleye
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="walleye" \
    PRIVATE_BUILD_DESC="walleye-user 10 QQ3A.200705.002 6506677 release-keys"

BUILD_FINGERPRINT := "google/walleye/walleye:10/QQ3A.200705.002/6506677:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/walleye/walleye:10/QQ3A.200705.002/6506677:user/release-keys

$(call inherit-product-if-exists, vendor/google/walleye/walleye-vendor.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
