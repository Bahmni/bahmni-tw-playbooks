#!/bin/bash
set -e
#Fetch Artifact	Passed	Pipeline Name: implementer-interface_v0_89 Stage Name: Build Job Name: Build Source File: implementer_interface.zip Destination: implementer-interface/package/resources/
#Working directory: implementer-interface/package
cd implementer-interface/package && ./gradlew -Pversion=#{rpmVersion} clean buildRpm