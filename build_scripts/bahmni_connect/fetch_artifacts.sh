#!/bin/bash
set -e
v_github_token=${GITHUB_TOKEN}
v_connect_android_artifact_id=${connect_android_artifact_id}
v_connect_pwa_artifact_id=${connect_pwa_artifact_id}
v_rpm_version=${rpm_version}
v_go_pipeline_counter=${GO_PIPELINE_COUNTER}

echo "Trying to get artifacts for connect-pwa:${v_connect_pwa_artifact_id} connect-android:${v_connect_android_artifact_id} for rpm-version: ${v_rpm_version} pipeline-counter: ${v_go_pipeline_counter}"

echo "Downloading Connect android apk zip ..... "
wget --header "Authorization: token ${v_github_token}" --output-document=bahmni-connect-apk.zip https://api.github.com/repos/Bahmni/bahmni-offline/actions/artifacts/${v_connect_android_artifact_id}/zip
echo "Downloading Connect pwa zip ..... "
wget --header "Authorization: token ${v_github_token}" --output-document=bahmni-connect-apps.zip https://api.github.com/repos/Bahmni/bahmni-connect/actions/artifacts/181206103/zip

echo "Checking if downloaded apk zip is expandable ... "
unzip -o bahmni-connect-apk.zip
mv app-debug.apk bahmni-connect-android-${v_rpm_version}-${v_go_pipeline_counter}.apk

echo "Checking if downloaded pwa zip is expandable ... "
rm -rf bahmni-connect-apps
unzip bahmni-connect-apps.zip -d bahmni-connect-apps