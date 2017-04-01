#!/bin/bash
rm -rf deployables
mkdir -p deployables
printf '%s\n' "${PWD}"
echo "The current working directory $PWD."
sudo cp -R ./openerp-modules/* $OPENERP_LOCATION/openerp/addons/
#Working directory openerp-functional-tests
./openerp-functional-tests/run.sh || true
zip -r deployables/openerp-modules.zip openerp-modules --exclude=*.git*