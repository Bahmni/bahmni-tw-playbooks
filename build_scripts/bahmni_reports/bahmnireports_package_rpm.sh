#!/bin/bash
set -e
cd bahmni_package && ./gradlew -PbahmniRelease=${rpm_version} :bahmni-reports:clean :bahmni-reports:buildRpm
