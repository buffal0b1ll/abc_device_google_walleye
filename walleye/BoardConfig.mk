#
# Copyright (C) 2016 The Android Open-Source Project
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

TARGET_BOOTLOADER_BOARD_NAME := walleye
DEFAULT_LOW_PERSISTENCE_MODE_BRIGHTNESS := 0x00000056

BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200,n8 earlycon=msm_serial_dm,0xc1b0000
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := clang-stable
TARGET_KERNEL_SOURCE := kernel/google/wahoo
TARGET_KERNEL_CONFIG := custom_defconfig
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image.lz4-dtb

include device/google/wahoo/BoardConfig.mk
-include vendor/google_devices/walleye/proprietary/BoardConfigVendor.mk

BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432

#sepolicy common to walleye/walleye
BOARD_SEPOLICY_DIRS += device/google/walleye/sepolicy

# Testing related defines
BOARD_PERFSETUP_SCRIPT := platform_testing/scripts/perf-setup/wahoo-setup.sh

BOARD_LISA_TARGET_SCRIPTS := device/google/wahoo/lisa/

# VTS DTBO Verification. This kernel cmdline parameter should be added by the bootloader
# for all future devices.
BOARD_KERNEL_CMDLINE += androidboot.dtbo_idx=3

# Enable for cleam flash
BOARD_USES_SYSTEM_OTHER_ODEX := true
