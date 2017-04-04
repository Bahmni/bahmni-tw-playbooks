#!/bin/bash
set -e
#Fetch Artifact	Passed	Stage Name: defaultStage Job Name: deploy Source File: spec-results/hostname.txt
cat /var/lib/go-agent/pipelines/$GO_PIPELINE_NAME/emr-functional-tests/spec-results/hostname.txt > /var/lib/go-agent/pipelines/$GO_PIPELINE_NAME/bahmni-gauge/bahmni-gauge-default/env/ci/user.properties
#Working director: bahmni-gauge
cd bahmni-gauge && mvn clean install && cd ..
cd ${specs} &&  mvn gauge:execute -Dtags=${bahmni_gauge_tags} -DinParallel=true -Dnodes=${parallel_threads}