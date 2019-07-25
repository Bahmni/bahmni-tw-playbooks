#!/bin/bash
set -e
gunzip emr-functional-tests/dbdump/openmrs_backup.sql.gz
mv emr-functional-tests/dbdump/openmrs_backup.sql bahmni-package/openmrs/resources/openmrs_demo_dump.sql