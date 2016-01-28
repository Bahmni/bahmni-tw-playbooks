#!/bin/bash

install_bahmni_installer(){
	rm -rf /etc/bahmni-installer
	yum remove -y bahmni-installer
	yum localinstall -y rpms/bahmni-installer-*.rpm
	mkdir -p /etc/bahmni-installer/deployment-artifacts	
}

copy_artifacts(){
	echo "Copying the files from bahmni-tw-playbooks/inventory/$1/ to /etc/bahmni-installer/"
	cp -f bahmni-tw-playbooks/inventory/$1/* /etc/bahmni-installer/
	unzip $2_config.zip -d /etc/bahmni-installer/deployment-artifacts/$2_config/
}

copy_db_dump(){
	wget $1 -O /etc/bahmni-installer/deployment-artifacts/mysql_dump.sql
}

deploy(){
	cd /etc/bahmni-installer && bahmni install inventory
}

install_bahmni_installer
copy_artifacts $1 $2
if [[ "$3" = "true" ]];
then
	copy_db_dump $4
fi
deploy

