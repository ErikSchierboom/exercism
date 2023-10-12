# Grains

Welcome to Grains on Exercism's AWK Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Calculate the number of grains of wheat on a chessboard given that the number on each square doubles.

There once was a wise servant who saved the life of a prince.
The king promised to pay whatever the servant could dream up.
Knowing that the king loved chess, the servant told the king he would like to have grains of wheat.
One grain on the first square of a chess board, with the number of grains doubling on each successive square.

There are 64 squares on a chessboard (where square 1 has one grain, square 2 has two grains, and so on).

Write code that shows:

- how many grains were on a given square, and
- the total number of grains on the chessboard

## GNU awk and Arbitrary Precision Arithmetic

By default, numbers in `awk` are represented as double-precision floating
point numbers.  This provides 53 bits of precision (see [Table
16.3][table-16.3] in the manual).  Unfortunately, this is insufficient to
complete this exercise (spoiler alert, one test requires 63 bits of
precision).

"Insufficient precision" looks like this:
```sh
$ gawk 'BEGIN {
  n = 2 ^ 54
  if (n == n + 1)
    print "not enough precision"
  else
    print "OK"
}'
```
```none
not enough precision
```

GNU `awk` has the capability to use arbitrary-precision numbers, if the
relevant libraries have been compiled into the `awk` executable. Check
your awk version, and look for "GNU MPFR":
```sh
$ gawk --version
GNU Awk 5.0.1, API: 2.0 (GNU MPFR 4.0.2, GNU MP 6.2.0)
...
```

If it's present, enable the capability using the `-M` option:
```sh
$ gawk -M 'BEGIN {
  n = 2 ^ 54
  if (n == n + 1)
    print "not enough precision"
  else
    print "OK"
}'
```
```none
OK
```

What if my `awk` doesn't have `-M`?  You'll have to call out to an external
program that can do arbitrary precision arithmetic, like `bc`. See the
section [Using getline into a Variable from a Pipe][getline-pipe] for an
example how to do this.


Further reading: [Arbitrary Precision Arithmetic][arbitrary]


[table-16.3]: https://www.gnu.org/software/gawk/manual/html_node/Math-Definitions.html#table_002dieee_002dformats
[arbitrary]: https://www.gnu.org/software/gawk/manual/html_node/Arbitrary-Precision-Arithmetic.html
[getline-pipe]: https://www.gnu.org/software/gawk/manual/html_node/Getline_002fVariable_002fPipe.html

## Source

### Created by

- @glennj

### Based on

The CodeRanch Cattle Drive, Assignment 6 - https://coderanch.com/wiki/718824/Grains