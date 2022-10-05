# Stack Underflow

Welcome to Stack Underflow on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Exceptions

All errors in Elixir implement the _Exception Behaviour_. Just like the _Access Behaviour_, the _Exception Behaviour_ defines callback functions that a module must implement to fulfill the software contract of the behaviour. Once an error is defined, it has the following properties:

- The module's name defines the error's name.
- The module defines an error-struct.
- The struct will have a `:message` field.
- The module can be be used with `raise/1` and `raise/2` to raise the intended error

The _Exception Behaviour_ also specifies two callbacks: `message/1` and `exception/1`. If unimplemented, default implementations will be used. `message/1` transforms the error-struct to a readable message when called with `raise`. `exception/1` allows additional context to be added to the message when it is called with `raise/2`

### Defining an exception

To define an exception from an error module, we use the `defexception` macro:

```elixir
# Defines a minimal error, with the name `MyError`
defmodule MyError do
  defexception message: "error"
end

# Defines an error with a customized exception/1 function
defmodule MyCustomizedError do
  defexception message: "custom error"

  @impl true
  def exception(value) do
    case value do
      [] ->
        %MyCustomizedError{}
      _ ->
        %MyCustomizedError{message: "Alert: " <> value}
    end
  end
end
```

### Using exceptions

Defined errors may be used like a built in error using either `raise/1` or `raise/2`.

- `raise/1` raises a specific error by its module name, or, if the argument is a string, it will raise a `RuntimeError` with the string as the message.
- `raise/2` raises a specific error by its module name, and accepts an attributes argument which is used to obtain the error with the appropriate message.

## Instructions

While continuing your work at _Instruments of Texas_, there is progress being made on the Elixir implementation of the RPN calculator. Your team would like to be able to raise errors that are more specific than the generic errors provided by the standard library. You are doing some research, but you have decided to implement two new errors which implement the _Exception Behaviour_.

## 1. Error for Division by Zero

Dividing a number by zero produces an undefined result, which the team decides is best represented by an error.

Implement the `DivisionByZeroError` module to have the error message: `"division by zero occurred"`

```elixir
raise DivisionByZeroError
# => ** (DivisionByZeroError) division by zero occurred
```

## 2. Error when encountering stack underflow

RPN calculators use a _stack_ to keep track of numbers before they are added. The team represents this _stack_ with a list of numbers (integer and floating-point), e.g.: `[3, 4.0]`. Each operation needs a specific number of numbers on the stack in order to perform its calculation. When there are not enough numbers on the stack, this is called a stack underflow error. Implement the `StackUnderflowError` exception which provides a default message, and optional extra context

```elixir
raise StackUnderflowError
# => ** (StackUnderflowError) stack underflow occurred

raise StackUnderflowError, "when dividing"
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing
```

## 3. Write a dividing function

Implement the `divide/1` function which takes a stack _(list of numbers)_ and:

- raises _stack underflow_ when the stack does not contain enough numbers
- raises _division by zero_ when the divisor is 0 (note the stack of numbers is stored in the reverse order)
- performs the division when no errors are raised

```elixir
RPNCalculator.Exception.divide([])
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing

RPNCalculator.Exception.divide([0, 100])
# => ** (DivisionByZeroError) division by zero occurred

RPNCalculator.Exception.divide([4, 16])
# => 4
```

> Note the order of the list is reversed!

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska