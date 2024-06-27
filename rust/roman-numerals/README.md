# Roman Numerals

Welcome to Roman Numerals on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

Today, most people in the world use Arabic numerals (0–9).
But if you travelled back two thousand years, you'd find that most Europeans were using Roman numerals instead.

To write a Roman numeral we use the following Latin letters, each of which has a value:

| M    | D   | C   | L   | X   | V   | I   |
| ---- | --- | --- | --- | --- | --- | --- |
| 1000 | 500 | 100 | 50  | 10  | 5   | 1   |

A Roman numeral is a sequence of these letters, and its value is the sum of the letters' values.
For example, `XVIII` has the value 18 (`10 + 5 + 1 + 1 + 1 = 18`).

There's one rule that makes things trickier though, and that's that **the same letter cannot be used more than three times in succession**.
That means that we can't express numbers such as 4 with the seemingly natural `IIII`.
Instead, for those numbers, we use a subtraction method between two letters.
So we think of `4` not as `1 + 1 + 1 + 1` but instead as `5 - 1`.
And slightly confusingly to our modern thinking, we write the smaller number first.
This applies only in the following cases: 4 (`IV`), 9 (`IX`), 40 (`XL`), 90 (`XC`), 400 (`CD`) and 900 (`CM`).

Order matters in Roman numerals!
Letters (and the special compounds above) must be ordered by decreasing value from left to right.

Here are some examples:

```text
 105 => CV
---- => --
 100 => C
+  5 =>  V
```

```text
 106 => CVI
---- => --
 100 => C
+  5 =>  V
+  1 =>   I
```

```text
 104 => CIV
---- => ---
 100 => C
+  4 =>  IV
```

And a final more complex example:

```text
 1996 => MCMXCVI
----- => -------
 1000 => M
+ 900 =>  CM
+  90 =>    XC
+   5 =>      V
+   1 =>       I
```

## Instructions

Your task is to convert a number from Arabic numerals to Roman numerals.

For this exercise, we are only concerned about traditional Roman numerals, in which the largest number is MMMCMXCIX (or 3,999).

~~~~exercism/note
There are lots of different ways to convert between Arabic and Roman numerals.
We recommend taking a naive approach first to familiarise yourself with the concept of Roman numerals and then search for more efficient methods.

Make sure to check out our Deep Dive video at the end to explore the different approaches you can take!
~~~~

## Source

### Created by

- @IanWhitney

### Contributed to by

- @ashleygwilliams
- @coriolinus
- @cwhakes
- @EduardoBautista
- @efx
- @ErikSchierboom
- @IanWhitney
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

The Roman Numeral Kata - https://codingdojo.org/kata/RomanNumerals/