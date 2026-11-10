# Ordering Ordeal

Welcome to Ordering Ordeal on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Julia, like most programming languages, provides a rich variety of collection types.

Some are inherently ordered (including `Vectors` and higher-dimensional `Arrays`), so we can access elements by position.
Other collections are unordered (`Sets`, `Dicts`), and elements must be accessed by key or value.

In the simplest case, suppose we have a `Vector` of `Ints`, and want to sort it in ascending order.

```julia-repl
julia> v = [3, 2, 4, 1]
4-element Vector{Int64}:
 3
 2
 4
 1

julia> sort(v)
4-element Vector{Int64}:
 1
 2
 3
 4

# sort descending
julia> sort(v, rev=true)
4-element Vector{Int64}:
 4
 3
 2
 1
```

Simple!
The `sort()` function has an obvious name, and apparently returns the sorted `Vector`.

_Only joking!_
By this stage in the syllabus, you perhaps suspect (correctly) that there are nuances we need to discuss.

## Mutating vs non-mutating functions

After running `sort(v)`, what is `v`?

```julia-repl
julia> v
4-element Vector{Int64}:
 3
 2
 4
 1

julia> issorted(v)
false
```

The original vector is unchanged.
`sort()` is a ***non-mutating*** function that returns a _copy_ of its input.

This is good design in many contexts: we have a pure function whose behavior is easy to reason about, even in parallel, distributed code.

On the other hand, suppose we had an array of a billion strings, and wanted to sort it.

The sorting is probably slow.
Additionally, we need to copy everything (_slow!_), and allocate enough memory (_several gigabytes!_) to store the copy.

Compare this quite similar code:

```julia-repl
# v is as previously

julia> issorted(v)
false

julia> sort!(v)
4-element Vector{Int64}:
 1
 2
 3
 4

julia> v
4-element Vector{Int64}:
 1
 2
 3
 4

julia> issorted(v)
true
```

Now the input `Vector` is sorted in-place, without copying, and the original ordering is lost permanently.

This can be efficient, it can be buggy and lead to unexpected side-effects, it can be confusing to other people using your code.
_Choose carefully!_

`sort!()` is a "mutating function", and by (_very strong_) convention, any function that mutates its inputs has a `!` appended to its name, as a warning to programmers.

## Sort index array

If the elements being sorted are large objects, it may be easier to work with their positional index.

```julia-repl
julia> langs = ["Julia", "C++", "Python", "Elixir"]
4-element Vector{String}:
 "Julia"
 "C++"
 "Python"
 "Elixir"

julia> inxs = sortperm(langs)  # => Integers
4-element Vector{Int64}:
 2
 4
 1
 3

julia> langs[inxs]  # sort the entire vector
4-element Vector{String}:
 "C++"
 "Elixir"
 "Julia"
 "Python"

julia> langs[inxs[1:2]]  # slice the indices
2-element Vector{String}:
 "C++"
 "Elixir"
```

Because `langs` is a Vector, each index is an integer in the range `1:length(langs)`.
Output from `sortperm()` is a permutation of these integers, corresponding to a sort of the input vector.

## Instructions

You have been hired as an Assistant Production Engineer in a company that produces quilts for turtles.

Orders come in throughout the day as a customer name or number and an order quantity.
These are then processed in the morning before the day's production starts.

You get to go home with full pay as soon as all the day's orders are filled, so there's incentive to shorten the workday as much as possible.
Since each order is handled by a single machine, scheduling the largest orders first allows the overhead of starting a job to be pushed onto the smaller orders, shortening the total production time.
Therefore, you have decided to provide some sorting functions to help with this scheduling speed-up, so you can get home to knit a sweater for your turtle.

## 1. Sort quantity!

As noted, the array of quantities will need to be sorted from largest to smallest.
Due to the potentially large size of these arrays, they should be sorted *in-place*.
To keep track of everything correctly, you will also need to be able to sort the array of customers to match the quantities, so a sort permutation of the quantities will be needed.

Write a function `sortquantity!(qty)` which takes a `Vector` of `Integer` quantities.
This function sorts the input `qty` in-place in descending order and returns a sort permutation of this ordering.

```julia-repl
julia> qty = [8, 9, 5, 6]
4-element Vector{Int64}:
 8
 9
 5
 6

julia> sortquantity!(qty)
4-element Vector{Int64}:
 2
 1
 4
 3

julia> qty # original vector is sorted in-place
4-element Vector{Int64}:
 9
 8
 6
 5
```

## 2. Sort customer

As stated above, you need to keep track of the customers in a defined order.

Write a function `sortcustomer(cust, srtperm)` which takes a `Vector` of customers `cust` and a `Vector` sort permutation `srtperm`.
This function returns a new array with the customers in the order prescribed by the sort permutation.

```julia-repl
julia> cust = ["a", "b", "c"]
3-element Vector{String}:
 "a"
 "b"
 "c"

julia> sortcustomer(cust, [2, 3, 1])
3-element Vector{String}:
 "b"
 "c"
 "a"

julia> cust # original vector remains unsorted
3-element Vector{String}:
 "a"
 "b"
 "c"
```

## 3. Production schedule!

Now you can put it all together to help keep those turtles warm!
You can now sort the quantities and customers properly, but you need to be able to recover the original ordering for shipping.
This can be done with an inverse sort permutation.

Write a function `production_schedule!(cust, qty)` which takes a `Vector` of customers and a `Vector` of quantities.
This function sorts the quantities in-place in descending order.
It returns a new `Vector` of customers sorted in the same order as the quantities and an *inverse* sort permutation which can be used to restore the sorted vectors to their original ordering.

```julia-repl
julia> cust, qty = ["a", "b", "c"], [2, 3, 1]
(["a", "b", "c"], [2, 3, 1])

julia> orderedcust, invperm = production_schedule!(cust, qty)
(["b", "a", "c"], [2, 1, 3])

julia> qty # has been sorted in-place
3-element Vector{Int64}:
 3
 2
 1

julia> orderedcust[invperm], qty[invperm] # inverse permutation gives original ordering
(["a", "b", "c"], [2, 3, 1])
```

## Source

### Created by

- @depial