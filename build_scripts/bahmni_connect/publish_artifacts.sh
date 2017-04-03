#!/bin/bash
set -e
#Fetch Artifact	Passed	Pipeline Name: Bahmni_Connect_#{pipeline_name} Stage Name: Build Job Name: build Source Directory: artifacts
yes | sudo cp -f artifacts/*  /var/www/offline_artifacts/offline_build_artifacts
aws s3 sync --only-show-errors --delete /var/www/offline_artifacts/offline_build_artifacts/ s3://repo.mybahmni.org/connect/