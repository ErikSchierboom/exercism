# Square Root

Welcome to Square Root on Exercism's Clojure Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

We are launching a deep space exploration rocket and we need a way to make sure the navigation system stays on target.

As the first step in our calculation, we take a target number and find its square root (that is, the number that when multiplied by itself equals the target number).

The journey will be very long.
To make the batteries last as long as possible, we had to make our rocket's onboard computer very power efficient.
Unfortunately that means that we can't rely on fancy math libraries and functions, as they use more power.
Instead we want to implement our own square root calculation.

## Instructions

Your task is to calculate the square root of a given number.

- Try to avoid using the pre-existing math libraries of your language.
- As input you'll be given a positive whole number, i.e. 1, 2, 3, 4…
- You are only required to handle cases where the result is a positive whole number.

Some potential approaches:

- Linear or binary search for a number that gives the input number when squared.
- Successive approximation using Newton's or Heron's method.
- Calculating one digit at a time or one bit at a time.

You can check out the Wikipedia pages on [integer square root][integer-square-root] and [methods of computing square roots][computing-square-roots] to help with choosing a method of calculation.

[integer-square-root]: https://en.wikipedia.org/wiki/Integer_square_root
[computing-square-roots]: https://en.wikipedia.org/wiki/Methods_of_computing_square_roots

## Source

### Created by

- @erikschierboom

### Based on

wolf99 - https://github.com/exercism/problem-specifications/pull/1582