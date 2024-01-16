#!/usr/bin/env bash

if (( $1 % 4 == 0 && ($1 % 100 != 0 || $1 % 400 == 0) ));
    echo "true"
else
    echo "false"
fi
