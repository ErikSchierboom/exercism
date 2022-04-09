# Amusement Park Improvements

Welcome to Amusement Park Improvements on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## True and False

True and false logical states are represented with `true` and `false` in Ruby. 

```ruby
happy = true
sad = false
```

## Equality and comparison

Ruby allows you to compare objects to each other using the normal equality symbols:
- Use `==` to see if two objects are equal
- Use `>` to see if the object on the left is **greater than** the object on the right
- Use `<` to see if the object on the left is **less than** the object on the right.
- Use `>=` or `<=` to test for "greater than or equal to" and "less than or equal to" respectively.

You can also use boolean logic with the normal operators:
- Use `&&` or `and` to check if `x and y` are true
- Use `||` or `or` to check if `x or y` is true.
- Use `!` or `not` to invert equality - e.g. `x != y` (x does not equal y)

Here are some examples:
```ruby
# Is "true equal to false"? 
true == false # false

# Is "true not equal to false"
true != false # true

# Is 5 greater than 4?
5 > 4 # true

# Is 3 less than or equal to 2?
3 <= 2 # false
```

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil

## Instructions

Continuing your work with the amusement park, you are tasked with writing some utility methods to facilitate checking if an attendee can use a ride.

## 1. Check if an attendee has a ride pass

Implement the `Attendee#has_pass?` method to return a boolean (`true`/`false`) value based on the presence of a ride pass.

```ruby
Attendee.new(100).has_pass?
# => false
```

## 2. Check if an attendee fits a ride

Implement the `Attendee#fits_ride?` method to see if an attendee fits a ride based on their height.
The ride's required minimum height is provided as an argument.
An attendee must have height greater than or equal to ride's required minimum height.

```ruby
Attendee.new(140).fits_ride?(100)
# => true
```

## 3. Check if an attendee is allowed to ride

Implement the `Attendee#allowed_to_ride?` method to see if an attendee is allowed to go on a ride. The ride's required minimum height is provided as an argument. An attendee must have a ride pass and be able to fit the ride.

```ruby
attendee = Attendee.new(100)
attendee.issue_pass!(42)
attendee.allowed_to_ride?(120)
# => false
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @kotp
- @iHiD
- @kayn1