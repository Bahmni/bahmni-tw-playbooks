#!/bin/bash
set -e
cd implementer-interface && yarn cache clean
yarn
yarn test
yarn ci
