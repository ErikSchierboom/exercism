# RPN Calculator

Welcome to RPN Calculator on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Errors

Errors happen. In Elixir, while people often say to "let it crash", there are times when we need to rescue the function call to a known good state to fulfill a software contract. In some languages, errors are used as a method of control flow, but in Elixir, this pattern is discouraged. We can often recognize functions that may raise an error just by their name: functions that raise errors are to have `!` at the end of their name. This is in comparison with functions that return `{:ok, value}` or `:error`. Look at these library examples:

```elixir
Map.fetch(%{a: 1}, :b)
# => :error
Map.fetch!(%{a: 1}, :b)
# => raises KeyError
```

## Try Rescue

Elixir provides a construct for rescuing from errors using `try .. rescue`

```elixir
try do                             #1
  raise RuntimeError, "error"      #2
rescue
  e in RuntimeError -> :error      #3
end
```

Let's examine this construct:

- **Line 1**, the block is declared with `try`.
- **Line 2**, the function call which may error is placed here, in this case we are calling `raise/2`.
- **Line 3**, in the `rescue` section, we pattern match on the _Module_ name of the error raised
  - on the left side of `->`:
    - `e` is matched to the error struct.
    - `in` is a keyword.
    - `RuntimeError` is the error that we want to rescue.
      - If we wanted to rescue from all errors, we could use `_` instead of the module name or omit the `in` keyword entirely.
  - on the right side:
    - the instructions to be executed if the error matches.

### Error structs

Errors (sometimes also called "exceptions") that you rescue this way are structs.
Rescuing errors in Elixir is done very rarely.
Usually the rescued error is logged or sent to an external monitoring service, and then reraised.
This means we usually don't care about the internal structure of the specific error struct.

In the [Exceptions concept][exercism-exceptions] you will learn more about error structs, including how to define your own custom error.

[exercism-exceptions]: https://exercism.org/tracks/elixir/concepts/exceptions

## Instructions

While working at _Instruments of Texas_, you are tasked to work on an experimental Reverse Polish Notation [RPN] calculator written in Elixir. Your team is having a problem with some operations raising errors and crashing the process. You have been tasked to write a function which wraps the operation function so that the errors can be handled more elegantly with idiomatic Elixir code.

## 1. Warn the team

Implement the function `calculate!/2` to call the operation function with the stack as the only argument. The operation function is defined elsewhere, but you know that it can either complete successfully or raise an error.

```elixir
stack = []
operation = fn _ -> :ok end
RPNCalculator.calculate!(stack, operation)
# => :ok

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate!(stack, operation)
# => ** (ArgumentError) An error occurred
```

> Function names that end in `!` are a warning to programmers that this function may raise an error

## 2. Wrap the error

When doing more research you notice that many functions use atoms and tuples to indicate their success/failure. Implement `calculate/2` using this strategy.

```elixir
stack = []
operation = fn _ -> "operation completed" end
RPNCalculator.calculate(stack, operation)
# => {:ok, "operation completed"}

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate(stack, operation)
# => :error
```

## 3. Pass on the message

Some of the errors contain important information that your coworkers need to have to ensure the correct operation of the system. Implement `calculate_verbose/2` to pass on the error message. The error is a struct that has a `:message` field.

```elixir
stack = []
operation = fn _ -> "operation completed" end
RPNCalculator.calculate_verbose(stack, operation)
# => {:ok, "operation completed"}

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate_verbose(stack, operation)
# => {:error, "An error occurred"}
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @cjmaxik