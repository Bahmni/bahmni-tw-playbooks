#Fetch Artifact	Passed	Pipeline Name: Bahmni_Reports_#{pipeline_name} Stage Name: BuildStage Job Name: Build-Bahmni-Reports Source File: deployables/bahmnireports.war Destination: bahmni_package/bahmni-reports/resources
#Working directory: bahmni_package
./gradlew -PbahmniRelease=#{rpm_version} :bahmni-reports:clean :bahmni-reports:buildRpm