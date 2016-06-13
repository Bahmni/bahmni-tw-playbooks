#!/bin/bash

install_bahmni_installer(){
	rm -rf /etc/bahmni-installer
	yum remove -y bahmni-installer
	yum localinstall -y rpms/bahmni-installer-*.rpm
	mkdir -p /etc/bahmni-installer/deployment-artifacts
}

copy_artifacts(){
	echo "Copying bahmni-tw-playbooks/$1 to /etc/bahmni-installer/inventory"
	cp -f bahmni-tw-playbooks/inventories/$1 /etc/bahmni-installer/inventory
	cp -f bahmni-tw-playbooks/scripts/setup.yml /etc/bahmni-installer/setup.yml
  echo "Copying $2_config"
	unzip $2_config.zip -d /etc/bahmni-installer/deployment-artifacts/$2_config/
}

copy_db_dump(){
	echo "Dropping the openmrs database"
	ansible bahmni-emr-db -i /etc/bahmni-installer/inventory -m shell -a "mysql -uroot -ppassword openmrs -e 'drop database openmrs'"
	wget --no-check-certificate $1 -O /etc/bahmni-installer/deployment-artifacts/mysql_dump.sql
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
