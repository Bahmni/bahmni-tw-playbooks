#!/bin/bash
set -e
sleep 1m

cd bahmni-android/android && cordova platform remove android
cordova platform add android
git checkout .
cd platforms/android
gradle clean test

#Working directory: bahmni-android/android/platforms/android/
#Connect to geny motion instance
# adb connect 172.21.3.153:5555
# ./gradlew clean connectedAndroidTest --debug
# adb uninstall org.bahmni.offline
# adb disconnect 172.21.3.153:5555
