#	Fetch Artifact	Passed	Pipeline Name: Bahmni_pacs_#{pipeline_name} Stage Name: Build Job Name: build Source File: deployables/pacs-integration.war Destination: bahmni_package/bahmni-pacs/resources/pacs-integration
#Working directory: bahmni_package
./gradlew -PbahmniRelease=#{rpm_version} :bahmni-pacs:clean :bahmni-pacs:dist :bahmni-pacs:dist_dcm4chee