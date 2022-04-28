# Freelancer Rates

Welcome to Freelancer Rates on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Integers

There are two different kinds of numbers in Elixir - integers and floats.

Integers are whole numbers.

```elixir
integer = 3
# => 3
```

## Floating Point Numbers

Floats are numbers with one or more digits behind the decimal separator. They use the 64-bit double precision floating-point format.

```elixir
float = 3.45
# => 3.45
```

### Working with numbers

In the [`Integer`][integer-functions] and [`Float`][float-functions] modules you can find some useful functions for working with those types. Basic arithmetic operators are defined in the [`Kernel`][kernel-arithmetic-operators] module.

### Conversion

Integers and floats can be mixed together in a single arithmetic expression. Using a float in an expression ensures the result will be a float too.

```elixir
2 * 3
# => 6

2 * 3.0
# => 6.0
```

However, when doing division, the result will always be a float, even if only integers are used.

```elixir
6 / 2
# => 3.0
```

To convert a float to an integer, you can discard the decimal part with [`trunc/1`][trunc-1].

[integer-functions]: https://hexdocs.pm/elixir/Integer.html#functions
[float-functions]: https://hexdocs.pm/elixir/Float.html#functions
[kernel-arithmetic-operators]: https://hexdocs.pm/elixir/Kernel.html#*/2
[trunc-1]: https://hexdocs.pm/elixir/Kernel.html#trunc/1

## Instructions

In this exercise you'll be writing code to help a freelancer communicate with a project manager by providing a few utilities to quickly calculate daily and
monthly rates, optionally with a given discount.

We first establish a few rules between the freelancer and the project manager:

- The daily rate is 8 times the hourly rate.
- A month has 22 billable days.

The freelancer is offering to apply a discount if the project manager chooses to let the freelancer bill per month, which can come in handy if there is a certain budget the project manager has to work with.

Discounts are modeled as fractional numbers representing percentage, for example `25.0` (25%).

## 1. Calculate the daily rate given an hourly rate

Implement a function to calculate the daily rate given an hourly rate:

```elixir
FreelancerRates.daily_rate(60)
# => 480.0
```

The returned daily rate should be a float.

## 2. Calculate a discounted price

Implement a function to calculate the price after a discount.

```elixir
FreelancerRates.apply_discount(150, 10)
# => 135.0
```

The returned value should always be a float, not rounded in any way.

## 3. Calculate the monthly rate, given an hourly rate and a discount

Implement a function to calculate the monthly rate, and apply a discount:

```elixir
FreelancerRates.monthly_rate(77, 10.5)
# => 12130
```

The returned monthly rate should be rounded up (take the ceiling) to the nearest integer.

## 4. Calculate the number of workdays given a budget, hourly rate and discount

Implement a function that takes a budget, an hourly rate, and a discount, and calculates how many days of work that covers.

```elixir
FreelancerRates.days_in_budget(20000, 80, 11.0)
# => 35.1
```

The returned number of days should be rounded down (take the floor) to one decimal place.

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw