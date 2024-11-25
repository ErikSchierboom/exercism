# Flatten Array

Welcome to Flatten Array on Exercism's Uiua Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Take a nested list and return a single flattened list with all values except nil/null.

The challenge is to take an arbitrarily-deep nested list-like structure and produce a flattened structure without any nil/null values.

For example:

input: [1,[2,3,null,4],[null],5]

output: [1,2,3,4,5]

As Uiua does not have `null`, we've replaced them with `∞` (`infinity`) values.
You should therefore flatten the array _and_ remove the `∞` values.

## Source

### Created by

- @erikschierboom

### Based on

Interview Question - https://reference.wolfram.com/language/ref/Flatten.html