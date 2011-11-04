#! /bin/bash

LANGUAGE=objective-c
ARCH=armv7
SYSROOT=/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.0.sdk
CLANG_INCLUDE=/usr/lib/clang/3.0/include
PCH_PATH=ChaiOneUtils_Prefix.pch

INCLUDES=''
for folder in `find . -type d`
do
  INCLUDES="$INCLUDES -I $folder"
done

FILES=''
for file in `find . -name "*.m"`
do
  FILES="$FILES $file"
done

oclint -x $LANGUAGE -arch $ARCH -isysroot=$SYSROOT -I $CLANG_INCLUDE $INCLUDES -include $PCH_PATH $FILES -html -o oclint-report.html