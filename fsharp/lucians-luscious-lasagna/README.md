# Lucian's Luscious Lasagna

Welcome to Lucian's Luscious Lasagna on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In F#, assigning a value to a name is referred to as a _binding_. Bindings are immutable, which makes them similar to constants in other languages. As F# is a statically-typed language, each binding has a type at compile-time.

Bindings are defined using the `let` keyword. Specifying a binding's type is optional for most bindings, as F#'s _type inference_ can usually infer the type based on their value. A binding looks like this:

```fsharp
// Automatically inferred type
let fingers = 10
```

Functions are also regular bindings, but with one or more parameters. A function automatically returns its last expression. Type inference also works for most functions, by analyzing what values the function is called with and what value the function returns.

```fsharp
// Automatically inferred types for parameters and return type
let add x y = x + y
```

Invoking a function is done by specifying its name and passing arguments for each of the function's parameters.

```fsharp
let five = add 2 3
```

If a binding's type cannot be inferred, the compiler will report an error. To fix this, add an explicit type annotation to the binding.

```fsharp
// Explicit type annotation
let fingers: int = 10

// Explicit type annotation (also for parameters)
let add (x: int) (y: int): int = x + y
```

Bindings in F# can only be used _after_ they have been defined. Using a binding before it has been defined results in a compile error.

```fsharp
// Compile error as the add binding has not yet been defined
// let seven = add 3 + 4

let add x y = x + y
```

F# uses significant whitespace to define scope. This means that scope is defined by indenting the code with spaces, relative to the line declaring the binding. The default convention is to use four spaces for indentation:

```fsharp
let toes =
    let left = 5
    let right = 5
    left + right

let multiplyPlusTwo x y =
    let product = x * y
    product + 2

// Trying to access the left, right or product bindings
// here would result in a compile error
```

F# bindings (which include functions) are usually organized in modules. A module groups related functionality and is defined using the `module` keyword. The module definition must precede its bindings:

```fsharp
module Calculator

let pi = 3.14

let add x y = x + y
```

F# supports two types of comments. Single line comments are preceded by `//` and multiline comments are inserted between `(*` and `*)`.

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have four tasks, all related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Define the `expectedMinutesInOven` binding to check how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is 40:

```fsharp
expectedMinutesInOven
// => 40
```

## 2. Calculate the remaining oven time in minutes

Define the `remainingMinutesInOven` function that takes the actual minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected time oven time in minutes from the previous task.

```fsharp
remainingMinutesInOven 30
// => 10
```

## 3. Calculate the preparation time in minutes

Define the `preparationTimeInMinutes` function that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```fsharp
preparationTimeInMinutes 2
// => 4
```

## 4. Calculate the elapsed time in minutes

Define the `elapsedTimeInMinutes` function that takes two parameters: the first parameter is the number of layers you added to the lasagna, and the second parameter is the number of minutes the lasagna has been in the oven. The function should return how many minutes you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```fsharp
elapsedTimeInMinutes 3 20
// => 26
```

## Source

### Created by

- @ErikSchierboom