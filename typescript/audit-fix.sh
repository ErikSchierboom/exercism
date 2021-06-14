find . -mindepth 1 -maxdepth 1 -type d -execdir sh -c 'pushd {} && npx yarn-audit-fix && popd' \;
