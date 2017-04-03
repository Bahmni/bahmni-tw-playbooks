#!/bin/bash
set -e
#Working directory: implementer-interface
yarn cache clean
yarn upgrade-form-control
yarn
yarn test
yarn ci