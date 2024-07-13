# Cars, Assemble

Welcome to Cars, Assemble on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Comparison operators

R has a set of operators that is the same as many other languages:

```R
1 == 2 # FALSE
1 != 2 # TRUE
1 < 2 # TRUE
1 > 2 # FALSE
1 <= 2 # TRUE
1 >= 2 # FALSE
```

## Branching

The basic form of an if-else is 

```R
if (x > 10) {
    y <- "big"
} else if (x > 2) {
    y <- "medium"
} else {
    y <- "tiny"
}
```

In this case, parentheses `()` around the boolean and braces `{}` around the statement are both required. 
A simple `if` statement can be shortened:

```R
if (x == 0) return("success")
```

## Instructions

In this exercise you'll be writing code to analyze the production of an assembly line in a car factory. The assembly line's speed can range from `0` (off) to `10` (maximum).

At its lowest speed (`1`), `221` cars are produced each hour. The production increases linearly with the speed. So with the speed set to `4`, it should produce `4 * 221 = 884` cars per hour. However, higher speeds increase the likelihood that faulty cars are produced, which then have to be discarded. 

You have three tasks.

## 1. Calculate the success rate

Implement the `success_rate()` method to calculate the ratio of an item being created without error for a given speed. The following table shows how speed influences the success rate:

- `0`: 0% success rate.
- `1` to `4`: 100% success rate.
- `5` to `8`: 90% success rate.
- `9`: 80% success rate.
- `10`: 77% success rate.

```R
success_rate(10)
# => 0.77
```

## 2. Calculate the production rate per hour

Implement the `production_rate_per_hour()` method to calculate the assembly line's production rate per hour, taking into account its success rate:

```R
production_rate_per_hour(6)
# => 1193.4
```

Note that the value returned is a `double`.

## 3. Calculate the number of working items produced per minute

Implement the `working_items_per_minute()` method to calculate how many working cars are produced per minute:

```R
working_items_per_minute(6)
# => 19
```

Note that the value returned is an integer: incomplete items are not included.

## Source

### Created by

- @colinleach