# Moviegoer

Welcome to Moviegoer on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## The ternary operator

A ternary conditional is a shorter way of writing simple `if/else` statements.
If an `if/else` statement contains only two branches, one for when the condition is true and one for when it is false, it can be re-written as a ternary conditional.

Ternaries use a combination of the `?` and `:` symbols to split up a conditional:

```ruby
condition ? true_branch : false_branch
```

The code on the left side of the `?` is the condition and the code on the right contains the two possible branches, separated by the `:`.
If the condition is _true_, the code on the _left_ side of the `:` is executed.
If the condition is _false_, then the code on the _right_ of the `:` gets executed.

For example:

```ruby
if traffic_light == 'green'
  cross_the_road
else
  wait
end
```

can be re-written as:

```ruby
traffic_light == 'green' ? cross_the_road : wait
```

## Instructions

In this exercise you will build out rules for a movie theater's website.

## 1. Check if a moviegoer is entitled to the seniors' discount

The theatre offers a discount for "old-age-pensions".
Anyone who is 60 or older pays 10.00 for a ticket.
Anyone younger pays the full 15.00.

Write the `Moviegoer#ticket_price` method using a ternary statement.

```ruby
Moviegoer.new(21).ticket_price
#=> 15

Moviegoer.new(65).ticket_price
#=> 10
```

## 2. Check if a moviegoer is allowed to see scary movies

The cinema has a simplified age-verification system.
If you are 18 or over you can watch scary movies.
If you are younger, you cannot.

Implement the `Moviegoer.watch_scary_movie?` method.
It should return whether someone is allowed to watch the movie or not.

```ruby
Moviegoer.new(21).watch_scary_movie?
#=> true

Moviegoer.new(17).watch_scary_movie?
#=> false
```

## 3. Check if a moviegoer is entitled to free popcorn

The cinema has a Movie Club program.
Members get free popcorn when they watch any movie.

Implement the `Moviegoer.claim_free_popcorn!` method.
If a viewer is a movie club member, they should be rewarded with their free popcorn.
If they are not, the method should raise the `NotMovieClubMemberError` exception defined at the top of the code.


```ruby
Moviegoer.new(21, member: true).claim_free_popcorn!
#=> 🍿

Moviegoer.new(17, member: false).claim_free_popcorn!
#=> Exception was raised! (NotMovieClubMemberError)
```

## Source

### Created by

- @lxmrc
- @iHiD