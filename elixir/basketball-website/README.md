# Basketball Website

Welcome to Basketball Website on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Access Behaviour

Elixir uses code _Behaviours_ to provide common generic interfaces while facilitating specific implementations for each module which implements it. One such common example is the _Access Behaviour_.

The _Access Behaviour_ provides a common interface for retrieving data from a key-based data structure. The _Access Behaviour_ is implemented for maps and keyword lists, but let's look at its use for maps to get a feel for it. _Access Behaviour_ specifies that when you have a map, you may follow it with _square brackets_ and then use the key to retrieve the value associated with that key.

```elixir
# Suppose we have these two maps defined (note the difference in the key type)
my_map = %{key: "my value"}
your_map = %{"key" => "your value"}

# Obtain the value using the Access Behaviour
my_map[:key] == "my value"
your_map[:key] == nil
your_map["key"] == "your value"
```

If the key does not exist in the data structure, then `nil` is returned. This can be a source of unintended behavior, because it does not raise an error. Note that `nil` itself implements the Access Behaviour and always returns `nil` for any key.

## Instructions

You are working with a web development team to maintain a website for a local basketball team. The web development team is less familiar with Elixir and is asking for a function to be able to extract data from a series of nested maps to facilitate rapid development.

## 1. Extract data from a nested map structure

Implement the `extract_from_path/2` function to take two arguments:

- `data`: a nested map structure with data about the basketball team.
- `path`: a string consisting of period-delimited keys to obtain the value associated with the last key.

If the value or the key does not exist at any point in the path, `nil` should be returned

```elixir
data = %{
  "team_mascot" => %{
    "animal" => "bear",
    "actor" => %{
      "first_name" => "Noel"
    }
  }
}
BasketballWebsite.extract_from_path(data, "team_mascot.animal")
# => "bear"
BasketballWebsite.extract_from_path(data, "team_mascot.colors")
# => nil
```

Use the _Access Behaviour_ when implementing this function.

Do not use any `Map` or `Kernel` module functions for working with the nested map data structure.

## 2. Refactor using included functions

Your coworker reviewing your code tells you about a `Kernel` module function which does something very similar to your implementation.

Implement `get_in_path/2` to use this `Kernel` module function.

The arguments expected are the same as part 1.

```elixir
BasketballWebsite.get_in_path(data, "team_mascot.actor.first_name")
# => "Noel"
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @NobbZ