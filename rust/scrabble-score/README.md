# Scrabble Score

Welcome to Scrabble Score on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

[Scrabble][wikipedia] is a word game where players place letter tiles on a board to form words.
Each letter has a value.
A word's score is the sum of its letters' values.

[wikipedia]: https://en.wikipedia.org/wiki/Scrabble

## Instructions

Your task is to compute a word's Scrabble score by summing the values of its letters.

The letters are valued as follows:

| Letter                       | Value |
| ---------------------------- | ----- |
| A, E, I, O, U, L, N, R, S, T | 1     |
| D, G                         | 2     |
| B, C, M, P                   | 3     |
| F, H, V, W, Y                | 4     |
| K                            | 5     |
| J, X                         | 8     |
| Q, Z                         | 10    |

For example, the word "cabbage" is worth 14 points:

- 3 points for C
- 1 point for A
- 3 points for B
- 3 points for B
- 1 point for A
- 2 points for G
- 1 point for E

## Source

### Created by

- @IanWhitney

### Contributed to by

- @ashleygwilliams
- @AvasDream
- @coriolinus
- @cwhakes
- @efx
- @ErikSchierboom
- @IanWhitney
- @juleskers
- @kotp
- @lutostag
- @mkantor
- @navossoc
- @nfiles
- @petertseng
- @rofrol
- @stringparser
- @xakon
- @ZapAnton

### Based on

Inspired by the Extreme Startup game - https://github.com/rchatley/extreme_startup