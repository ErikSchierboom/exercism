# Freelancer Rates

Welcome to Freelancer Rates on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Numbers

Swift contains many basic numeric types that can represent sets of either integer or floating-point values, where different types may be chosen depending on the size of value you require and the architecture of the computer where the application is running (e.g. 32-bit or 64-bit).

For this exercise you will only be dealing with the two most commonly used numeric types in Swift:

- `Int`: This type is used to represent signed whole numbers e.g. `0`, `255`, `2147483647`. A signed integer is at least 32 bits in size (value range of: -2147483648 through 2147483647). But this will depend on the systems architecture. Most modern computers are 64 bit, therefore `Int` will be 64 bits in size (value range of: -9223372036854775808 through 9223372036854775807).

- `Double`: This type is a 64 bit floating-point type, used to represent numbers which may have a fractional component, e.g. `0.0`, `3.14`, and `-1.36969e-10`.

Swift supports the standard set of arithmetic operators of `+`, `-`, `*`, `/` and `%` (remainder not modulo). Note that for `Int` values, `/` is the integer division operator that throws away any remainder.

When a number is written as a whole number in Swift code, without any additional context to steer the type inference engine in the right direction, the Swift compiler will assume that number is an `Int`. If you want to tell the compiler that you want it to be a `Double` you must use either a type annotation or append a .0 onto the end of the number literal. E.g.

```swift
let x = 42         // x is an Int
let y = 42.0       // y is a Double
let z: Double = 42 // z is a Double
```

## Type Conversion

In Swift, assignment of a value between different types requires explicit conversion. For example, to convert an `Int` to a `Double` and vice versa, you would need to do the following:

```swift
let x = 42
let d = Double(x)

let pi = Double.pi
let iPi = Int(pi)

print("x:", x, "is of type:", type(of: x))
// Output: x: 42 is of type: Int

print("d:", d, "is of type:", type(of: d))
// Output: d: 42.0 is of type: Double

print("pi:", pi, "is of type:", type(of: pi))
// Output: pi: 3.141592653589793 is of type: Double

print("iPi:", iPi, "is of type:", type(of: iPi))
// Output: iPi: 3 is of type: Int
```

## Instructions

In this exercise you'll be writing code to help a freelancer communicate with a project manager by providing a few utilities to quickly calculate daily and monthly rates, optionally with a given discount.

We first establish a few rules between the freelancer and the project manager:

- The daily rate is 8 times the hourly rate.
- A month has 22 billable days.

The freelancer is offering a discount if the project manager chooses to let the freelancer bill per month, which can come in handy if there is a certain budget the project manager has to work with.

Discounts are modeled as fractional numbers representing percentage, for example `25.0` (25%).

## 1. Calculate the daily rate given an hourly rate

Implement the function `dailyRateFrom(hourlyRate:)` to calculate the daily rate given an hourly rate:

```swift
dailyRateFrom(hourlyRate: 60)
# => 480.0
```

The returned daily rate should be a `Double`.

## 2. Calculate the monthly rate, given an hourly rate and a discount

Implement the function `monthlyRateFrom(hourlyRate:withDiscount:)` to calculate the monthly rate, and apply a discount:

```swift
monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5)
# => 12129
```

The returned monthly rate should be returned as a Double rounded to the nearest whole number.

## 3. Calculate the number of workdays given a budget, hourly rate and discount

Implement the function `workdaysIn(budget:hourlyRate:withDiscount:)`, that takes a budget, a hourly rate, and a discount, and calculates how many days of work that covers. The returned number of days should be returned as a Double rounded down to the nearest integer.

```swift
workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11.0)
# => 35.0
```

## Source

### Created by

- @wneumann