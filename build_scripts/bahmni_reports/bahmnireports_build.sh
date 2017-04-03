#!/bin/bash
set -e
curl -o pre_build_tasks.sh https://raw.githubusercontent.com/Bahmni/bahmni-scripts/master/ci/pre_build_tasks.sh
/bin/sh pre_build_tasks.sh
mvn -v
#Working directory: bahmni-reports
mvn clean install -DskipTests -U