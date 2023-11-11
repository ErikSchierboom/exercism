# Isogram

Welcome to Isogram on Exercism's MIPS Assembly Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Instructions

Determine if a word or phrase is an isogram.

An isogram (also known as a "non-pattern word") is a word or phrase without a repeating letter, however spaces and hyphens are allowed to appear multiple times.

Examples of isograms:

- lumberjacks
- background
- downstream
- six-year-old

The word _isograms_, however, is not an isogram, because the s repeats.

## Registers

| Register | Usage     | Type    | Description                                       |
| -------- | --------- | ------- | ------------------------------------------------- |
| `$a0`    | input     | address | null-terminated input string                      |
| `$v0`    | output    | boolean | input is an isogram (`0` = `false`, `1` = `true`) |
| `$t0-9`  | temporary | any     | used for temporary storage                        |

## Source

### Created by

- @ozan

### Based on

Wikipedia - https://en.wikipedia.org/wiki/Isogram