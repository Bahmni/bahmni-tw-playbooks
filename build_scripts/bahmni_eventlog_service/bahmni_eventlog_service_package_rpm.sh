#Fetch Artifact	Passed	Pipeline Name: Bahmni_event_log_service_#{pipeline_name} Stage Name: BuildStage Job Name: build-event-log-service Source File: deployables/event-log-service-webapp.war Destination: bahmni_package/bahmni-event-log-service/resources
#Working directory: bahmni_package
./gradlew -PbahmniRelease=#{rpm_version} :bahmni-event-log-service:clean :bahmni-event-log-service:buildRpm