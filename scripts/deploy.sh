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
	unzip $2 -d /etc/bahmni-installer/deployment-artifacts
}

deploy(){
	cd /etc/bahmni-installer
	bahmni install inventory
}

install_bahmni_installer
copy_artifacts
deploy

