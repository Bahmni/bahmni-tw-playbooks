#!/bin/bash
curl -o pre_build_tasks.sh https://raw.githubusercontent.com/Bahmni/bahmni-scripts/master/ci/pre_build_tasks.sh
/bin/sh pre_build_tasks.sh
#Working directory : bahmnicore
cd bahmnicore && mvn clean -U deploy