# Elyses Enchantments

Welcome to Elyses Enchantments on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A `vector` in R is a collection of values of the same `mode`: `numeric`, `character`, etc. If given mixed inputs, R will quietly coerce them all to a common type, usually character, which can lead to unexpected results.

## Creating vectors

If you already have all the values, use `c()` (short for "concatenate" or "combine"):

```R
x <- 10
v <- c(4, 7, x)
```

## Ranges, sequences, repeats

For a range of consecutive values (increasing or decreasing) you can use `:` notation

```R
v <- 1:5 # equivalent to c(1, 2, 3, 4, 5)
w <- 10:7 # c(10, 9, 8, 7)
```

The `seq()` function offers finer control:

```R
# specify step size
seq(2, 11, by = 3) # c(2, 5, 8, 11)

# specify number of values, evenly-spaced
seq(2.5, 4, length.out = 5) # c(2.500, 2.875, 3.250, 3.625, 4.000) 
```

A few ranges are pre-defined as built-in constants:

```R
> letters
 [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
```

## Arithmetic

Operations are automatically applied element-wise along the vector. 
The loops, list comprehensions and recursions common in other languages are not needed and (for performance reasons) should usually be avoided.

```R
2 + 1:3 # c(3, 4, 5)
2 * 1:3 # c(2, 4, 6)
12 / 1:3 # c(12  6  4)
2 ^ (1:3) # c(2, 4, 8) : exponentiation, precedence order here needs ()
```

Pairs of vectors also work:

```R
> v <- 1:3
> w <- 5:7

> v + w
[1]  6  8 10

> v * w
[1]  5 12 21

> v ^ w
[1]    1   64 2187
```

## Accessing vector elements

As in many languages, we can use the index in brackets:

```R
> v <- 4:7
> v[2]
[1] 5
> v[2:4]
[1] 5 6 7
```

But beware: ***R uses 1-based indexing by default***. 

This is common for scientific languages (Fortran, Matlab, Julia) but differs from the zero-based indexing of C and its many successors.

Ranges can be used, as in the example above but also in the highly flexible `c()` function:

```R
v <- c(4, 7, 10)
w <- c(2, v[2:3], 11) # c(2, 7, 10, 11)
```

`vectors` (like most things in R) can be treated as mutable, using similar flexible syntax to write to single or multiple elements:

```R
> v <- 1:10
> v[2] <- 42
> v[4:6] <- c(11, 12, 13)
> v
 [1]  1 42  3 11 12 13  7  8  9 10
```

## Negative indices

Programmers familiar with other languages might guess that `v[-1]` is a way to access the last element in a vectore.
Wrong!

Negative indices are actually a way to ***remove*** en element, returning a shorter vector:

```R
> v <- c(2, 4, 6)
> v[-2]
[1] 2 6  # second element gone
```

## Vector conditionals

Applying comparisons to a vector will return an equal-length vector of booleans. 
This can be very convenient within functions such as `all()` and `any()`:

```R
> v <- c(4, 7, 10)
> v >= 6
[1] FALSE  TRUE  TRUE
> all(v > 6)
[1] FALSE    # not all elements match this condition
> any(v > 6)
[1] TRUE     # at least one element matches
```

## Instructions

As a magician-to-be, Elyse needs to practice some basics. She has
a stack of cards that she wants to manipulate.

To make things a bit easier she only uses the cards 1 to 10 so her stack of cards can be represented by a vector of numbers. 
The position of a certain card corresponds to the index in the vector. 

## 1. Retrieve a card from a stack

To pick a card, return the card at index `position` from the given stack.

```R
stack <- c(1, 2, 4, 1)
position <- 3
get_item(stack, position)
# => 4
```

## 2. Exchange a card in the stack

Perform some sleight of hand and exchange the card at index `position` with the replacement card provided.
Return the adjusted stack.

```R
stack <- c(1, 2, 4, 1)
position <- 3
replacement_card <- 6
set_item(stack, position, replacement_card)
# => c(1, 2, 6, 1)
```

## 3. Insert a card at the top of the stack

Make a card appear by inserting a new card at the top of the stack.
Return the adjusted stack.

```R
stack <- c(5, 9, 7, 1)
new_card <- 8
insert_item_at_top(stack, new_card)
# => c(5, 9, 7, 1, 8)
```

## 4. Remove a card from the stack

Make a card disappear by removing the card at the given `position` from the stack.
Return the adjusted stack.

```R
stack <- c(3, 2, 6, 4, 8)
position <- 3
remove_item(stack, position)
# => c(3, 2, 4, 8)
```

## 5. Remove the top card from the stack

Make a card disappear by removing the card at the top of the stack.
Return the adjusted stack.

```R
stack <- c(3, 2, 6, 4, 8
remove_item_from_top(stack)
# => c(3, 2, 6, 4)
```

## 6. Insert a card at the bottom of the stack

Make a card appear by inserting a new card at the bottom of the stack.
Return the adjusted stack.

```R
stack <- c(5, 9, 7, 1)
new_card <- 8
insert_item_at_bottom(stack, new_card)
# => c(8, 5, 9, 7, 1)
```

## 7. Remove a card from the bottom of the stack

Make a card disappear by removing the card at the bottom of the stack.
Return the adjusted stack.

```R
stack <- c(8, 5, 9, 7, 1)
remove_item_at_bottom(stack)
# => c(5, 9, 7, 1)
```

## 8. Check the size of the stack

Check whether the size of the stack is equal to `stackSize` or not.

```R
stack <- c(3, 2, 6, 4, 8)
stack_size <- 4
check_size_of_stack(stack, stack_size)
# => FALSE
```

## Source

### Created by

- @colinleach