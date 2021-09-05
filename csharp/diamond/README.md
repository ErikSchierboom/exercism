# Diamond

Welcome to Diamond on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

The diamond kata takes as its input a letter, and outputs it in a diamond
shape. Given a letter, it prints a diamond starting with 'A', with the
supplied letter at the widest point.

## Requirements

* The first row contains one 'A'.
* The last row contains one 'A'.
* All rows, except the first and last, have exactly two identical letters.
* All rows have as many trailing spaces as leading spaces. (This might be 0).
* The diamond is horizontally symmetric.
* The diamond is vertically symmetric.
* The diamond has a square shape (width equals height).
* The letters form a diamond shape.
* The top half has the letters in ascending order.
* The bottom half has the letters in descending order.
* The four corners (containing the spaces) are triangles.

## Examples

In the following examples, spaces are indicated by `·` characters.

Diamond for letter 'A':

```text
A
```

Diamond for letter 'C':

```text
··A··
·B·B·
C···C
·B·B·
··A··
```

Diamond for letter 'E':

```text
····A····
···B·B···
··C···C··
·D·····D·
E·······E
·D·····D·
··C···C··
···B·B···
····A····
```

The tests in this exercise are different from your usual tests. Normally, a test checks if for a given input, the output matches the expected value. This is called _value-based testing_. However, this exercise uses _property-based testing_, where the tests check if for a range of inputs, the output has a specific property. The two key differences that differentiate property-based testing from value-based testing are:

1. A property-based test works not with a single input value, but with many.
1. A property-based test verifies properties, not concrete values.

For this exercise, the tests all verify a property of the diamond shape your code should be producing. Furthermore, all tests check if the property they test holds for all valid input letters ('A' to 'Z').

In order to facilitate propery-based testing, the tests in this exercise leverage the [FsCheck](https://www.nuget.org/packages/FsCheck) and [FsCheck.Xunit](https://packages.nuget.org/packages/FsCheck.Xunit/2.2.0) packages. To learn more about FsCheck, the documentation on the framework can be found [here](https://fscheck.github.io/FsCheck/).

If you would like more information on property-based testing, see [this article](http://www.erikschierboom.com/2016/02/22/property-based-testing/).

## Source

### Created by

- @ErikSchierboom

### Contributed to by

- @j2jensen
- @robkeim
- @wolf99

### Based on

Seb Rose - http://claysnow.co.uk/recycling-tests-in-tdd/