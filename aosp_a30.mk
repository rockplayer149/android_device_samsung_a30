# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Inherit from a30 device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := samsung
PRODUCT_DEVICE := a30
PRODUCT_MANUFACTURER := samsung
PRODUCT_NAME := aosp_a30
PRODUCT_MODEL := SM-A305F

PRODUCT_GMS_CLIENTID_BASE := android-samsung
TARGET_VENDOR := samsung
TARGET_VENDOR_PRODUCT_NAME := a30dd

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
# BUILD_FINGERPRINT := samsung/a30dd/a30:10/QP1A.190711.020/A305FDDU4BTB3:user/release-keys
