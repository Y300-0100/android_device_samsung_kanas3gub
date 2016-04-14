# Copyright (C) 2014 The CyanogenMod Project
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/kanas3gnfcxx/kanas3gnfcxx-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/kanas3gub/rootdir/init.sc8830_ss.rc:root/init.sc8830_ss.rc \
	device/samsung/kanas3gub/rootdir/init.sc8830.usb.rc:root/init.sc8830.usb.rc \
	device/samsung/kanas3gub/rootdir/init.sc8830.rc:root/init.sc8830.rc \
	device/samsung/kanas3gub/rootdir/init.trace.rc:root/init.trace.rc \
	device/samsung/kanas3gub/rootdir/init.kanas3gub.rc:root/init.kanas3gub.rc \
	device/samsung/kanas3gub/rootdir/init.board.rc:root/init.board.rc \
	device/samsung/kanas3gub/rootdir/init.kanas3gub_base.rc:root/init.kanas3gub_base.rc \
	device/samsung/kanas3gub/rootdir/init.rc:root/init.rc \
	device/samsung/kanas3gub/rootdir/init.usb.rc:root/init.usb.rc \
	device/samsung/kanas3gub/rootdir/init.wifi.rc:root/init.wifi.rc \
	device/samsung/kanas3gub/rootdir/seapp_contexts:root/seapp_contexts \
	device/samsung/kanas3gub/rootdir/sepolicy:root/sepolicy \
	device/samsung/kanas3gub/rootdir/ueventd.sc8830.rc:root/ueventd.sc8830.rc \
	device/samsung/kanas3gub/rootdir/fstab.sc8830:root/fstab.sc8830 \
	device/samsung/kanas3gub/rootdir/property_contexts:root/property_contexts

# Override phone-hdpi-512-dalvik-heap to match value on stock
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapgrowthlimit=64m

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.service.adb.enable=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kanas3gub
PRODUCT_DEVICE := kanas3gub
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G355M
