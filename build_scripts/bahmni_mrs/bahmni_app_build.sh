#!/bin/bash
#working directory: openmrs-module-bahmniapps/ui
cd openmrs-module-bahmniapps/ui && npm cache clean --force
bower cache clean
rm -rf coverage/
/bin/bash scripts/package.sh