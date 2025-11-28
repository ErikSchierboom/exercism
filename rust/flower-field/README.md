# Flower Field

Welcome to Flower Field on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

[Flower Field][history] is a compassionate reimagining of the popular game Minesweeper.
The object of the game is to find all the flowers in the garden using numeric hints that indicate how many flowers are directly adjacent (horizontally, vertically, diagonally) to a square.
"Flower Field" shipped in regional versions of Microsoft Windows in Italy, Germany, South Korea, Japan and Taiwan.

[history]: https://web.archive.org/web/20020409051321fw_/http://rcm.usr.dsi.unimi.it/rcmweb/fnm/

## Instructions

Your task is to add flower counts to empty squares in a completed Flower Field garden.
The garden itself is a rectangle board composed of squares that are either empty (`' '`) or a flower (`'*'`).

For each empty square, count the number of flowers adjacent to it (horizontally, vertically, diagonally).
If the empty square has no adjacent flowers, leave it empty.
Otherwise replace it with the count of adjacent flowers.

For example, you may receive a 5 x 4 board like this (empty spaces are represented here with the '·' character for display on screen):

```text
·*·*·
··*··
··*··
·····
```

Which your code should transform into this:

```text
1*3*1
13*31
·2*2·
·111·
```

## Performance Hint

All the inputs and outputs are in ASCII.
Rust `String`s and `&str` are utf8, so while one might expect `"Hello".chars()` to be simple, it actually has to check each char to see if it's 1, 2, 3 or 4 `u8`s long.
If we know a `&str` is ASCII then we can call `.as_bytes()` and refer to the underlying data as a `&[u8]` (byte slice).
Iterating over a slice of ASCII bytes is much quicker as there are no codepoints involved - every ASCII byte is one `u8` long.

Can you complete the challenge without cloning the input?

## Source

### Created by

- @EduardoBautista

### Contributed to by

- @ashleygwilliams
- @coriolinus
- @cwhakes
- @EduardoBautista
- @efx
- @ErikSchierboom
- @ffflorian
- @IanWhitney
- @keiravillekode
- @kytrinyx
- @lutostag
- @mkantor
- @nfiles
- @petertseng
- @rofrol
- @stringparser
- @workingjubilee
- @xakon
- @ZapAnton