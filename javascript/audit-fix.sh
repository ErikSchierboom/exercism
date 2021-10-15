#!/usr/bin/env bash

find . -mindepth 1 -maxdepth 1 -type d -execdir bash -c 'pushd {} && npm audit fix --force && popd' \;
