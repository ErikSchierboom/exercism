# Nth Prime

Welcome to Nth Prime on Exercism's MIPS Assembly Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Instructions

Given a number n, determine what the nth prime is.

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

If your language provides methods in the standard library to deal with prime numbers, pretend they don't exist and implement them yourself.

## Registers

| Register | Usage     | Type    | Description                |
| -------- | --------- | ------- | -------------------------- |
| `$a0`    | input     | integer | prime index                |
| `$v0`    | output    | integer | nth prime value            |
| `$t0-9`  | temporary | any     | used for temporary storage |

## Source

### Created by

- @qjd2413

### Contributed to by

- @ozan

### Based on

A variation on Problem 7 at Project Euler - https://projecteuler.net/problem=7