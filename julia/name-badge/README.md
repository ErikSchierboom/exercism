# Name Badge

Welcome to Name Badge on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Nothingness

`nothing` is a singleton instance of the `Nothing` type.
It is used when a function has no return value, or when a variable holds no value.

You can test if a value is `nothing` using the `isnothing` function:

```jldoctest
julia> isnothing("something")
false

julia> isnothing("")
false

julia> isnothing(nothing)
true
```

In other languages, `null`, `nil`, or `none` values may serve similar purposes.

## Source

This entire document is derived from the Julia documentation for [`nothing`](https://docs.julialang.org/en/v1/base/constants/#Core.nothing) and [`isnothing`](https://docs.julialang.org/en/v1/base/base/#Base.isnothing)

## Instructions

In this exercise you'll be writing code to print name badges for factory employees.
Employees have an ID, name, and department name.
Employee badge labels are formatted as follows: `"[id] - [name] - [DEPARTMENT]"`.

## 1. Print a badge for an employee

Implement the `badge` function.
It should take an ID, name, and a department.
It should return the badge label, with the department name in uppercase:

```julia
julia> badge(7, "Eneus", "Wizardry & Witchcraft")
"[7] - Eneus - WIZARDRY & WITCHCRAFT"
```

## 2. Print a badge for a new employee

Due to a quirk in the computer system, new employees occasionally don't yet have an ID when they start working at the factory.
As badges are required, they will receive a temporary badge without the ID prefix.

Extend the `badge` function.
When the ID is missing, it should print a badge without it:

```julia
julia> badge(nothing, "Helge Klaasen", "Procurement")
"Helge Klaasen - PROCUREMENT"
```

## 3. Print a badge for the owner

Even the factory's owner has to wear a badge at all times.
However, an owner does not have a department.
In this case, the label should print `"OWNER"` instead of the department name.

Extend the `badge` function.
When the department is missing, assume the badge belongs to the company owner:

```julia
julia> badge(204, "Lilyana Porsche", nothing)
"[204] - Lilyana Porsche - OWNER"
```

Note that it is possible for the owner to also be a new employee:

```julia
julia> badge(nothing, "Adéla Evans", nothing)
"Adéla Evans - OWNER"
```

## Source

### Created by

- @SaschaMann

### Contributed to by

- @cmcaine