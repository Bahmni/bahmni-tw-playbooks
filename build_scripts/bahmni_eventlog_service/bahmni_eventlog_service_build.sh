#!/bin/bash
set -e
curl -o pre_build_tasks.sh https://raw.githubusercontent.com/Bahmni/bahmni-scripts/master/ci/pre_build_tasks.sh
/bin/sh pre_build_tasks.sh
#Working directory: event-log-service
cd event-log-service && mvn clean install -U -DskipTests