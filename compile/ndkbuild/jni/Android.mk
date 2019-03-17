LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := ijkffmpeg
LOCAL_SRC_FILES := $(LOCAL_PATH)/libffmpeg.so
LOCAL_LDFLAGS += -fPIC
include $(PREBUILT_SHARED_LIBRARY)
