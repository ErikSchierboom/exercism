find . -mindepth 1 -maxdepth 1 -type d -execdir sh -c 'pushd {} && npm audit fix --force && popd' \;
