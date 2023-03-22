# All Your Base

Welcome to All Your Base on Exercism's Python Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Convert a number, represented as a sequence of digits in one base, to any other base.

Implement general base conversion.
Given a number in base **a**, represented as a sequence of digits, convert it to base **b**.

## Note

- Try to implement the conversion yourself.
  Do not use something else to perform the conversion for you.

## About [Positional Notation][positional-notation]

In positional notation, a number in base **b** can be understood as a linear combination of powers of **b**.

The number 42, *in base 10*, means:

`(4 * 10^1) + (2 * 10^0)`

The number 101010, *in base 2*, means:

`(1 * 2^5) + (0 * 2^4) + (1 * 2^3) + (0 * 2^2) + (1 * 2^1) + (0 * 2^0)`

The number 1120, *in base 3*, means:

`(1 * 3^3) + (1 * 3^2) + (2 * 3^1) + (0 * 3^0)`

I think you got the idea!

*Yes. Those three numbers above are exactly the same. Congratulations!*

[positional-notation]: https://en.wikipedia.org/wiki/Positional_notation

## Exception messages

Sometimes it is necessary to [raise an exception](https://docs.python.org/3/tutorial/errors.html#raising-exceptions). When you do this, you should always include a **meaningful error message** to indicate what the source of the error is. This makes your code more readable and helps significantly with debugging. For situations where you know that the error source will be a certain type, you can choose to raise one of the [built in error types](https://docs.python.org/3/library/exceptions.html#base-classes), but should still include a meaningful message.

This particular exercise requires that you use the [raise statement](https://docs.python.org/3/reference/simple_stmts.html#the-raise-statement) to "throw" a `ValueError` for different input and output bases. The tests will only pass if you both `raise` the `exception` and include a meaningful message with it.

To raise a `ValueError` with a message, write the message as an argument to the `exception` type:

```python
# for input.
raise ValueError("input base must be >= 2")

# another example for input.
raise ValueError("all digits must satisfy 0 <= d < input base")

# or, for output.
raise ValueError("output base must be >= 2")
```

## Source

### Created by

- @behrtam

### Contributed to by

- @cmccandless
- @Dog
- @ikhadykin
- @N-Parsons
- @pywkm
- @smt923
- @tqa236
- @yawpitch