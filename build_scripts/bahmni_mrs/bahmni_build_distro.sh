#!/bin/bash
curl -o pre_build_tasks.sh https://raw.githubusercontent.com/Bahmni/bahmni-scripts/master/ci/pre_build_tasks.sh
pre_build_tasks.sh
#Working directory: openmrs-distro-bahmni
mvn clean install -T2 -U