#!/bin/bash
set -e
sleep 1m

#Working directory: bahmni-android/android/platforms/android/
cd bahmni-android/android/platforms/android/
./gradlew clean test
#Connect to geny motion instance
# adb connect 172.21.3.153:5555
# ./gradlew clean connectedAndroidTest --debug
# adb uninstall org.bahmni.offline
# adb disconnect 172.21.3.153:5555
