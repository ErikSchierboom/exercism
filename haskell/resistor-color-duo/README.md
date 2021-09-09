# Resistor Color Duo

Welcome to Resistor Color Duo on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

If you want to build something using a Raspberry Pi, you'll probably use _resistors_.
For this exercise, you need to know two things about them:

* Each resistor has a resistance value.
* Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.

To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values.
Each band has a position and a numeric value.

The first 2 bands of a resistor have a simple encoding scheme: each color maps to a single number.
For example, if they printed a brown band (value 1) followed by a green band (value 5), it would translate to the number 15.

In this exercise you are going to create a helpful program so that you don't have to remember the values of the bands.
The program will take color names as input and output a two digit number, even if the input is more than two colors!

The band colors are encoded as follows:

- Black: 0
- Brown: 1
- Red: 2
- Orange: 3
- Yellow: 4
- Green: 5
- Blue: 6
- Violet: 7
- Grey: 8
- White: 9

From the example above:
brown-green should return 15
brown-green-violet should return 15 too, ignoring the third color.

You need to implement the function

```haskell
value :: (Color, Color) -> Int
```

that only accepts two colors and produces the resistor's numeric value
component of its resistance.

**Bonus - Property Testing:**

This exercise is a good opportunity to write some [property tests](https://en.wikipedia.org/wiki/Property_testing). If you haven't written any before here are some resources:

1. [School of Haskell](https://www.schoolofhaskell.com/user/pbv/an-introduction-to-quickcheck-testing).
2. [Real world Haskell](http://book.realworldhaskell.org/read/testing-and-quality-assurance.html)

We have provided one sample QuickCheck property test in the test file.

Examples of properties that can be tested:

- `value (x, y) >= 10` for all `(x, y)` where `x` isn't `Black`

- Calling `show` on `value (x, y)` produces the `reverse` String of calling `show` on `value (y, x)`.

- All colors have unique names. (For any two colors, if the colors are different, so are their names.)

## Source

### Created by

- @tejasbubane

### Contributed to by

- @artamonovkirill
- @ee7
- @iHiD
- @petertseng
- @ppartarr
- @sshine

### Based on

Maud de Vries, Erik Schierboom - https://github.com/exercism/problem-specifications/issues/1464