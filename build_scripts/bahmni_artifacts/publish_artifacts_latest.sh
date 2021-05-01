#!/bin/bash
aws s3 sync --only-show-errors --delete /var/www/packages/bahmni/ s3://repo.mybahmni.org/releases/
