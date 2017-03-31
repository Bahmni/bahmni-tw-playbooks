#!/bin/bash
#Fetch Artifact	Passed	Pipeline Name: Bahmni_artifacts_#{pipeline_name} Stage Name: CollectArtefactsStage Job Name: collect-rpms Source Directory: rpms
#Fetch Artifact	Passed	Pipeline Name: Bahmni_artifacts_#{pipeline_name} Stage Name: CollectArtefactsStage Job Name: collect-rpms Source Directory: bahmni_revisions
#Working directory: bahmni-playbooks
ansible-playbook --syntax-check all.ymlconcat-config.yml incr-mysqldbbackup.yml incr-mysqldbrestore.yml incr-postgresdbbackup.yml incr-postgresdbrestore.yml backup-artifacts.yml restore-artifacts.yml mysql-replication.yml postgres-replication.yml -i local
mv bahmni_revisions/*.json bahmni-playbooks/roles/httpd/files/
zip -r bahmni-playbooks.zip bahmni-playbooks --exclude=*.git*
cp bahmni-playbooks.zip bahmni-package/bahmni-installer/resources
/bin/sh bahmni-package/bahmni-installer/scripts/generate-bahmni-version.sh
cp rpm_versions.yml bahmni-package/bahmni-installer/resources
#Working directory: bahmni-package
./gradlew -PbahmniRelease=#{rpm_version} :bahmni-installer:clean :bahmni-installer:buildRpm