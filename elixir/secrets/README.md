# Secrets

Welcome to Secrets on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Anonymous Functions

Functions are treated as first class citizens in Elixir. This means functions:

- Named and anonymous functions can be assigned to variables.
- Named and anonymous functions can be passed around like data as arguments and return values.
- Anonymous functions can be created dynamically.

Anonymous functions, in contrast to named functions, don't have a static reference available to them, they are only available if they are assigned to a variable or immediately invoked.

We might use anonymous functions to:

- Hide data using lexical scope (also known as a closure).
- Dynamically create functions at run-time.

Anonymous functions start with the reserved word `fn`, the arguments are separated from the body of the function with the `->` token, and they are finished with an `end`. As with named functions, the last expression in the function is _implicitly returned_ to the calling function.

To invoke a function reference, you must use a `.` between the reference variable and the list of arguments:

```elixir
function_variable = fn param ->
  param + 1
end

function_variable.(1)
# => 2
```

You can even use short hand capture notation to make this more concise:

```elixir
variable = &(&1 + 1)

variable.(1)
# => 2
```

## Bit Manipulation

Elixir supports many functions for working with bits found in the _Bitwise module_.

- `&&&/2`: bitwise AND
- `<<</2`: bitwise SHIFT LEFT
- `>>>/2`: bitwise SHIFT RIGHT
- `^^^/2`: bitwise XOR
- `|||/2`: bitwise OR
- `~~~/1`: bitwise NOT

Here is an example how to use a bitwise operator:

```elixir
Bitwise.<<<(1, 2)
# => 4
```

All bitwise functions only work on integers.

If you are running Elixir version 1.9 or lower, you will need to call `require Bitwise` at the beginning of the module definition to be able to use the _Bitwise_ module.

## Instructions

In this exercise, you've been tasked with writing the software for an encryption device that works by performing transformations on data. You need a way to flexibly create complicated functions by combining simpler functions together.

For each task, return an anonymous function that can be invoked from the calling scope.

All functions should expect integer arguments. Integers are also suitable for performing bitwise operations in Elixir.

## 1. Create an adder

Implement `Secrets.secret_add/1`. It should return a function which takes one argument and adds to it the argument passed in to `secret_add`.

```elixir
adder = Secrets.secret_add(2)
adder.(2)
# => 4
```

## 2. Create a subtractor

Implement `Secrets.secret_subtract/1`. It should return a function which takes one argument and subtracts from it the secret passed in to `secret_subtract`.

```elixir
subtractor = Secrets.secret_subtract(2)
subtractor.(3)
# => 1
```

## 3. Create a multiplier

Implement `Secrets.secret_multiply/1`. It should return a function which takes one argument and multiplies it by the secret passed in to `secret_multiply`.

```elixir
multiplier = Secrets.secret_multiply(7)
multiplier.(3)
# => 21
```

## 4. Create a divider

Implement `Secrets.secret_divide/1`. It should return a function which takes one argument and divides it by the secret passed in to `secret_divide`.

```elixir
divider = Secrets.secret_divide(3)
divider.(32)
# => 10
```

Make use of integer division so the output is compatible with the other functions' expected input.

## 5. Create an "and"-er

Implement `Secrets.secret_and/1`. It should return a function which takes one argument and performs a bitwise _and_ operation on it and the secret passed in to `secret_and`.

```elixir
ander = Secrets.secret_and(1)
ander.(2)
# => 0
```

## 6. Create an "xor"-er

Implement `Secrets.secret_xor/1`. It should return a function which takes one argument and performs a bitwise _xor_ operation on it and the secret passed in to `secret_xor`.

```elixir
xorer = Secrets.secret_xor(1)
xorer.(3)
# => 2
```

## 7. Create a function combiner

Implement `Secrets.secret_combine/2`. It should return a function which takes one argument and applies to it the two functions passed in to `secret_combine` in order.

```elixir
multiply = Secrets.secret_multiply(7)
divide = Secrets.secret_divide(3)
combined = Secrets.secret_combine(multiply, divide)

combined.(6)
# => 14
```

## Source

### Created by

- @neenjaw