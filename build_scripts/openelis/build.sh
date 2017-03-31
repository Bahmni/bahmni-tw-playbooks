#!/bin/bash
rm -rf deployables
mkdir -p deployables
#Working OpenElis
build -Dmaven.test.skip=true
cp OpenElis/openelis/dist/openelis.war deployables
cp OpenElis/OpenElis.zip deployables
