#!/bin/bash
set -e
rm -rf deployables
mkdir -p deployables
#Working OpenElis
cd OpenElis && ant build -Dmaven.test.skip=true && cd ..
cp OpenElis/openelis/dist/openelis.war deployables
cp OpenElis/OpenElis.zip deployables