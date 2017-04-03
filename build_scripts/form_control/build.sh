#!/bin/bash
set -e
#Working directory: form-controls
yarn cache clean
yarn
yarn test
yarn ci