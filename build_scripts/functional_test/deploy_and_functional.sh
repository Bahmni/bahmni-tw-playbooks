#!/bin/bash
set -e
#Fetch Artifact Passed  Pipeline Name: Bahmni_MRS_#{pipeline_name} Stage Name: BuildDistroStage Job Name: BahmniDistro Source File: openmrs-distro-bahmni-artifacts/distro-#{bahmni_version}-distro.zip Destination: deployables
#Fetch Artifact Passed  Pipeline Name: Bahmni_MRS_#{pipeline_name} Stage Name: Package Job Name: package-rpm Source Directory: rpms Destination: deployables/downloaded_rpms/
mkdir -p deployables/ui-modules
rm -rf emr-functional-tests/screenshots
mkdir -p emr-functional-tests/screenshots
sudo emr-functional-tests/scripts/drop_databases.sh
sudo yum remove -y bahmni-openmrs bahmni-emr bahmni-web
mkdir -p deployables/downloaded_rpms/rpms
#Working directory: deployables/downloaded_rpms/rpms
cd deployables/downloaded_rpms/rpms && sudo yum install -y bahmni-openmrs*.rpm bahmni-web*.rpm bahmni-emr*.rpm && cd ../../..
sudo service openmrs start
echo BAHMNI_GAUGE_APP_URL = https://$HOSTNAME.mybahmni.org > /var/lib/go-agent/pipelines/$GO_PIPELINE_NAME/emr-functional-tests/spec-results/hostname.txt
cat /var/lib/go-agent/pipelines/$GO_PIPELINE_NAME/emr-functional-tests/spec-results/hostname.txt > /var/lib/go-agent/pipelines/$GO_PIPELINE_NAME/bahmni-gauge/bahmni-gauge-default/env/ci/user.properties
sleep 2m
sudo sed -i 's|##SSLCertificateChainFile /etc/pki/tls/certs/server-chain.crt|SSLCertificateChainFile /etc/bahmni-certs/chained.pem|g' /opt/bahmni-web/etc/ssl.conf
sudo sed -i 's|SSLCertificateKeyFile /etc/pki/tls/private/localhost.key|SSLCertificateKeyFile /etc/bahmni-certs/domain.key|g' /opt/bahmni-web/etc/ssl.conf
sudo sed -i 's|SSLCertificateFile /etc/pki/tls/certs/localhost.crt|SSLCertificateFile /etc/bahmni-certs/cert.crt|g' /opt/bahmni-web/etc/ssl.conf
sudo service httpd restart
sudo service openmrs restart
#Working directory: bahmni-gauge
cd bahmni-gauge && mvn clean install
printf '%s\n' "${PWD}"
echo "The current working directory $PWD."
cd ${specs} && mvn gauge:execute -Denv=ci -Dtags=${bahmni_gauge_tags} -DinParallel=true -Dnodes=${parallel_threads}