#!/bin/bash
set -e
github_token=$1
connect_android_artifact_id=$2
connect_pwa_artifact_id=$3
rpm_version=$4
go_pipeline_counter=$5

echo "Trying to get artifacts for connect-pwa:${connect_pwa_artifact_id} connect-android:${connect_android_artifact_id} for rpm-version: ${rpm_version} pipeline-counter: ${go_pipeline_counter}"

echo "Downloading Connect android apk zip ..... "
wget --header "Authorization: token ${github_token}" --output-document=bahmni-connect-apk.zip https://api.github.com/repos/Bahmni/bahmni-offline/actions/artifacts/${connect_android_artifact_id}/zip
echo "Downloading Connect pwa zip ..... "
wget --header "Authorization: token ${github_token}" --output-document=bahmni-connect-apps.zip https://api.github.com/repos/Bahmni/bahmni-connect/actions/artifacts/${connect_pwa_artifact_id}/zip

echo "Checking if downloaded apk zip is expandable ... "
unzip -o bahmni-connect-apk.zip
mv app-debug.apk bahmni-connect-android-${rpm_version}-${go_pipeline_counter}.apk

echo "Checking if downloaded pwa zip is expandable ... "
rm -rf bahmni-connect-apps
unzip bahmni-connect-apps.zip -d bahmni-connect-apps