#!/usr/bin/env bash

find . -mindepth 1 -maxdepth 1 -type d -execdir bash -c 'pushd {} && npx yarn-audit-fix && popd' \;
