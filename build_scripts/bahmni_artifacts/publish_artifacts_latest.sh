#!/bin/bash
aws s3 sync --only-show-errors /var/www/package/bahmni/ s3://repo.mybahmni.org/releases/
