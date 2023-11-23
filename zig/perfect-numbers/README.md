# Perfect Numbers

Welcome to Perfect Numbers on Exercism's Zig Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Determine if a number is perfect, abundant, or deficient based on Nicomachus' (60 - 120 CE) classification scheme for positive integers.

The Greek mathematician [Nicomachus][nicomachus] devised a classification scheme for positive integers, identifying each as belonging uniquely to the categories of **perfect**, **abundant**, or **deficient** based on their [aliquot sum][aliquot-sum].
The aliquot sum is defined as the sum of the factors of a number not including the number itself.
For example, the aliquot sum of `15` is `1 + 3 + 5 = 9`.

- **Perfect**: aliquot sum = number
  - 6 is a perfect number because (1 + 2 + 3) = 6
  - 28 is a perfect number because (1 + 2 + 4 + 7 + 14) = 28
- **Abundant**: aliquot sum > number
  - 12 is an abundant number because (1 + 2 + 3 + 4 + 6) = 16
  - 24 is an abundant number because (1 + 2 + 3 + 4 + 6 + 8 + 12) = 36
- **Deficient**: aliquot sum < number
  - 8 is a deficient number because (1 + 2 + 4) = 7
  - Prime numbers are deficient

Implement a way to determine whether a given number is **perfect**.
Depending on your language track, you may also need to implement a way to determine whether a given number is **abundant** or **deficient**.

[nicomachus]: https://en.wikipedia.org/wiki/Nicomachus
[aliquot-sum]: https://en.wikipedia.org/wiki/Aliquot_sum

## Assert

For this exercise, let's say that we want the caller to be responsible for calling `classify` only with a nonzero input.
So please make the `classify` function assert that its input is nonzero.
For more details, see the [Zig Language Reference][zig-reference] and the implementation of [`std.debug.assert`][assert].

However, note that this exercise does not currently test an input of 0 (because `std.testing` does [not yet support expecting a panic][proposal]).

[zig-reference]: https://ziglang.org/documentation/0.11.0/#unreachable
[assert]: https://github.com/ziglang/zig/blob/0.11.0/lib/std/debug.zig#L332-L344
[proposal]: https://github.com/ziglang/zig/issues/1356

## Source

### Created by

- @ee7

### Based on

Taken from Chapter 2 of Functional Thinking by Neal Ford. - https://www.oreilly.com/library/view/functional-thinking/9781449365509/