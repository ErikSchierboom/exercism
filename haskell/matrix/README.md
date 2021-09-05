# Matrix

Welcome to Matrix on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given a string representing a matrix of numbers, return the rows and columns of
that matrix.

So given a string with embedded newlines like:

```text
9 8 7
5 3 2
6 6 7
```

representing this matrix:

```text
    1  2  3
  |---------
1 | 9  8  7
2 | 5  3  2
3 | 6  6  7
```

your code should be able to spit out:

- A list of the rows, reading each row left-to-right while moving
  top-to-bottom across the rows,
- A list of the columns, reading each column top-to-bottom while moving
  from left-to-right.

The rows for our example matrix:

- 9, 8, 7
- 5, 3, 2
- 6, 6, 7

And its columns:

- 9, 5, 6
- 8, 3, 6
- 7, 2, 7

To complete this exercise, you need to create the data type `Matrix`,
with `Eq` and `Show` instances, and implement the following functions:

- `cols`
- `column`
- `flatten`
- `fromList`
- `fromString`
- `reshape`
- `row`
- `rows`
- `shape`
- `transpose`

You will find a dummy data declaration and type signatures already in place,
but it is up to you to define the functions and create a meaningful data type,
newtype or type synonym.

No validation of input is required. Let it fail if the matrix is not
rectangular, invalid chars are encountered, etc.

shape is (rows, cols)

## Source

### Created by

- @etrepum

### Contributed to by

- @iHiD
- @jwg4
- @kytrinyx
- @lpalma
- @navossoc
- @petertseng
- @ppartarr
- @qnikst
- @rbasso
- @sharno
- @SiriusStarr
- @sshine
- @tejasbubane

### Based on

Warmup to the `saddle-points` warmup. - http://jumpstartlab.com