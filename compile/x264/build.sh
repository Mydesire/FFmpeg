#!/bin/bash


#设置错误检查,如果语句出错立即退出
set -e

#export ANDROID_NDK=/Users/meitu/soft/android-ndk-r14b
#export FF_ANDROID_PLATFORM=android-14

NDK_HOME=${ANDROID_NDK}
ANDROID_API=${FF_ANDROID_PLATFORM}
SYSROOT=${NDK_HOME}/platforms/${ANDROID_API}/arch-arm/
# 当前操作系统
UNAME_S=$(uname -s)
# 默认为linux
FF_NDK_OS_NAME=linux-x86_64
case "$UNAME_S" in
    Darwin)
       FF_NDK_OS_NAME=darwin-x86_64
    ;;
    CYGWIN_NT-*)
       FF_NDK_OS_NAME=windows-x86_64
    ;;
    MINGW64_NT-*)
       FF_NDK_OS_NAME=windows-x86_64
    ;;
esac
echo "运行环境：$UNAME_S"
TOOLCHAIN=${NDK_HOME}/toolchains/arm-linux-androideabi-4.9/prebuilt/${FF_NDK_OS_NAME}


CPU=arm
PREFIX=$(pwd)/Android/${CPU}

./configure \
    --prefix=${PREFIX} \
    --enable-static \
    --disable-shared \
    --disable-asm \
    --enable-pic \
    --enable-strip \
    --cross-prefix=${TOOLCHAIN}/bin/arm-linux-androideabi- \
    --host=arm-linux-androideabi \
    --sysroot=${SYSROOT} \
    --extra-cflags="-Os -fPIC -march=armv7-a  -mfloat-abi=softfp -mfpu=neon" \
    --extra-ldflags="-Os -fPIC"

make

make install





