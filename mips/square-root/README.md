# Square Root

Welcome to Square Root on Exercism's MIPS Assembly Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Instructions

Given a natural radicand, return its square root.

Note that the term "radicand" refers to the number for which the root is to be determined.
That is, it is the number under the root symbol.

Check out the Wikipedia pages on [square root][square-root] and [methods of computing square roots][computing-square-roots].

Recall also that natural numbers are positive real whole numbers (i.e. 1, 2, 3 and up).

[square-root]: https://en.wikipedia.org/wiki/Square_root
[computing-square-roots]: https://en.wikipedia.org/wiki/Methods_of_computing_square_roots

## Registers

| Register | Usage     | Type    | Description                |
| -------- | --------- | ------- | -------------------------- |
| `$a0`    | input     | integer | radicand                   |
| `$v0`    | output    | integer | square root                |
| `$t0-9`  | temporary | any     | used for temporary storage |

## Source

### Created by

- @keiravillekode

### Based on

wolf99 - https://github.com/exercism/problem-specifications/pull/1582