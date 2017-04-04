#!/bin/bash
set -e
#Working directory: form-controls
cd form-controls && yarn cache clean
yarn
yarn test
yarn ci