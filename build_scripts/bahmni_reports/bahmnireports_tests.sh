#!/bin/bash
set -e
#Working directory: bahmni-reports
cd bahmni-reports && mvn clean install -DskipTests -U