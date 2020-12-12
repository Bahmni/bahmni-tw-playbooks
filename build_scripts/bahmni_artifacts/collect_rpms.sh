#!/bin/bash
#Fetch Artifact	Passed	Pipeline Name: Bahmni_MRS_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: Bahmni_MRS_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source File: bahmni_openmrs_revision.json Destination: bahmni_revisions
#Fetch Artifact	Passed	Pipeline Name: OpenERP_#{pipeline_name} Stage Name: package Job Name: package-rpm Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: OpenERP_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source File: bahmni_openerp_revision.json Destination: bahmni_revisions
#Fetch Artifact	Passed	Pipeline Name: OpenElis_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: OpenElis_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source File: bahmni_openelis_revision.json Destination: bahmni_revisions
#Fetch Artifact	Passed	Pipeline Name: Bahmni_Reports_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: Bahmni_pacs_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: Bahmni_event_log_service_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: Bahmni_Connect#{offline_version} Stage Name: Package Job Name: package-rpm Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: Implementer-interface_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: Appointments_frontend_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source Directory: rpms
#Working directory: rpms
cd rpms && ls bahmni-event-log-service-*.noarch.rpm bahmni-offline-*.noarch.rpm
