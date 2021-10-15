#!/usr/bin/env bash

find . -mindepth 1 -maxdepth 1 -type d -execdir bash -c 'pushd {} && npx npm-check-updates -u && npm install && popd' \;
git add .
git commit -m "javascript: update packages"
git push

