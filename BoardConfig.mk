DEVICE_PATH := device/samsung/a30
BOARD_VENDOR := samsung

# Security patch level
VENDOR_SECURITY_PATCH := 2020-02-01

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos7904
TARGET_SOC := exynos7904
TARGET_BOOTLOADER_BOARD_NAME := universal7885
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

# Secondary Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/samsung/a30
TARGET_KERNEL_CONFIG := exynos7885-a30_defconfig

TARGET_USES_64_BIT_BINDER := true

# Image
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --header_version 1 --board SRPRL14A004RU
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos
BOARD_INCLUDE_RECOVERY_DTBO := true

# System-as-root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Temporary
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image
TARGET_PREBUILT_DTBIMAGE := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5033164800
BOARD_VENDORIMAGE_PARTITION_SIZE := 595591168
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_BOOTIMAGE_PARTITION_SIZE := 37748736
BOARD_FLASH_BLOCK_SIZE := 4096

# Seperate Vendor
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_JOURNAL_SIZE := 0
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Bootanimation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2340

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab

# Recovery (TWRP)
ifeq ($(RECOVERY_VARIANT),twrp)
RECOVERY_SDCARD_ON_DATA := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 128
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_USE_NEW_MINADBD := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
endif

# Android Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# VNDK
BOARD_VNDK_VERSION := current
BOARD_VNDK_RUNTIME_DISABLE := true

# DEX Pre-optimization
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true
  endif
endif

# Shims
# TODO camera

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# SELinux
# BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private

#DEVICE_MANIFEST_FILE := vendor/samsung/a30/proprietary/vendor/etc/vintf/manifest/vendor.samsung.hardware.base@1.0-service.xml

#DEVICE_MANIFEST_FILE := vendor/samsung/a30/proprietary/vendor/etc/vintf/manifest/vendor.samsung.hardware.base@1.0-service.xml

#DEVICE_MATRIX_FILE := vendor/samsung/a30/proprietary/vendor/etc/vintf/manifest/vendor.samsung.hardware.base@1.0-service.xml

# Lineage hardware
ifneq ($(findstring aosp, $(TARGET_PRODUCT)),)
BOARD_HARDWARE_CLASS := \
    hardware/samsung/
endif

# Inherit from the proprietary version
-include vendor/samsung/a30/BoardConfigVendor.mk
