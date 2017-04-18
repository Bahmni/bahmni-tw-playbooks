#!/bin/bash
set -e
#Working directory: implementer-interface
cd implementer-interface && yarn cache clean
yarn
yarn test
yarn ci