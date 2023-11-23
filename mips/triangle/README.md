# Triangle

Welcome to Triangle on Exercism's MIPS Assembly Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Instructions

Determine if a triangle is equilateral, isosceles, or scalene.

An _equilateral_ triangle has all three sides the same length.

An _isosceles_ triangle has at least two sides the same length.
(It is sometimes specified as having exactly two sides the same length, but for the purposes of this exercise we'll say at least two.)

A _scalene_ triangle has all sides of different lengths.

## Note

For a shape to be a triangle at all, all sides have to be of length > 0, and the sum of the lengths of any two sides must be greater than or equal to the length of the third side.

In equations:

Let `a`, `b`, and `c` be sides of the triangle.
Then all three of the following expressions must be true:

```text
a + b ≥ c
b + c ≥ a
a + c ≥ b
```

See [Triangle Inequality][triangle-inequality]

[triangle-inequality]: https://en.wikipedia.org/wiki/Triangle_inequality

## Registers

| Register | Usage     | Type    | Description                                                                        |
| -------- | --------- | ------- | ---------------------------------------------------------------------------------- |
| `$a0`    | input     | integer | side a                                                                             |
| `$a1`    | input     | integer | side b                                                                             |
| `$a2`    | input     | integer | side c                                                                             |
| `$v0`    | output    | integer | type of triangle (`0` = scalene, `1` = isoceles, `2` = equilateral, `3` = invalid) |
| `$t0-9`  | temporary | any     | used for temporary storage                                                         |

## Source

### Created by

- @ozan

### Contributed to by

- @sputnick1124

### Based on

The Ruby Koans triangle project, parts 1 & 2 - https://web.archive.org/web/20220831105330/http://rubykoans.com