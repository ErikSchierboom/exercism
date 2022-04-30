# Bird Count

Welcome to Bird Count on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Recursion

Recursive functions are functions that call themselves.

A recursive function needs to have at least one _base case_ and at least one _recursive case_.

A _base case_ returns a value without calling the function again. A _recursive case_ calls the function again, modifying the input so that it will at some point match the base case.

Very often, each case is written in its own function clause.

```elixir
# base case
def count([]), do: 0

# recursive case
def count([_head | tail]), do: 1 + count(tail)
```

## Instructions

You're an avid bird watcher that keeps track of how many birds have visited your garden on any given day.

You decided to bring your bird watching to a new level and implement a few tools that will help you track and process the data.

You have chosen to store the data as a list of integers. The first number in the list is the number of birds that visited your garden today, the second yesterday, and so on.

## 1. Check how many birds visited today

Implement the `BirdCount.today/1` function. It should take a list of daily bird counts and return today's count. If the list is empty, it should return `nil`.

```elixir
BirdCount.today([2, 5, 1])
# => 2
```

## 2. Increment today's count

Implement the `BirdCount.increment_day_count/1` function. It should take a list of daily bird counts and increment the today's count by 1. If the list is empty, return `[1]`.

```elixir
BirdCount.increment_day_count([4, 0, 2])
# => [5, 0, 2]
```

## 3. Check if there was a day with no visiting birds

Implement the `BirdCount.has_day_without_birds?/1` function. It should take a list of daily bird counts. It should return `true` if there was at least one day when no birds visited the garden, and `false` otherwise.

```elixir
BirdCount.has_day_without_birds?([2, 0, 4])
# => true

BirdCount.has_day_without_birds?([3, 8, 1, 5])
# => false
```

## 4. Calculate the total number of visiting birds

Implement the `BirdCount.total/1` function. It should take a list of daily bird counts and return the total number that visited your garden since you started collecting the data.

```elixir
BirdCount.total([4, 0, 9, 0, 5])
# => 18
```

## 5. Calculate the number of busy days

Some days are busier than others. A busy day is one where five or more birds have visited your garden.

Implement the `BirdCount.busy_days/1` function. It should take a list of daily bird counts and return the number of busy days.

```elixir
BirdCount.busy_days([4, 5, 0, 0, 6])
# => 2
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw