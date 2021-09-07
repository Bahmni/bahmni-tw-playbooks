#!/bin/bash
set -e
#Fetch_Artifacts
#Fetch Artifact	Passed	Pipeline Name: OpenElis_#{pipeline_name} Stage Name: Build Job Name: build Source File: deployables/openelis.war Destination: bahmni_package/bahmni-lab/resources
#Fetch Artifact	Passed	Pipeline Name: OpenElis_#{pipeline_name} Stage Name: Build Job Name: build Source File: deployables/OpenElis.zip Destination: bahmni_package/bahmni-lab/resources
#Working Directory: bahmni_package
./bahmni_package/bahmni-lab/test/bahmni_openelis_revision.sh > bahmni_package/bahmni_openelis_revision.json
gunzip emr-functional-tests/dbdump/openelis_backup.sql.gz
mv emr-functional-tests/dbdump/openelis_backup.sql bahmni_package/bahmni-lab/resources/openelis_demo_dump.sql
#working directort: bahmni_package
cd bahmni_package && ./gradlew -PbahmniRelease=${rpm_version} -PtomcatVersion=8.0.12 :bahmni-lab:clean :bahmni-lab:buildRpm