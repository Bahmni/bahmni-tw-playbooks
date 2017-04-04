#!/bin/bash
set -e
#Working directory: bahmni-connect/ui
--login scripts/package.sh
#Working directory: bahmni-android/android
cordova platform remove android
cordova platform add android
git checkout .
#Working directory: bahmni-android/android/www
rm -rf app/
mkdir app
cp -R bahmni-connect/ui/androidDist/* bahmni-android/android/www/app/
rm -rf bahmni_config
mkdir bahmni_config
#Working directory: default-config
--login scripts/package.sh
cp default-config/target/default_config.zip bahmni-android/android/www/bahmni_config/default_config.zip
#Working Directory: bahmni-android/android/www/bahmni_config/
unzip default_config.zip
rm -rf apps aqs beanshell encounterModifier migrations obscalculator ordertemplates templates patientMatchingAlgorithm treatmentRegimenExtension
rm -rf openelis default_config.zip
#Working directory: bahmni-android/android
cp /bahmni-apk-signing/release-signing.properties platforms/android/
cordova build android --release
mv platforms/android/build/outputs/apk/android-release.apk bahmni-connect-android-#{rpm_version}-$GO_PIPELINE_COUNTER.apk
#Working directory: bahmni-connect/ui/
rm -rf chromeDist
rm -rf androidDist