#!/bin/bash
set -e
cd implementer-interface && yarn cache clean
yarn upgrade-form-control
yarn
yarn test
yarn ci
