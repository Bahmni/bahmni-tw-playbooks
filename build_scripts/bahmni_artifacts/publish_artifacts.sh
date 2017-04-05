#!/bin/bash
#Fetch Artifact	Passed	Pipeline Name: Bahmni_Artifacts_#{pipeline_name} Stage Name: CollectArtefactsStage Job Name: collect-rpms Source Directory: rpms Destination: artifacts
#Fetch Artifact	Passed	Pipeline Name: Bahmni_artifacts_#{pipeline_name} Stage Name: PackageInstaller Job Name: package-rpm Source Directory: rpms Destination: artifacts
#Working directory: artifacts
cd artifacts && /bin/bash yes | sudo cp -f rpms/*.rpm /var/www/rpm/bahmni/
sudo createrepo --verbose --update --cachedir /tmp/rpmcache/ --workers 6 /var/www/rpm/bahmni/
aws s3 sync --only-show-errors --delete /var/www/rpm/bahmni/ s3://repo.mybahmni.org/rpm/bahmni/