#!/bin/bash
#Fetch Artifact	Passed	Pipeline Name: OpenMRS_#{pipeline_name} Stage Name: buildRPM Job Name: buildRPM Source Directory: rpms/
#Fetch Artifact	Passed	Pipeline Name: Bahmni_MRS_#{pipeline_name} Stage Name: BuildDistroStage Job Name: BahmniDistro Source File: openmrs-distro-bahmni-artifacts/distro-#{bahmni_version}-distro.zip Destination: bahmni_package/bahmni-emr/resources
#Fetch Artifact	Passed	Pipeline Name: Bahmni_MRS_#{pipeline_name} Stage Name: BuildStage Job Name: BahmniApps Source File: bahmniapps.zip Destination: bahmni_package/bahmni-web/resources
#Fetch Artifact	Passed	Pipeline Name: ClientSideLogging Stage Name: defaultStage Job Name: Nothing Source Directory: client_side_logging Destination: bahmni_package/bahmni-web/resources
#Fetch Artifact	Passed	Pipeline Name: Bahmni_MRS_#{pipeline_name} Stage Name: BuildDistroStage Job Name: BahmniDistro Source File: openmrs-distro-bahmni-artifacts/distro/openelis-atomfeed-client-#{bahmni_version}.omod Destination: bahmni_package/bahmni-lab-connect/resources
#Working directory : default-config
--login scripts/package.sh
cp default-config/target/default_config.zip bahmni_package/bahmni-web/resources/
echo $JAVA_HOME

#Working directory: bahmni_package
./bahmni-web/test/bahmni_openmrs_revision.sh > bahmni_openmrs_revision.json

#Working directory: bahmni_package
./gradlew -PbahmniRelease=#{rpm_version} :bahmni-emr:clean :bahmni-emr:buildRpm :bahmni-web:clean :bahmni-web:buildRpm :bahmni-lab-connect:clean :bahmni-lab-connect:buildRpm