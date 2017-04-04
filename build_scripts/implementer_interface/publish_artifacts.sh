#!/bin/bash
set -e
#Fetch Artifact	Passed	Pipeline Name: implementer-interface_v0_89 Stage Name: package Job Name: package-rpm Source Directory: rpms Destination: artifacts
#wokring directory: artifacts
cd artifacts && yes | sudo cp -f rpms/bahmni-implementer-interface-*.rpm /var/www/rpm/bahmni/
sudo createrepo --verbose --update --cachedir /tmp/rpmimplcache/ --workers 2 /var/www/rpm/bahmni/
aws s3 sync --only-show-errors /var/www/rpm/bahmni/ s3://repo.mybahmni.org/rpm/bahmni/