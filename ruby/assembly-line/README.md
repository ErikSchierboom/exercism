# Assembly Line

Welcome to Assembly Line on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Numbers

The two most common types of numbers in Ruby are:

- **Integers:** numbers with no digits behind the decimal separator (whole numbers). Examples are `-6`, `0`, `1`, `25`, `976` and `500000`.
- **Floating-point numbers:** numbers with zero or more digits behind the decimal separator. Examples are `-2.4`, `0.1`, `3.14`, `16.984025` and `1024.0`.

They are implemented through the `Integer` and `Float` classes.

These classes have methods that will coerce values from one to the other. `Integer` numbers are precise to a whole unit, while `Float` has precision that is fractional to a whole number:
- `Integer#to_f`: Coerce to a new float
- `Float#ceil`: Round up to the nearest integer
- `Float#floor`: Round down to the nearest integer
- `Float#round`: Round to the nearest integer
- `Float#to_i`: Truncate to the nearest integer

## Conditionals

In this exercise you must conditionally execute logic. 
A common way to do this in Ruby is by using an `if/else` statement:

```ruby
x = 5

if x == 5
  # Execute logic if x equals 5
elsif x > 7
  # Execute logic if x greater than 7
else
  # Execute logic in all other cases
end
```

## Instructions

In this exercise you'll be writing code to analyze the production of an assembly line in a car factory. 
The assembly line's speed can range from `0` (off) to `10` (maximum).

At its slowest speed (`1`), `221` cars are produced each hour. 
The production increases linearly with the speed. 
So with the speed set to `4`, it should produce `4 * 221 = 884` cars per hour. 
However, higher speeds increase the likelihood that faulty cars are produced, which then have to be discarded. 
The following table shows how speed influences the success rate:

- `1` to `4`: 100% success rate.
- `5` to `8`: 90% success rate.
- `9`: 80% success rate.
- `10`: 77% success rate.

You have two tasks.

## 1. Calculate the production rate per hour

Implement the `AssemblyLine#production_rate_per_hour` method to calculate the assembly line's production rate per hour, taking into account its success rate.
Note that the value returned is an instance of `Float`.

```ruby
AssemblyLine.new(6).production_rate_per_hour
#=> 1193.4
```

## 2. Calculate the number of working items produced per minute

Implement the `AssemblyLine#working_items_per_minute` method to calculate how many **completed, working cars** are produced per minute.
Note that the value returned is an instance of `Integer`.

```ruby
AssemblyLine.new(6).working_items_per_minute
#=> 19
```

## Source

### Created by

- @dvik1950

### Contributed to by

- @kotp
- @iHiD