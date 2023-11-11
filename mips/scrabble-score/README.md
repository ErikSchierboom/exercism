# Scrabble Score

Welcome to Scrabble Score on Exercism's MIPS Assembly Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Instructions

Given a word, compute the Scrabble score for that word.

## Letter Values

You'll need these:

```text
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
```

## Examples

"cabbage" should be scored as worth 14 points:

- 3 points for C
- 1 point for A, twice
- 3 points for B, twice
- 2 points for G
- 1 point for E

And to total:

- `3 + 2*1 + 2*3 + 2 + 1`
- = `3 + 2 + 6 + 3`
- = `5 + 9`
- = 14

## Extensions

- You can play a double or a triple letter.
- You can play a double or a triple word.

## Registers

| Register | Usage     | Type    | Description                  |
| -------- | --------- | ------- | ---------------------------- |
| `$a0`    | input     | address | null-terminated input string |
| `$v0`    | input     | integer | scrabble score               |
| `$t0-9`  | temporary | any     | for temporary storage        |

## Source

### Created by

- @mpriestman

### Contributed to by

- @ozan

### Based on

Inspired by the Extreme Startup game - https://github.com/rchatley/extreme_startup