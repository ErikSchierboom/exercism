# Savings Account

Welcome to Savings Account on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Modules

So far all the exercises you have seen have used classes.
Sometimes we do not need the overhead of creating an object with state, so instead we use `module`.

A module is very similar to a class (in fact, `Module` is `Class`' parent in the object hierarchy) - the main difference being that rather than using instance methods, we use class methods.
Class methods start with `self.` and are directly called on a module.

For example:

```ruby
module Speaker
  def self.echo(something)
    "#{something} ... #{something}"
  end
end

Speaker.echo("Hello")   #=> "Hello ... Hello"
```

## Loops

There are several ways to write loops in Ruby, but as we tend to use enumeration rather than looping in general, the most commonly seen loop perhaps is the `while` loop:

```ruby
counter = 0

while counter < 5
  counter += 1
end
```

You can also use its sibling `until`

```ruby
counter = 0

until counter == 5
  counter += 1
end
```

## Instructions

In this exercise you will be working with savings accounts. Each year, the balance of a savings account is updated based on the interest rate. The interest rate the bank gives depends on the amount of money in the accounts (its balance):

- -3.213% for a negative balance.
- 0.5% for a non-negative balance less than `1000` dollars.
- 1.621% for a positive balance greater or equal than `1000` dollars and less than `5000` dollars.
- 2.475% for a positive balance greater or equal than `5000` dollars.

You have three tasks, each of which will deal with the balance and its interest rate.

## 1. Calculate the interest rate

Implement the `SavingsAccount.interest_rate` method to calculate the interest rate based on the specified balance:

```ruby
SavingsAccount.interest_rate(200.75)
#=> 0.5
```

Note that the value returned is an instance of `Float`.

## 2. Calculate the annual balance update

Implement the `SavingsAccount.annual_balance_update` method to calculate the annual balance update, taking into account the interest rate:

```ruby
SavingsAccount.annual_balance_update(200.75)
#=> 201.75375
```

Note that the value returned is an instance of `Float`.

## 3. Calculate the years before reaching the desired balance

Implement the `SavingsAccount.years_before_desired_balance` method to calculate the minimum number of years required to reach the desired balance:

```ruby
SavingsAccount.years_before_desired_balance(200.75, 214.88)
#=> 14
```

Note that the value returned is an instance of `Integer`.

## Source

### Created by

- @TBD

### Contributed to by

- @dvik1950