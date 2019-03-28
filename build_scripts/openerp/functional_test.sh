#!/bin/bash
set -e
rm -rf deployables
mkdir -p deployables
printf '%s\n' "${PWD}"
echo "The current working directory $PWD."
sudo cp -R ./odoo-modules/* $ODOO_LOCATION/openerp/addons/
#Working directory openerp-functional-tests
cd openerp-functional-tests && ./run.sh || true
zip -r ../deployables/odoo-modules.zip ../odoo-modules --exclude=*.git* --exclude=*.git*
