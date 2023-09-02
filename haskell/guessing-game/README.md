# Guessing Game

Welcome to Guessing Game on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Pattern Matching Literals

While `if/else` expressions can be used to execute conditional logic, Haskell also has a more powerful way to execute conditional logic: [pattern matching][pattern-matching].
With pattern matching, a value can be tested against one or more _patterns_.
An example of such a pattern is the _constant pattern_, which matches a value against a constant (e.g. `1` or `"hello"`).

When defining functions, you can define separate function bodies for different patterns.
This leads to clean code that is simple and readable.
You can pattern match on any data type — numbers, characters, lists, tuples, etc.

For example, a trivial function that takes a whole number (`Int`) and makes it _1_ closer to _0_ could be expressed like this:

```haskell
closerToZero :: Int -> Int
closerToZero 0 = 0
closerToZero 1 = 0
```

Pattern matching starts to shine when used together with other patterns, for example the _variable pattern_:

```haskell
closerToZero :: Int -> Int
closerToZero 0 = 0
closerToZero n = n - 1
```

The above example treats all inputs other than _0_ the same, and would produce incorrect results for negative numbers.
This can be solved using conditional patterns, known as _guards_, which are expressed with the `|` symbol:

```haskell
closerToZero :: Int -> Int
closerToZero n
    | n < 0 = n + 1
    | n > 0 = n - 1
```

In the above examples not all possible inputs have a matching pattern.
The compiler will detect this and output a warning.
This is a very useful feature of Haskell that helps ensure all possible paths are covered to avoid run-time errors.
It is known as _exhaustive checking_.
To solve the warning, you have to handle all cases.
Within _guards_ you can use the expression `otherwise` as syntactic sugar for `True` to catch all remaining patterns.

```haskell
closerToZero :: Int -> Int
closerToZero n
    | n < 0 = n + 1
    | n > 0 = n - 1
    | otherwise = 0
```

Pattern matching will test a value against each pattern from top to bottom, until it finds a matching pattern and executes the logic associated with that pattern.
**The order of patterns matters!**

[pattern-matching]: https://learnyouahaskell.github.io/syntax-in-functions#pattern-matching

## Instructions

In this exercise, you are playing a number guessing game with a friend.
The rules are simple: you secretly choose a number between `1` and `100` and your friend tries to guess what number you've chosen.
To help your friend, you respond differently depending on how close the guess was to the number you've chosen (`42`).
These are the rules for the different possible inputs:

- If the guess is `42`: "Correct"
- If the guess is `41` or `43`: "So close"
- If the guess is less than `41`: "Too low"
- If the guess is greater than `43`: "Too high"

You have four tasks to encode the replies to the guesses.

## 1. Reply to a correct guess

Implement the `reply` function to reply to a correct guess:

```haskell
reply 42
-- -> "Correct"
```

## 2. Reply to a close guess

Modify the `reply` function to reply to close guesses:

```haskell
reply 41
-- -> "So close"
```

## 3. Reply to too low guesses

Modify the `reply` function to reply to too low guesses:

```haskell
reply 25
-- -> "Too low"
```

## 4. Reply to too high guesses

Modify the `reply` function to reply to too high guesses:

```haskell
reply 88
-- -> "Too high"
```

## Source

### Created by

- @pwadsworth