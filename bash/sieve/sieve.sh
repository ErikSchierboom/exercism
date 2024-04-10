#!/usr/bin/env bash

declare -A sieve
declare -a primes

for (( i=2; i<=$1; i++ )); do
    sieve[$i]=1
done

for (( i=2; i<=$1; i++ )); do
    if [[ ${sieve[$i]} -eq 1 ]]; then
        primes+=($i)
        for (( j=i*i; j<=$1; j+=i )); do
            sieve[$j]=0
        done
    fi
done

echo "${primes[*]}"
