# Triangle

Welcome to Triangle on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Determine if a triangle is equilateral, isosceles, or scalene.

An _equilateral_ triangle has all three sides the same length.

An _isosceles_ triangle has at least two sides the same length. (It is sometimes
specified as having exactly two sides the same length, but for the purposes of
this exercise we'll say at least two.)

A _scalene_ triangle has all sides of different lengths.

## Note

For a shape to be a triangle at all, all sides have to be of length > 0, and the sum of the lengths of any two sides must be greater than or equal to the length of the third side.

In equations:

Let `a`, `b`, and `c` be sides of the triangle. Then all three of the following expressions must be true:

```text
a + b ≥ c
b + c ≥ a
a + c ≥ b
```

See [Triangle Inequality](https://en.wikipedia.org/wiki/Triangle_inequality).

## Dig Deeper

The case where the sum of the lengths of two sides _equals_ that of the
third is known as a _degenerate_ triangle - it has zero area and looks like
a single line. Feel free to add your own code/tests to check for degenerate triangles.


## Hint

For this exercise you will need to implement a simple S3 class. If you are not familiar with S3, a great starting point is the [chapter on S3](http://adv-r.hadley.nz/s3.html) in Hadley Wickham's book Advanced R.

## Source

### Created by

- @jonmcalder

### Contributed to by

- @katrinleinweber
- @zacchaeusluke

### Based on

The Ruby Koans triangle project, parts 1 & 2 - http://rubykoans.com