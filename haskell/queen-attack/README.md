# Queen Attack

Welcome to Queen Attack on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given the position of two queens on a chess board, indicate whether or not they
are positioned so that they can attack each other.

In the game of chess, a queen can attack pieces which are on the same
row, column, or diagonal.

A chessboard can be represented by an 8 by 8 array.

So if you're told the white queen is at (2, 3) and the black queen at
(5, 6), then you'd know you've got a set-up like so:

```text
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
```

You'd also be able to answer whether the queens can attack each other.
In this case, that answer would be yes, they can, because both pieces
share a diagonal.

To complete this exercise, you need to implement the following functions:

- `boardString`
- `canAttack`

You will find the type signatures already in place, but it is up to you
to define the functions.

Positions are specified as two-tuples:

- The first element is the row (rank in Chess terms).
- The second element is is the column (file in Chess terms).
- (0, 0) is the top left of the board, (0, 7) is the upper right,
- (7, 0) is the bottom left, and (7, 7) is the bottom right.

## Source

### Created by

- @etrepum

### Contributed to by

- @alexkalderimis
- @iHiD
- @insideoutclub
- @khalilfazal
- @kytrinyx
- @lpalma
- @navossoc
- @ozan
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @stevejb71
- @tejasbubane

### Based on

J Dalbey's Programming Practice problems - http://users.csc.calpoly.edu/~jdalbey/103/Projects/ProgrammingPractice.html