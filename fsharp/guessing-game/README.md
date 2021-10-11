# Guessing game

Welcome to Guessing game on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

An `if/elif/else` expression can be used to conditionally execute logic. F# also has another, more powerful way to conditionally execute logic: pattern matching. With pattern matching, a value can be tested against one or more _patterns_. An example of such a pattern is the _constant pattern_, which matches a value against a constant (e.g. `1` or `"hello"`).

In F#, pattern matching is done through the `match` keyword:

```fsharp
let describe number =
    match number with
    | 0 -> "Zero"
    | 1 -> "One"
```

While this may look like `switch` statements in other languages, pattern matching starts to shine when also using other patterns. One such pattern is the _variable pattern_, which allows one to capture a value:

```fsharp
match number with
| 0 -> "Zero"
| i -> sprintf "Non zero: %d" i
```

In some cases, you may want to add an additional condition to a pattern. This is known as a _guard_ (clause), which can be added using the `when` keyword:

```fsharp
match number with
| 0 -> "Zero"
| i when i < 0 -> "Negative number"
```

In the above example, not all possible input will have a matching pattern. The compiler will detect this and output a warning. This is known as _exhaustive checking_. To solve the warning, one has to handle all cases. For this, the _wildcard pattern_ can be used, which is a pattern that matches on any value:

```fsharp
match number with
| i when i < 0 -> "Negative number"
| _ -> "Positive number"

// No compiler warning
```

Pattern matching will test a value against each pattern from top to bottom, until it finds a matching pattern and executes the logic associated with that pattern. The order of patterns matters!

## Instructions

In this exercise, you are playing a number guessing game with a friend. The rules are simple: you secretly choose a number between `1` and `100` and your friend tries to guess what number you've chosen. To help your friend, you respond differently depending on how close the guess was to the number you've chosen (`42`). These are the rules for the different replies:

- If the guess is `42`: "Correct"
- If the guess is `41` or `43`: "So close"
- If the guess is less than `41`: "Too low"
- If the guess is greater than `43`: "Too high"

You have four tasks to encode the replies to the guesses.

## 1. Reply to a correct guess

Implement the `reply` function to reply to a correct guess:

```fsharp
reply 42
// => "Correct"
```

## 2. Reply to a close guess

Modify the `reply` function to reply to close guesses:

```fsharp
reply 41
// => "So close"
```

## 3. Reply to too low guesses

Modify the `reply` function to reply to too low guesses:

```fsharp
reply 25
// => "Too low"
```

## 4. Reply to too high guesses

Modify the `reply` function to reply to too high guesses:

```fsharp
reply 88
// => "Too high"
```

## Source

### Created by

- @ErikSchierboom