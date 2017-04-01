#!/bin/bash
#Fetch_Artifacts Pipeline Name: OpenERP_#{pipeline_name} Stage Name: runFunctionalTestsStage Job Name: runFunctionalTestsJob Source File: deployables/openerp-modules.zip Destination: bahmni_package/bahmni-erp/resources
#Fetch_Artifacts Pipeline Name: OpenERP_#{pipeline_name} Stage Name: runFunctionalTestsStage Job Name: openerp-atomfeed-service Source File: openerp-atomfeed-service.war Destination: bahmni_package/bahmni-erp-connect/resources
#Working Directory bahmni_package
./bahmni_package/bahmni-erp/test/bahmni_openerp_revision.sh > bahmni_package/bahmni_openerp_revision.json
gunzip emr-functional-tests/dbdump/openerp_backup.sql.gz
mv emr-functional-tests/dbdump/openerp_backup.sql bahmni_package/bahmni-erp/resources/openerp_demo_dump.sql
#Working Directory bahmni_package
cd bahmni_package && ./gradlew -PbahmniRelease=${rpm_version} :bahmni-erp:clean :bahmni-erp:buildRpm :bahmni-erp-connect:clean :bahmni-erp-connect:buildRpm