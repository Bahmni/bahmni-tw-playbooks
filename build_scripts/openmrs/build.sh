#!/bin/bash
gunzip emr-functional-tests/dbdump/openmrs_backup.sql.gz
mv emr-functional-tests/dbdump/openmrs_backup.sql bahmni-package/openmrs/resources/openmrs_demo_dump.sql
#Working directory: bahmni-package
cd bahmni-package && ./gradlew -PbahmniRelease=${rpm_version} clean --debug :openmrs:buildRpm