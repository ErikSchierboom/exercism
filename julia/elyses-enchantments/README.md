# Elyses Enchantments

Welcome to Elyses Enchantments on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A central aim of Julia is to be able to perform calculations on numerical data, quickly and efficiently.
_Lots_ of numerical data.

Typically, the data will be stored in arrays (or some related type), so it is reasonable to say that arrays are at the heart of the Julia language.

Arrays can be of arbitrary size (subject only to memory constraints in your hardware), and can have arbitrarily many dimensions.

This introductory Concept concentrates on the basics of 1-dimensional arrays, which are called Vectors.

## Creating Vectors

In Julia, a Vector is an ordered sequence of values that can be accessed by index number.

The simplest way to create a Vector is to list the values in square brackets:

```julia-repl
julia> num_vec = [1, 4, 9]
3-element Vector{Int64}:
 1
 4
 9

julia> str_vec = ["arrays", "are", "important"]
3-element Vector{String}:
 "arrays"
 "are"
 "important"
```

The Vector type matches the type of each element.

_So Vectors need to be homogeneous (all elements the same type)?_

At some level, yes — and it is recommended to aim for this if you want the best performance.
However, Julia can work round this limitation (when necessary) by using the `Any` type:

```julia-repl
julia> mixed_vector = [1, "str", 'c']
3-element Vector{Any}:
 1
  "str"
  'c': ASCII/Unicode U+0063 (category Ll: Letter, lowercase)
```

When creating an empty Vector, Julia defaults to the element type `Any`, but this can be defined more specifically by annotating the empty array with the desired element type.

```julia-repl
julia> empty_vec = []
Any[]

julia> empty_int_vec = Int64[]
Int64[]
```

Please read and remember this rule:

- ***By default, indexing in Julia starts at 1, not 0***.

This is familiar to anyone who has used other data science languages (R, Matlab, Fortran...), but may seem shocking to computer scientists with a background in C-like languages.

Otherwise, indexes work as you might guess: just put them in square brackets:

```julia
squares = [0, 1, 4, 9, 16]
squares[1]  # 0
squares[3]  # 4
squares[begin]  # 0 ("begin" is synonym for 1)
squares[end]  # 16 ("end" is synonym for length(squares))
```

Note the convenience of indexing with `end` (which is very useful) and `begin` (which is probably not).

Python programmers may be wondering about negative indices.
Don't: these are not part of Julia, and will raise a `BoundsError`, as will any index smaller than 1 or bigger than `length(squares)`.

## Vector operations

Vectors in Julia are _mutable_: we can change the contents of individual cells.

```julia-repl
julia> vals = [1, 3, 5, 7]
4-element Vector{Int64}:
 1
 3
 5
 7

julia> vals[2] = 4  # reassign the value of this element
4

# Only the value at position 2 changes:
julia> vals
4-element Vector{Int64}:
 1
 4
 5
 7
```

There are many functions available for manipulating vectors, though the Julia documentation generalizes them to "collections" rather than vectors.

Note that, by convention, functions that mutate their input have `!` in the name.
The compiler will not enforce this, but it is a very _strong_ convention in the Julia world.

These are a few of the useful functions:

- To add values to the end of the vector, use `push!()`.
- To remove the last value, use `pop!()`.
- To operate on the start of the vector, the corresponding functions are `pushfirst!()` and `popfirst!()`.
- To insert or remove an element at any position, there is `insert!()` and `deleteat!()`.

```julia-repl
julia> vals = [1, 3]
2-element Vector{Int64}:
 1
 3

julia> push!(vals, 5, 6)  # can add multiple values
4-element Vector{Int64}:
 1
 3
 5
 6

julia> pop!(vals)  # mutates vals, return popped value
6

julia> vals
3-element Vector{Int64}:
 1
 3
 5
```

## Instructions

As a magician-to-be, Elyse needs to practice some basics. 
She has a stack of cards that she wants to manipulate.

To make things a bit easier she only uses the cards 1 to 10 so her stack of cards can be represented by a vector of numbers. 
The position of a certain card corresponds to the index in the vector. 

## 1. Retrieve a card from a stack

To pick a card, return the card at index `position` from the given stack.

```julia-repl
julia> stack = [1, 2, 4, 1];
julia> position = 3;
julia> get_item(stack, position)
4
```

## 2. Exchange a card in the stack

Perform some sleight of hand and exchange the card at index `position` with the replacement card provided.
Return the adjusted stack.

```julia-repl
julia> stack = [1, 2, 4, 1];
julia> position = 3;
julia> replacement_card = 6;
julia> set_item!(stack, position, replacement_card)
[1, 2, 6, 1]
```

## 3. Insert a card at the top of the stack

Make a card appear by inserting a new card at the top of the stack.
Return the adjusted stack.

```julia-repl
julia> stack = [5, 9, 7, 1];
julia> new_card = 8;
julia> insert_item_at_top!(stack, new_card)
[5, 9, 7, 1, 8]
```

## 4. Remove a card from the stack

Make a card disappear by removing the card at the given `position` from the stack.
Return the adjusted stack.

```julia-repl
julia> stack = [3, 2, 6, 4, 8];
julia> position = 3;
julia> remove_item!(stack, position)
[3, 2, 4, 8]
```

## 5. Remove the top card from the stack

Make a card disappear by removing the card at the top of the stack.
Return the adjusted stack.

```julia-repl
julia> stack = [3, 2, 6, 4, 8];
julia> remove_item_from_top!(stack)
[3, 2, 6, 4]
```

## 6. Insert a card at the bottom of the stack

Make a card appear by inserting a new card at the bottom of the stack.
Return the adjusted stack.

```julia-repl
julia> stack = [5, 9, 7, 1];
julia> new_card = 8;
julia> insert_item_at_bottom!(stack, new_card)
[8, 5, 9, 7, 1]
```

## 7. Remove a card from the bottom of the stack

Make a card disappear by removing the card at the bottom of the stack.
Return the adjusted stack.

```julia-repl
julia> stack = [8, 5, 9, 7, 1];
julia> remove_item_at_bottom!(stack)
[5, 9, 7, 1]
```

## 8. Check the size of the stack

Check whether the size of the stack is equal to `stack_size` or not.

```julia-repl
julia> stack = [3, 2, 6, 4, 8];
julia> stack_size = 4;
julia> check_size_of_stack(stack, stack_size)
false
```

## Source

### Created by

- @colinleach

### Contributed to by

- @cmcaine
- @SaschaMann