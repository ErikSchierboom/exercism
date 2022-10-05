# Name Badge

Welcome to Name Badge on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Nil

[Nil][nil-dictionary] is an English word meaning "nothing" or "zero". In Elixir, `nil` is a special value that means an _absence_ of a value.

```elixir
# I do not have a favorite color
favorite_color = nil
```

In other programming languages, `null` or `none` values might play a similar role.

## If

Besides `cond`, Elixir also provides the macro [`if/2`][getting-started-if-unless] which is useful when you need to check for only one condition.

[`if/2`][kernel-if] accepts a condition and two options. It returns the first option if the condition is _truthy_, and the second option if the condition is _falsy_.

```elixir
age = 15

if age >= 16 do
  "You are allowed to drink beer in Germany."
else
  "No beer for you!"
end

# => "No beer for you!"
```

It is also possible to write an `if` expression on a single line. Note the comma after the condition.

```elixir
if age > 16, do: "beer", else: "no beer"
```

This syntax is helpful for very short expressions, but should be avoided if the expression won't fit on a single line.

### _Truthy_ and _falsy_

In Elixir, all data types evaluate to a _truthy_ or _falsy_ value when they are encountered in a boolean context (like an `if` expression). All data is considered _truthy_ **except** for `false` and `nil`. In particular, empty strings, the integer `0`, and empty lists are all considered _truthy_ in Elixir.

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil
[kernel-if]: https://hexdocs.pm/elixir/Kernel.html#if/2
[getting-started-if-unless]: https://elixir-lang.org/getting-started/case-cond-and-if.html#if-and-unless

## Instructions

In this exercise you'll be writing code to print name badges for factory employees. Employees have an ID, name, and department name. Employee badge labels are formatted as follows: `"[id] - name - DEPARTMENT"`.

## 1. Print a badge for an employee

Implement the `NameBadge.print/3` function. It should take an id, name, and a department. It should return the badge label, with the department name in uppercase.

```elixir
NameBadge.print(67, "Katherine Williams", "Strategic Communication")
# => "[67] - Katherine Williams - STRATEGIC COMMUNICATION"
```

## 2. Print a badge for a new employee

Due to a quirk in the computer system, new employees occasionally don't yet have an ID when they start working at the factory. As badges are required, they will receive a temporary badge without the ID prefix.

Extend the `NameBadge.print/3` function. When the id is missing, it should print a badge without it.

```elixir
NameBadge.print(nil, "Robert Johnson", "Procurement")
# => "Robert Johnson - PROCUREMENT"
```

## 3. Print a badge for the owner

Even the factory's owner has to wear a badge at all times. However, an owner does not have a department. In this case, the label should print `"OWNER"` instead of the department name.

Extend the `NameBadge.print/3` function. When the department is missing, assume the badge belongs to the company owner.

```elixir
NameBadge.print(204, "Rachel Miller", nil)
# => "[204] - Rachel Miller - OWNER"
```

Note that it is possible for the owner to also be a new employee.

```elixir
NameBadge.print(nil, "Rachel Miller", nil)
# => "Rachel Miller - OWNER"
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw