#!/bin/bash
set -e
#Working directory: bahmni-connect/ui
cd bahmni-connect/ui && scripts/package.sh && cd ../../
#Working directory: bahmni-android/android
cd bahmni-android/android && cordova platform remove android
cordova platform add android
git checkout . && cd ../../
#Working directory: bahmni-android/android/www
cd bahmni-android/android/www && rm -rf app/
mkdir app && cd ../../../
cp -R bahmni-connect/ui/androidDist/* bahmni-android/android/www/app/
rm -rf bahmni_config
mkdir bahmni_config && cd ../../../
#Working directory: default-config
cd default-config && scripts/package.sh
cp default-config/target/default_config.zip bahmni-android/android/www/bahmni_config/default_config.zip && cd ..
#Working Directory: bahmni-android/android/www/bahmni_config/
cd bahmni-android/android/www/bahmni_config/ && unzip default_config.zip
rm -rf apps aqs beanshell encounterModifier migrations obscalculator ordertemplates templates patientMatchingAlgorithm treatmentRegimenExtension
rm -rf openelis default_config.zip && cd ../../../../
#Working directory: bahmni-android/android
cd bahmni-android/android && cp /bahmni-apk-signing/release-signing.properties platforms/android/
cordova build android --release
mv platforms/android/build/outputs/apk/android-release.apk bahmni-connect-android-${rpm_version}-$GO_PIPELINE_COUNTER.apk && cd ../../
#Working directory: bahmni-connect/ui/
cd bahmni-connect/ui/ rm -rf chromeDist
rm -rf androidDist