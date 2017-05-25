#!/bin/bash
cd artifacts && /bin/bash yes | sudo cp -f rpms/*.rpm /var/www/rpm/bahmni/
sudo createrepo --verbose --update --cachedir /tmp/rpmcache/ --workers 6 /var/www/rpm/bahmni/
aws s3 sync --only-show-errors --delete /var/www/rpm/bahmni/ s3://repo.mybahmni.org/rpm/bahmni/
