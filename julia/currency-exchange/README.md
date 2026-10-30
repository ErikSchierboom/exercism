# Currency Exchange

Welcome to Currency Exchange on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Julia is a general-purpose language that can be used for most programming tasks.
In practice, however, the main use cases tend to be in engineering and science.
Fast, versatile, sophisticated numerical calculations are central to the design.

## Integers

An integer is a "round" number with no decimal point.

In the [Basics][basics] concept, we saw that an integer value can be assigned to a variable without specifying a type.

For readability, underscores can be used as a digit separator.
They are ignored by the compiler.

```julia-repl
julia> x = 3
3

julia> typeof(x)
Int64

julia> large_number = 1_234_567_890
1234567890
```


## Floating-point

It will be no surprise that floating-point numbers have a decimal point, and a fractional part after the point.

```julia-repl
julia> f = 3.45
3.45

julia> typeof(f)
Float64
```

Of course, scientific notation is supported.

```julia-repl
julia> avogadro = 6.02e23
6.02e23
```

The maximum and minimum values may come as a surprise:

```julia-repl
julia> typemax(Float64)
Inf

julia> typemin(Float64)
-Inf
```

Infinity is a valid value!

## Arithmetic operators

As discussed in the Basics concept, arithmetic operators mostly work the same as standard arithmetic, as taught to children.
Note that exponentiation uses `^`, _not_ `**` (both are common in other languages).

```julia
2 + 3  # 5 (addition)
2 - 3  # -1 (subtraction)
2 * 3  # 6 (multiplication)
8 / 2  # 4.0 (division)
8 % 3  # 2 (remainder)
2 ^ 3  # 8 (exponentiation)
```

However, a few Julia-specific details are worth discussing.

### Multiplication

```julia-repl
julia> x = 4.2
4.2

julia> 2 * x
8.4

julia> 2x
8.4

julia> 2.4x
10.08
```

That may be surprising.

It is always possible to use `*` as an infix operator, as in most other computer languages.

However, Julia is designed by people who believe that code should look as much as possible like mathematical equations.

Because variable names must start with a letter, prefacing the name with a number (integer or floating-point) is treated as implicit multiplication.

For example, if we want the surface area of a sphere, instead of `4 * pi * r * r` we could do this :

```julia-repl
julia> surface(r) = 4π * r^2
surface (generic function with 1 method)

julia> surface(3)
113.09733552923255
```

Although π is a built-in constant, it is also a (Greek) letter.
The parser therefore still needs one explicit `*` to separate `π` from `r`.

### Division

Using `/` as the infix operator will always give a floating-point result, even for integer inputs.

For integer division, there are more options.

```julia-repl
julia> 10 / 3  # floating-point division
3.3333333333333335

julia> div(10, 3)  # integer division
3

julia> 10 ÷ 3  # synonym for div()
3

julia> 10 // 3  # rational number (fraction)
10//3
```

The `div()` function is for integer division, with the result truncated towards zero: downwards for positive numbers, upwards for negative numbers.

As a synonym, we can use the infix operator `÷`, again aiming to make it look more mathematical.
If you are using a Julia-aware editor, enter this as `\div` then hit the `<Tab>` key.

The `//` operator is beyond the scope of this Concept.
For now, we can just say that the result of `//` is a "rational" number, which most people call a _fraction_.

## Conversion of numeric types

This can often happen automatically:

```julia-repl
julia> x = 2 + 3.5
5.5

julia> typeof(x)
Float64
```

We added an `Int64` to a `Float64`, and got a `Float64` result.

In fact, the integer was silently converted to a `Float64` before doing the addition.

**Float-to-integer** conversions are inevitably more complicated.
What do you want to do with anything after the decimal point?

- The `round()` function converts to the nearest whole number, with ties such as 4.5 rounding to the nearest _even_ whole number.
- `floor()` rounds down, `ceil()` rounds up, `trunc()` rounds towards zero.
- Attempting to cast directly, for example with `Int32()`, will fail with an `InexactError`.

However, by default these functions do not return the integer type you might have wanted.
The desired output type can be specified.

```julia-repl
julia> round(4.5)
4.0

julia> ceil(Int, 4.3)
5
```

Rounding to a specified number of digits after the decimal point is also possible with the `digits` keyword.

```julia-repl
julia> round(π, digits=10)
3.1415926536
```

## Divide-by-zero

Surely this just throws an error?
In fact, the situation is not that simple.

Integer division with `÷` or `//` will result in an error, as you might expect.

Floating-point division with `/` takes what might be considered an engineering approach, rather than a standard computer science approach:

```julia-repl
julia> 2 / 0
Inf

julia> 0 / 0
NaN
```

As discussed in a previous section, infinity is a valid floating-point number in Julia, represented by `Inf`.

When the numerator is also zero, the result is mathematically undefined.
Julia then treats it as "not a number", represented by `NaN`.

[basics]: https://exercism.org/tracks/julia/concepts/basics

## Instructions

Your friend Chandler plans to visit exotic countries all around the world. Sadly, Chandler's math skills aren't good. He's pretty worried about being scammed by currency exchanges during his trip - and he wants you to make a currency calculator for him. Here are his specifications for the app:

## 1. Estimate value after exchange

Create the `exchange_money()` function, taking 2 parameters:

1. `budget` : The amount of money you are planning to exchange.
2. `exchange_rate` : The amount of domestic currency equal to one unit of foreign currency.

This function should return the value of the exchanged currency.

**Note:** If your currency is USD and you want to exchange USD for EUR with an exchange rate of `1.20`, then `1.20 USD == 1 EUR`.

```julia
julia> exchange_money(127.5, 1.2)
106.25
```

## 2. Calculate currency left after an exchange

Create the `get_change()` function, taking 2 parameters:

1. `budget` : Amount of money before exchange.
2. `exchanging_value` : Amount of money that is *taken* from the budget to be exchanged.

This function should return the amount of money that *is left* from the budget.

```julia
julia> get_change(127.5, 120)
7.5
```

## 3. Calculate value of bills

Create the `get_value_of_bills()` function, taking 2 parameters:

1. `denomination` : The value of a single bill.
2. `number_of_bills` : The total number of bills.

This exchanging booth only deals in cash of certain increments.
The total you receive must be divisible by the value of one "bill" or unit, which can leave behind a fraction or remainder.
Your function should return only the total value of the bills (_excluding fractional amounts_) the booth would give back.
Unfortunately, the booth gets to keep the remainder/change as an added bonus.

```julia
julia> get_value_of_bills(5, 128)
640
```

## 4. Calculate number of bills

Create the `get_number_of_bills()` function, taking `amount` and `denomination`.

This function should return the _number of currency bills_ that you can receive within the given _amount_.
In other words:  How many _whole bills_ of currency fit into the starting amount?
Remember -- you can only receive _whole bills_, not fractions of bills, so remember to divide accordingly.
Effectively, you are rounding _down_ to the nearest whole bill/denomination.

```julia
julia> get_number_of_bills(127.5, 5)
25
```

## 5. Calculate leftover after exchanging into bills

Create the `get_leftover_of_bills()` function, taking `amount` and `denomination`.

This function should return the _leftover amount_ that cannot be returned from your starting _amount_ given the denomination of bills.
It is very important to know exactly how much the booth gets to keep.

```julia
julia> get_leftover_of_bills(127.5, 20)
7.5
```

## 6. Calculate value after exchange

Create the `exchangeable_value()` function, taking `budget`, `exchange_rate`, `spread`, and `denomination`.

Parameter `spread` is the *percentage taken* as an exchange fee, written as an integer.
It needs to be converted to decimal by dividing it by 100.
If `1.00 EUR == 1.20 USD` and the *spread* is `10`, the total exchange rate will actually be: `1.00 EUR == 1.32 USD` because 10% of 1.20 is 0.12, and this additional fee is added to the exchange.

This function should return the maximum value of the new currency after calculating the *exchange rate* plus the *spread*.
Remember that the currency *denomination* is a whole number, and cannot be sub-divided.

**Note:** Returned value should be an integer type.

```julia
julia> exchangeable_value(127.25, 1.20, 10, 20)
80

julia> exchangeable_value(127.25, 1.20, 10, 5)
95
```

## Source

### Created by

- @colinleach