# Simple Report

Welcome to Simple Report on Exercism's AWK Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Numbers and Strings

AWK is a very small language and only has a few basic data types.
In this lession we'll go over numbers and strings.

### Numbers

Numbers in AWK are implemented as double-precision floating point numbers.
There is no distinction between integers, floats and doubles.

AWK understands octal number constants (starting with `0`) and hexadecimal number constants (starting with `0x` or `0X`).

#### Numeric operations

You can use the standard arithmetic operators `+`, `-`, `*`, `/`, `%`.
The exponentiation operator is `^`.
There are some builtin numeric functions, including trigonometric functions, random number generation, and `int(x)` to truncate a number to the nearest integer between _x_ and zero.

### Strings

AWK strings are sequences of characters.
Specify a string constant using double quotes.

#### String operations

There is only one string operation: concatenation.
Concatenation does not have a special operator;
simply placing two strings next to each other concatenates them:

```awk
BEGIN {
    hw = "Hello" "World"
    print hw
}
# => HelloWorld
```

~~~~exercism/note
`print` is a **statement** not a function.
`print` does not require parentheses.
~~~~

AWK has a wealth of string manipulation functions.
We will be introduced to them in depth as we proceed through the track.

### Converting between numbers and strings

There are no explicit operators to convert between numbers and strings.
AWK will do this implicitly based on the context of the program.
This makes working with input field values very simple: AWK generally just does what you want it to do.

* `print x + y` will convert the values of the `x` and `y` variables to numbers thanks to the `+` numeric operation.
* `print x y` will convert the values of the `x` and `y` variables to strings thanks to the concatenation operation.

If you want to be explicit about it, `0 + x` gives the number representation of _x_ and `"" x` gives the string representation of _x_.

#### From strings to numbers

The manner that AWK converts a string to a number can be confusing.
A simple way to think of it is that AWK reads "number characters" from the start of a string until it finds a "non-number" character.
Some examples are:

* `"2.5"` converts to the number `2.5`;
* `"1e3"` converts to the number `1000` (scientific notation);
* `456abc` converts to the number `456` (because `a` is not a "numeral").

## Instructions

You are helping a friend generate a report from readings he has taken in different corners of his garden.
Unfortunately, your friend has stored the data in a strange format.
Each reading is a set of comma separated fields.
However, he has stored two-digit numbers across two columns.

| field number | meaning |
| --- | --- |
| 1 | ID number |
| 2 | location |
| 3 | first reading, tens value |
| 4 | first reading, ones value |
| 5 | second reading, tens value |
| 6 | second reading, ones value |

For an input row like `101,house,4,2,5,4`
- the first reading is `42`,
- the second reading is `54`.

## Task 1: Generate the report

Your task is find the average of the two readings and output the results of each row in the following format

```none
#<id>, <label> = <average>
```

Since the average of 42 and 54 is 48, the output for the sample row should be:

```none
#101, house = 48
```

## Source

### Created by

- @glennj

### Contributed to by

- @IsaacG