#!/bin/bash
set -e
find ${artifact_location} -type f -mtime +30 -name bahmni-installer-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-emr-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-erp-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-erp-connect-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-event-log-service-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-implementer-interface-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-lab-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-lab-connect-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-offline-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-openmrs-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-reports-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name dcm4chee-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name bahmni-web-${rpm_version}-* -execdir rm -rf -- {} \;
find ${artifact_location} -type f -mtime +30 -name pacs-integration-${rpm_version}-* -execdir rm -rf -- {} \;
sudo createrepo --verbose --update --cachedir /tmp/rpmcache/ --workers 6 /var/www/rpm/bahmni/
aws s3 sync --only-show-errors --delete /var/www/rpm/bahmni/ s3://repo.mybahmni.org/rpm/bahmni/
