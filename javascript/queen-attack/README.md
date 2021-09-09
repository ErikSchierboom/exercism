# Queen Attack

Welcome to Queen Attack on Exercism's JavaScript Track.
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

A queen must be placed on a valid position on the board.
Two queens cannot share the same position.

If a position has not been given, the queens are at their [default starting positions](https://en.wikipedia.org/wiki/Rules_of_chess#Initial_setup). That's the bottom row (1) for the white queen and the top row (8) for the black queen. Both queens start in the fourth column (d).

```text
  a b c d e f g h
8 _ _ _ B _ _ _ _ 8
7 _ _ _ _ _ _ _ _ 7
6 _ _ _ _ _ _ _ _ 6
5 _ _ _ _ _ _ _ _ 5
4 _ _ _ _ _ _ _ _ 4
3 _ _ _ _ _ _ _ _ 3
2 _ _ _ _ _ _ _ _ 2
1 _ _ _ W _ _ _ _ 1
  a b c d e f g h
```

## Source

### Created by

- @matthewmorgan

### Contributed to by

- @abhnvgupta
- @alexashley
- @BoDaly
- @ErikSchierboom
- @IndelicateArgot
- @javaeeeee
- @rchavarria
- @ryanplusplus
- @SleeplessByte
- @smb26

### Based on

J Dalbey's Programming Practice problems - http://users.csc.calpoly.edu/~jdalbey/103/Projects/ProgrammingPractice.html