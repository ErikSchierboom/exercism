# Cars Assemble

Welcome to Cars Assemble on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Comparison operators

Comparison operators in Julia are similar to many other languages, though with some extra options for math-lovers.

For equality, the operators are `==` (equal) and `!=` or `≠` (not equal).

```julia
txt = "abc"
txt == "abc"  # true
txt != "abc"  # false
txt ≠ "abc"  # false (synonym for !=)
```

In addition, we have the various greater/less than operators.

```julia
1 < 3  # true
3 > 3  # false
3 <= 3  # true
3 ≤ 3  # true (synonym for <=)
4 >= 3  # true
4 ≥ 3  # true (synonym for >=)
```

As often with Julia, an appropriate editor makes use of the mathematical symbol easy.
Type `\ne`, `\le` or `\ge` then `TAB` to get `≠`, `≤` or `≥`.

The previous example uses only numbers, but we will see in other parts of the syllabus that various additional types have a sense of ordering and can be tested for greater/less than.

Comparison operators can be chained, which allows a clear and concise syntax:

```julia
n = 3
1 ≤ n ≤ 5  # true (n "between" two limits)
```

The previous example is a synonym for `1 ≤ n && n ≤ 5`.

## Branching with `if`

This is the full form of an `if` statement:

```julia
if conditional1
    statements...
elseif conditional2
    statements...
else
    statements...
end
```

There is no need for parentheses `()` or braces `{}`, and indentation is "only" to improve readability _(but readability is very important!)_.

Both `elseif` and `else` are optional, and there can be multiple `elseif` blocks.
However, the `end` is required.

It is possible to nest `if` statements, though you might want to help readability with the thoughtful use of parentheses, indents and comments.

The shortest form of an `if` statement would be something like this:

```julia
if n < 0
    n = 0
end
```

As a reminder: only expressions that evaluate to `true` or `false` can be used as conditionals.
Julia deliberately avoids any concept of "truthiness", so zero values, empty strings and empty arrays are _not_ equivalent to `false`. 

## Ternary operator

A simple and common situation is picking one of two values based on a conditional.

Julia, like many languages, has a ternary operator to make this more concise.

The syntax is `conditional ? value_if_true : value_if_false`.

So the previous example could be rewritten:

```julia
n = n < 0 ? 0 : n
```

Parentheses are not required by the compiler, but may improve readability.

## Instructions

In this exercise you will be writing code to analyze the production of an assembly line in a car factory. 
The assembly line's speed can range from `0` (off) to `10` (maximum).

At its lowest speed (`1`), `221` cars are produced each hour. 
The production increases linearly with the speed. 
So with the speed set to `4`, it should produce `4 * 221 = 884` cars per hour. 
However, higher speeds increase the likelihood that faulty cars are produced, which then have to be discarded. 

You have three tasks.
Each of the required functions takes a single integer parameter, the speed of the assembly line.

## 1. Calculate the success rate

Implement the `success_rate()` method to calculate the probability of an item being created without error for a given speed. 
The following table shows how speed influences the success rate:

- `0`: 0% success rate.
- `1` to `4`: 100% success rate.
- `5` to `8`: 90% success rate.
- `9`: 80% success rate.
- `10`: 77% success rate.

```julia-repl
julia> success_rate(10)
0.77
```

## 2. Calculate the production rate per hour

Implement the `production_rate_per_hour()` method to calculate the assembly line's production rate per hour, taking into account its success rate.

```julia-repl
julia> production_rate_per_hour(6)
1193.4
```

Note that the value returned is floating-point.

## 3. Calculate the number of working items produced per minute

Implement the `working_items_per_minute()` method to calculate how many working cars are produced per minute:

```julia-repl
julia> working_items_per_minute(6)
19
```

Note that the value returned is an integer: incomplete items are not included.

## Source

### Created by

- @colinleach