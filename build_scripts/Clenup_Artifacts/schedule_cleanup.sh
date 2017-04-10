#!/bin/bash
set -e
find ${artifact_location}-type f -mtime +7 -name bahmni-installer-${rpm_version}-* -execdir ls -la -- {} \;
