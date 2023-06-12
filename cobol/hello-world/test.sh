#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/
SLUG=${1:-$(basename "${SCRIPT_DIR}")}
COBOLCHECK=./bin/cobolcheck

WHICH_COBOLCHECK=$(which cobolcheck)
if [[ $? -eq 0 ]] ; then
    echo "Found cobolcheck, using $COBOLCHECK"
    COBOLCHECK=$WHICH_COBOLCHECK
elif [ ! -f $SCRIPT_DIR/bin/cobolcheck ]; then
    echo "Cobolcheck not found, try to fetch it."
    cd $SCRIPT_DIR/bin/
    bash fetch-cobolcheck
fi
cd $SCRIPT_DIR
$COBOLCHECK -p $SLUG

# compile and run
echo "COMPILE AND RUN TEST"
cobc -xj test.cob
