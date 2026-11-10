# Chessboard

Welcome to Chessboard on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Suppose you want all the non-negative integers up to 1000.
It would be ridiculous if you had to type these into an array.

For this we have the `range` type:

```julia-repl
julia> 0:1000
0:1000

julia> typeof(0:1000)
UnitRange{Int64}
```

Ranges are very common: not just to save you typing, but also as return types from functions.

Note that ranges are _not_ vectors.
They are just a set of instructions to generate a sequence ("lazy" evaluation, or an "iterator").

If you need a range as a vector, use the `collect()` function for conversion:

```julia-repl
julia> collect(0:5)
6-element Vector{Int64}:
 0
 1
 2
 3
 4
 5
```

The step size can be specified, in this case 0.3:

```julia-repl
julia> collect(1.0:0.3:2.0)
4-element Vector{Float64}:
 1.0
 1.3
 1.6
 1.9
```

So the syntax is `start:stepsize:stop`.
Both end limits are _inclusive_, as seen in the integer example.
If the step size does not divide exactly into `stop - start`, the last element will avoid exceeding `stop`.

## Letter ranges

Non-numeric sequences can also be used in ranges.
The simplest example is ASCII letters:

```julia-repl
julia> 'a':'d'
'a':1:'d'

julia> typeof('a':'d')
StepRange{Char, Int64}

julia> collect('a':'d')
4-element Vector{Char}:
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'c': ASCII/Unicode U+0063 (category Ll: Letter, lowercase)
 'd': ASCII/Unicode U+0064 (category Ll: Letter, lowercase)
```

The `Char` type will be covered in more detail in another Concept.
For now, just treat these as single characters in single-quotes.

## Functions and operators for ranges

Check the limits of a range with `first()` and `last()`.

```julia
 r = 1:10  # => 1:10
 first(r)  # => 1
 last(r)   # => 10
```

## More on vector indexing

Integer ranges and vectors can be used in vector indexing:

```julia
nums = collect(10.0:50.0)
nums[3:2:7]  # gives [12.0, 14.0, 16.0]
nums[ [3, 5, 7] ] # also gives [12.0, 14.0, 16.0]
```

## Instructions

As a chess enthusiast, you would like to write your own version of the game. Yes, there may be plenty of implementations of chess available online already, but yours will be unique!

But before you can let your imagination run wild, you need to take care of the basics. Let's start by generating the board.

Each square of the chessboard is identified by a letter-number pair. The vertical columns of squares, called files, are labeled A through H. The horizontal rows of squares, called ranks, are numbered 1 to 8.

## 1. Define the rank range

Implement the `rank_range()` function. It should return a range of integers, from 1 to 8.

```julia-repl
julia> rank_range()
# output omitted
```

## 2. Define the file range

Implement the `file_range()` function.
It should return a range of characters, from the uppercase letter A, to the uppercase letter H.

```julia-repl
julia> file_range()
# output omitted
```

## 3. Transform the rank range into a vector of ranks

Implement the `ranks()` function. It should return a vector of integers, from 1 to 8.
Do not write the vector by hand, generate it from the range returned by the `rank_range()` function.

```julia-repl
julia> ranks()
[1, 2, 3, 4, 5, 6, 7, 8]
```

## 4. Transform the file range into a vector of files

Implement the `files` function. It should return a vector of characters, from 'A' to 'H'.
Do not write the vector by hand, generate it from the range returned by the `file_range()` function.

```julia-repl
julia> files()
['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
```

## Source

### Created by

- @colinleach