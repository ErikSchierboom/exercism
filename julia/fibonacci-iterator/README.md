# Fibonacci Iterator

Welcome to Fibonacci Iterator on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

<!-- TODO: Motivate why iterators are useful -->
<!-- TODO: Add explanation why the Base.-prefix or import is necessary -->

To implement the informal iteration interface, you need to define two methods `iterate(iter::MyIter)` and `iterate(iter::MyIter, state)`.
Both methods must return a tuple of an item and the state of the iterator.
The first method will return the first item and state, while the second method will return the next item and state.
The iteration ends if `iterate` returns `nothing`.

~~~~exercism/note
Julia currently doesn't have a way to formally define interfaces.
To implement an interface, you need to look up which methods need to be defined in the Manual, or in the documentation of the package that "defines" the interface.
Alternatively, you can work your way through `MethodErrors` to find out which methods you need to implement:
<!-- TODO check if code blocks work within info boxes -->
```julia
julia> struct MyIter end;

julia> for i in MyIter()
        println(i)
    end
ERROR: MethodError: no method matching iterate(::MyIter)
...
```
~~~~

~~~~exercism/note
The iterator object itself is usually not mutated by iteration.
~~~~

To make it clearer when the `iterate` methods are called, one can look at the translation of the `for`-loop syntax:

```julia
for item in iter
    println(item)
end
```

will be translated to

```julia
next_item = iterate(iter)

while !isnothing(next_item)
    (item, state) = next_item

    println(item)

    next_item = iterate(iter, state)
end
```

## Example

We want to define an iterator `Squares(n)` to iterate the sequence of [square numbers](https://en.wikipedia.org/wiki/Square_number) smaller than `n`. Square numbers are numbers that are the square of an integer. For example, 9 is a square number, since it can be written as `3 * 3`. The end result should look like:

```julia
julia> for i in Squares(20)
           println(i)
       end
1
4
9
16
```

To do that we need to define a type `Squares` and two `iterate` methods.
We will have the `Squares` type remember `n` and the `state` will simply be the next number to square.

```julia
struct Squares
    n::Int
end

function Base.iterate(S::Squares, state)
    item = state^2
    if item < S.n
        return (item, state + 1)
    end
    return nothing
end

Base.iterate(S::Squares) = iterate(S, 1)
```

You may find it useful to combine these two definitions into one using optional arguments:

## Making use of optional arguments

In a [previous exercise](https://exercism.io/tracks/julia/exercises/high-score) you have learned how to define several methods at once by making use of optional arguments.

Recall that

```julia
julia> f(a, b=1) = a + b
f (generic function with 2 methods)
```

is equivalent to

```julia
julia> f(a, b) = a + b
f (generic function with 1 method)

julia> f(a) = f(a, 1)
f (generic function with 2 methods)
```

For some iterators, optional arguments can simplify your `iterate` method to a single definition.
This is particularly useful when the computation of the next item is identical regardless if it's the first or a consecutive iteration.
Some iterators may require a more extensive initialisation, in which case it can be better to split them into two separate definitions.

## Source

This entire section is based on the Julia Manual section on the [Iteration Interface](https://docs.julialang.org/en/v1/manual/interfaces/#man-interface-iteration)[^1].

[^1]: accessed November 10, 2020

## Instructions

In this exercise you're going to write an iterator that iterates through the first `n` elements of the [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_number).

## Fibonacci sequence

The Fibonacci sequence is a sequence of numbers, where every element of the sequence is calculated by adding the two numbers that come before it.
You can think of a sequence as a list of numbers in a certain order.
The first two numbers of the sequence are set to $1$.

The start of the sequence is $1,~1,~2,~3,~5,~8,~13,~21,~34,~55,~89,~\dots$

In maths notation: <!-- TODO: Move this to an info box once they're available -->

$$
a_1 = a_2 = 1\\
a_n = a_{n-1} + a_{n-2}
$$

For example, the third element would be $a_3 = a_1 + a_2 = 1 + 1 = 2$, the fourth would be $a_4 = a_2 + a_3 = 1 + 2 = 3$, and so on.

~~~~exercism/note
Some sources define the first elements as $a_0 = 0$ and $a_1 = 1$.
However in the context of this exercise, we define the sequence without a $0$-th element.
~~~~

## 1. Define a `Fib` type with a constructor that takes `n` as argument

```julia
julia> Fib(10)
Fib(10)
```

## 2. Implement `iterate` methods

```julia
julia> for a in Fib(10)
           println(a)
       end
1
1
2
3
5
8
13
21
34
55
```

You can ignore integer overflow in your implementation.
The tests will only test for `n` small enough to not cause overflow problems.

## 3. Define the optional methods that make `collect` work

```julia
julia> collect(Fib(10))
10-element Array{Any,1}:
  1
  1
  2
  3
  5
  8
 13
 21
 34
 55
```

<!-- TODO: This may be out of scope -->

## 4. Define the optional methods that are necessary for Julia to infer the type of the elements of the iterator

```julia
julia> collect(Fib(10))
10-element Array{Int64,1}:
  1
  1
  2
  3
  5
  8
 13
 21
 34
 55
```

## Source

### Created by

- @SaschaMann

### Contributed to by

- @cmcaine
- @miguelraz
- @iHiD