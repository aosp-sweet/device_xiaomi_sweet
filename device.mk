# Copyright (C) 2021 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.2-impl

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_VENDOR_PROPERTIES += \
    audio.offload.min.duration.secs=40 \
    audio.offload.video=true \
    persist.vendor.audio.hifi=false \
    persist.vendor.audio.misound.disable=true \
    persist.vendor.audio.ring.filter.mask=0 \
    ro.audio.monitorRotation=true \
    ro.af.client_heap_size_kbyte=7168 \
    ro.config.vc_call_vol_steps=11 \
    ro.vendor.audio.soundfx.usb=true \
    ro.vendor.audio.us.proximity=true \
    ro.vendor.audio.us.type=mius \
    vendor.audio.feature.audiozoom.enable=false \
    vendor.audio.usb.disable.sidetone=true

PRODUCT_ODM_PROPERTIES += \
    aaudio.mmap_exclusive_policy=2 \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.audio.adm.buffering.ms=6 \
    vendor.audio.offload.track.enable=false \
    vendor.audio.feature.spkr_prot.enable=true \
    vendor.audio.spkcal.copy.inhal=true \
    vendor.audio.spkr_prot.tx.sampling_rate=48000

# Additional Native Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Bluetooth
PRODUCT_PAKCAGES += \
    libbthost_if

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptive \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=true \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    ro.vendor.bluetooth.wipower=false \
    vendor.qcom.bluetooth.soc=cherokee

PRODUCT_SYSTEM_PROPERTIES += \
    persist.vendor.bt.a2dp.aac_whitelist=false \
    persist.vendor.bt.a2dp.mac_whitelist=false \
    persist.vendor.btstack.enable.twsplus=true \
    persist.vendor.btstack.enable.twsplussho=true \
    persist.vendor.btsatck.absvolfeature=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=false \
    ro.bluetooth.library_name=libbluetooth_qti.so \
    vendor.bluetooth.soc=cherokee

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64

PRODUCT_PACKAGES += \
    libgui_vendor \
    libdng_sdk.vendor \
    libcamera2ndk_vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_SYSTEM_PROPERTIES += \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera,org.lineageos.snap

# Consumer IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Display
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    disable_configstore

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/qdcm_calib_data_xiaomi_k6_38_0c_0a_fhd_dsc_video_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_xiaomi_k6_38_0c_0a_fhd_dsc_video_dsi_panel.xml \
    $(LOCAL_PATH)/configs/display/qdcm_calib_data_xiaomi_k6_38_0e_0b_fhd_dsc_video_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_xiaomi_k6_38_0e_0b_fhd_dsc_video_dsi_panel.xml

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.display.ad=1 \
    ro.vendor.display.ad.sdr_calib_data=/vendor/etc/sdr_config.cfg \
    ro.vendor.display.ad.hdr_calib_data=/vendor/etc/hdr_config.cfg \
    ro.vendor.display.sensortype=2 \
    debug.sf.disable_backpressure=1 \
    debug.sf.enable_egl_image_tracker=1 \
    debug.sf.enable_hwc_vds=1 \
    debug.sf.latch_unsignaled=1 \
    vendor.display.idle_time=0 \
    vendor.display.idle_time_inactive=0

# DRM
PRODUCT_PACKAGES += \
    and6roid.hardware.drm@1.4-service.clearkey \
    android.hardware.drm@1.3.vendor

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi \
    libkeymaster_messages.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gnss_antenna_info.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss_antenna_info.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf

# HIDL
PRODUCT_PACKAGES += \
    libhwbinder.vendor

# IDC
PRPDUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/input/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/input/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-goodix.idc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/input/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# Init
PRODUCT_PACKAGES += \
    init.target.rc \

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/security/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Keylayout
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/input/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout)

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
    hardware/xiaomi

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# Overlay
PRODUCT_PACKAGES += \
    AOSPASweetFrameworks \
    SweetFrameworks \
    SweetSettings \
    SweetSystemUI

PRODUCT_ENFORCE_RRO_TARGETS += *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
MSMSTEPPE := sm6150
TARGET_BOARD_PLATFORM := $(MSMSTEPPE)

# QTI components
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    audio \
    bt \
    gps \
    init \
    overlay \
    wlan

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

PRODUCT_PACKAGES += \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# VNDK
PRODUCT_PACKAGES += \
    vndservicemanager

# Vendor
$(call inherit-product, vendor/xiaomi/sweet/sweet-vendor.mk)

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini
