ifneq ($(BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE),)
ifneq ($(BUILD_TINY_ANDROID),true)
#Compile this library only for builds with the latest modem image

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)


## Libs
LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    liblog

LOCAL_SRC_FILES += \
    loc_log.cpp \
    loc_cfg.cpp \
    msg_q.c \
    linked_list.c \
    loc_target.cpp \
    LocHeap.cpp \
    LocTimer.cpp \
    LocThread.cpp \
    MsgTask.cpp \
    loc_misc_utils.cpp \
    loc_nmea.cpp \
    LocIpc.cpp

# Flag -std=c++11 is not accepted by compiler when LOCAL_CLANG is set to true
LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_

ifeq ($(TARGET_BUILD_VARIANT),user)
   LOCAL_CFLAGS += -DTARGET_BUILD_VARIANT_USER
endif

LOCAL_LDFLAGS += -Wl,--export-dynamic

## Includes
LOCAL_HEADER_LIBRARIES := \
    libutils_headers \
    libloc_pla_headers \
    liblocation_api_headers

LOCAL_MODULE := libgps.utils
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional

LOCAL_PRELINK_MODULE := false

LOCAL_CFLAGS += $(GNSS_CFLAGS)

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libgps.utils_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
include $(BUILD_HEADER_LIBRARY)

<<<<<<< HEAD
<<<<<<< HEAD
include $(addsuffix /Android.mk, $(addprefix $(LOCAL_PATH)/, platform_lib_abstractions))

=======
>>>>>>> df54f6d... s2: gps: update from LA.UM.7.2.r1-05300-sdm660.0
=======
include $(addsuffix /Android.mk, $(addprefix $(LOCAL_PATH)/, platform_lib_abstractions))

>>>>>>> 3ac0920... s2: Build libloc_pla and libsensorndkbridge
endif # not BUILD_TINY_ANDROID
endif # BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE
