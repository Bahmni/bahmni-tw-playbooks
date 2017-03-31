#!/bin/bash
#working directory: openmrs-module-bahmniapps/ui
npm cache clean
#working directory: openmrs-module-bahmniapps/ui
bower cache clean
#working directory: openmrs-module-bahmniapps/ui
rm -rf coverage/
#working directory: openmrs-module-bahmniapps/ui
/bin/bash --login scripts/package.sh