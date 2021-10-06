# Interest is Interesting

Welcome to Interest is Interesting on Exercism's Clojure Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A floating-point number is a number with zero or more digits behind the decimal separator. Examples are `-2.4`, `0.1`, `3.14`, `16.984025` and `1024.0`.

Different floating-point types can store different numbers of digits after the digit separator - this is referred to as its precision. This means that trying to store PI in a `single` will only store the first 6 to 9 digits (with the last digit being rounded).

Floating point numbers in Clojure are read as Doubles; with M suffix they are read as BigDecimals.

- `Double`: 8 bytes (~15-17 digits precision). This is the most common type. Written as `2.45`.
- `BigDecimal`: Arbitrary precision integer unscaled value and a 32-bit integer scale. Written as `2.45M`.

## Instructions

In this exercise you'll be working with savings accounts. Each year, the balance of your savings account is updated based on its interest rate. The interest rate your bank gives you depends on the amount of money in your account (its balance):

- -3.213% for a negative balance.
- 0.5% for a positive balance less than `1000` dollars.
- 1.621% for a positive balance greater or equal than `1000` dollars and less than `5000` dollars.
- 2.475% for a positive balance greater or equal than `5000` dollars.

Each year the government allows you to donate a percentage of your money to charity, tax free. Because you're a nice person, if your balance is positive at the end of the year, you donate twice this amount to charities, rounded down to the nearest whole dollar.

You have three tasks, each of which will deal with your balance and its interest rate.

## 1. Calculate the interest rate

Implement the `interest-rate` function to calculate the interest rate based on the specified balance:

```clojure
(interest-rate 200.75M)
;;=> 0.5
```

Note that the value returned is a `Double`.

## 2. Calculate the annual balance update

Implement the `annual-balance-update` function to calculate the annual balance update, taking into account the interest rate:

```clojure
(annual-balance-update 200.75M)
;;=> 201.75375M
```

Note that the value returned is a `BigDecimal`.

## 3. Calculate how much money to donate

Implement the `amount-to-donate` function to calculate how much money to donate to charities based on the balance and the tax-free percentage that the government allows:

```clojure
(def balance 550.5M)
(def tax-free-percentage 2.5)

(amount-to-donate balance tax-free-percentage)
;;=> 27
```

Note that the value returned is an `int`.

## Source

### Created by

- @porkostomus