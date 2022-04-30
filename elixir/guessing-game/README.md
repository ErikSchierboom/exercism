# Guessing Game

Welcome to Guessing Game on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Multiple Clause Functions

Elixir facilitates **Open-Close Principle** practices by allowing functions to have multiple clauses, so instead of sprawling and hard-coded control-logic, pointed functions can be written to add/remove behavior easily.

Elixir offers _multiple function clauses_ and _guards_ to write:

```elixir
def number(n) when n == 7 do
  "Awesome, that's my favorite"
end
def number(_n) do
  "That's not my favorite"
end
```

At run-time, Elixir will test, from top to bottom of the source file, which function clause to invoke.

Variables that are unused should be prefixed with an underscore.

## Guards

Guards are used to prevent Elixir from invoking functions based on evaluation of the arguments by guard functions. Guards begin with the `when` keyword, followed by a boolean expression. Guard functions are special functions which:

- Must be pure and not mutate any global states.
- Must return strict `true` or `false` values.

A list of common guards can be found in the [Elixir documentation][kernel-guards]. It includes type checks, basic arithmetic, comparisons, and strictly boolean operators.

## Default Arguments

Functions may declare default values for one or more arguments. Let's consider this function:

```elixir
def number(n \\ 13), do: "That's not my favorite"
```

When compiled, Elixir creates a function definition for `number/0` (no arguments), and `number/1` (one argument).

If more than one argument has default values, the default values will be applied to the function from left to right to fill in for missing arguments.

If the function has more than one clause, the default arguments should be defined in a function header (a function without a body) before the function clauses:

```elixir
def number(n \\ 13)
def number(n) when n < 10, do: "Dream bigger!"
def number(n) when n > 100, do: "Not that big..."
```

[kernel-guards]: https://hexdocs.pm/elixir/master/Kernel.html#guards

## Instructions

You are creating a trivial online game where a friend can guess a secret number. You want to give some feedback, but not give away the answer with a guess. You need to devise a function to provide different responses depending on how the guess relates to the secret number.

| Condition                                                     | Response       |
| ------------------------------------------------------------- | -------------- |
| When the guess matches the secret number                      | "Correct"      |
| When the guess is one more or one less than the secret number | "So close"     |
| When the guess is greater than the secret number              | "Too high"     |
| When the guess is less than the secret number                 | "Too low"      |
| When a guess isn't made                                       | "Make a guess" |

All guesses and secret numbers are integer numbers.

## 1. Make the response when the guess matches the secret number

Implement the `compare/2` function which takes two arguments, `secret_number` and `guess`, which are both integers.

```elixir
GuessingGame.compare(5, 5)
# => "Correct"
```

## 2. Make the response when the guess is greater than the secret number

Modify the `compare` function to respond to guesses that are higher than the secret number.

```elixir
GuessingGame.compare(5, 8)
# => "Too high"
```

## 3. Make the response when the guess is less than the secret number

Modify the `compare` function to respond to guesses that are lower than the secret number.

```elixir
GuessingGame.compare(5, 2)
# => "Too low"
```

## 4. Make the responses when the guess is one more or one less than the secret number

Modify the `compare` function to respond to guesses that are close to the secret number.

```elixir
GuessingGame.compare(5, 6)
# => "So close"
GuessingGame.compare(5, 4)
# => "So close"
```

## 5. Make the response when there is no guess

Modify the `compare` function to respond to a lack of guess.

```elixir
GuessingGame.compare(5)
# => "Make a guess"

GuessingGame.compare(5, :no_guess)
# => "Make a guess"
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska