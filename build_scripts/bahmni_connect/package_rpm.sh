#!/bin/bash
set -e
#Fetch Artifact	Passed	Pipeline Name: Build_Bahmni_Offline_Sync_#{pipeline_name} Stage Name: build Job Name: omod Source File: omod/bahmniOfflineSync-#{rpm_version}-SNAPSHOT.omod Destination: bahmni-package/bahmni-offline/resources
#Fetch Artifact	Passed	Pipeline Name: Bahmni_Connect_#{pipeline_name} Stage Name: Build Job Name: build Source File: artifacts/bahmni-connect-apps.zip Destination: bahmni-package/bahmni-offline/resources
#Working directory: bahmni-package
cd bahmni-package && ./gradlew -PbahmniRelease=${rpm_version} bahmni-offline:clean bahmni-offline:buildRpm