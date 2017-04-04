#!/bin/bash
set -e
#Working directory: bahmni-android/android/platforms/android/
cd bahmni-android/android/platforms/android/ && ./gradlew clean test
./gradlew clean connectedAndroidTest --debug