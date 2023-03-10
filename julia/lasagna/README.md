# Lasagna

Welcome to Lasagna on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The entire Julia track will require you to treat your solution like small libraries, i.e. you need to define functions, types etc. which will then be run against a test suite.
For that reason, we will introduce named functions as the very first concept.

## Defining functions

There are two common ways to define a named function in Julia:

```julia
function muladd(x, y, z)
    return x * y + z
end
```

and

```julia
muladd(x, y, z) = x * y + z
```

The latter is most commonly used for one-line function definitions or mathematical functions.

## Invoking functions

Invoking a function is done by specifying its name and passing arguments for each of the function's parameters:

```julia
# invoking a function
muladd(10, 5, 1)

# and of course you can invoke a function within the body of another function:
square_plus_one(x) = muladd(x, x, 1)
```

## Annotations

<!-- TODO: These are not concepts/concept headings, but what are they? -->

### Types

Depending on which other programming languages you know, you may expect parameters, variables or return values to have explicit type annotations.
For now, assume that Julia will infer the types automagically and don't worry about them, we will get to the specifics of the type system in later exercises.

### Comments

Julia supports two kinds of comments.
Single line comments are preceded by `#` and multiline comments are inserted between `#=` and `=#`.

```julia
add(1, 3) # returns 4

#= Some random code that's no longer needed but not deleted
sub(x, y) = x - y
mulsub(x, y, z) = sub(mul(x, y), z)
=#
```

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have three tasks, all related to the time spent cooking the lasagna.

## 1. Calculate the preparation time in minutes

Define the `preptime` function that takes the number of layers you added to the lasagna as an argument and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```julia
julia> preptime(4)
8
```

## 2. Calculate the remaining oven time in minutes

According to the cooking book, lasagna needs to be in the oven for a total of 60 minutes.
Define the `remaining_time` function that takes the actual minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven.

```julia
julia> remaining_time(50)
10
```

## 3. Calculate the total working time in minutes

Define the `total_working_time` function that takes two arguments: the first argument is the number of layers you added to the lasagna, and the second parameter is the number of minutes the lasagna has been in the oven.
The function should return how many minutes in total you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```julia
julia> total_working_time(3, 20)
26
```

## Source

### Created by

- @SaschaMann

### Contributed to by

- @ErikSchierboom