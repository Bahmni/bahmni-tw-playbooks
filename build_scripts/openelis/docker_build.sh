#!/bin/bash
set -xe
#Building bahmni core which has embedded Tomcat Server
cd bahmni-package && ./gradlew -PbahmniRelease=${rpm_version} :core:clean :core:build
cp core/build/libs/core-1.0-SNAPSHOT.jar bahmni-lab/docker/bahmni-core.jar
cd ..
#Fetching Database Backup Data
#gunzip emr-functional-tests/dbdump/openelis_backup.sql.gz
#mv emr-functional-tests/dbdump/openelis_backup.sql bahmni_package/bahmni-lab/resources/openelis_demo_dump.sql
#Building Docker images
cd bahmni-package/bahmni-lab
docker build -t bahmni/openelis-db:latest -f docker/db.Dockerfile . --no-cache
docker build -t bahmni/openelis:latest -f docker/Dockerfile . --no-cache
