#!/bin/bash
set -e
cd implementer-interface && yarn cache clean
yarn
yarn upgrade-form-control
yarn test
yarn ci
