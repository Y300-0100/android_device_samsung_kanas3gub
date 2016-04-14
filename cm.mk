## Specify phone tech before including full_phone	
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME :=kanas3gub

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device_kanas3gub.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kanas3gub
PRODUCT_NAME := cm_kanas3gub
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G355M
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
