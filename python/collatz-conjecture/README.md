# Collatz Conjecture

Welcome to Collatz Conjecture on Exercism's Python Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

The Collatz Conjecture or 3x+1 problem can be summarized as follows:

Take any positive integer n.
If n is even, divide n by 2 to get n / 2.
If n is odd, multiply n by 3 and add 1 to get 3n + 1.
Repeat the process indefinitely.
The conjecture states that no matter which number you start with, you will always reach 1 eventually.

Given a number n, return the number of steps required to reach 1.

## Examples

Starting with n = 12, the steps would be as follows:

0. 12
1. 6
2. 3
3. 10
4. 5
5. 16
6. 8
7. 4
8. 2
9. 1

Resulting in 9 steps.
So for input n = 12, the return value would be 9.

## Exception messages

Sometimes it is necessary to [raise an exception](https://docs.python.org/3/tutorial/errors.html#raising-exceptions). When you do this, you should always include a **meaningful error message** to indicate what the source of the error is. This makes your code more readable and helps significantly with debugging. For situations where you know that the error source will be a certain type, you can choose to raise one of the [built in error types](https://docs.python.org/3/library/exceptions.html#base-classes), but should still include a meaningful message.

The Collatz Conjecture is only concerned with **strictly positive integers**, so this exercise expects you to use the [raise statement](https://docs.python.org/3/reference/simple_stmts.html#the-raise-statement) and "throw" a `ValueError` in your solution if the given value is zero or a negative integer. The tests will only pass if you both `raise` the `exception` and include a message with it.

To raise a `ValueError` with a message, write the message as an argument to the `exception` type:

```python
# example when argument is zero or a negative integer
raise ValueError("Only positive integers are allowed")
```

## Source

### Created by

- @zwaltman

### Contributed to by

- @BethanyG
- @cmccandless
- @Dog
- @ikhadykin
- @K4cePhoenix
- @N-Parsons
- @smt923
- @Stigjb
- @thomasjpfan
- @tqa236

### Based on

An unsolved problem in mathematics named after mathematician Lothar Collatz - https://en.wikipedia.org/wiki/3x_%2B_1_problem