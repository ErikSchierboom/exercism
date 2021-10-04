find . -mindepth 1 -maxdepth 1 -type d -execdir sh -c 'pushd {} && npx npm-check-updates -u && yarn install && popd' \;
git add .
git commit -m "typescript: update packages"
git push

