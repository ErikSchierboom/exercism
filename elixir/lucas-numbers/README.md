# Lucas Numbers

Welcome to Lucas Numbers on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Streams

All functions in the [`Enum` module][exercism-enum] are _eager_. When performing multiple operations on enumerables with the `Enum` module, each operation is going to generate an intermediate result.

The `Stream` module is a _lazy_ alternative to the _eager_ `Enum` module. It offers many of the same functions as `Enum`, but instead of generating intermediate results, it builds a series of computations that are only executed once the stream is passed to a function from the `Enum` module.

Streams implement the _Enumerable [protocol][exercism-protocols]_ and are composable -- you can chain them together to create more complex functionality.

[exercism-enum]: https://exercism.org/tracks/elixir/concepts/enum
[exercism-protocols]: https://exercism.org/tracks/elixir/concepts/protocols

## Instructions

You are a huge fan of the [Numberphile Youtube channel](https://www.youtube.com/watch?v=PeUbRXnbmms) and you just saw a cool video about the _Lucas Number Sequence_. You want to create this sequence using Elixir.

While designing your function, you want to make use of _lazy evaluation_, so that you can generate as many numbers as you want, but only if you need to -- So you decide to use a stream:

## 1. Generate the base cases

You know that the sequence has two starting numbers which don't follow the same rule. Write two base case clauses to return these numbers:

```elixir
LucasNumbers.generate(1)
# => [2]

LucasNumbers.generate(2)
# => [2, 1]
```

## 2. Create the generalized case

For any sequence longer than 2, you know that you need to add the previous two numbers to get the next number and so on. Write the generalized case.

```elixir
LucasNumbers.generate(3)
# => [2, 1, 3]

LucasNumbers.generate(4)
# => [2, 1, 3, 4]
```

## 3. Catch bad arguments

Later, you find someone is using your function and having problems because they are using incorrect arguments. Add a guard clause to raise an error if a non-integer or an integer less than 1 is used to generate the sequence:

```elixir
LucasNumbers.generate("Hello World")
# => ** (ArgumentError) count must be specified as an integer >= 1
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska