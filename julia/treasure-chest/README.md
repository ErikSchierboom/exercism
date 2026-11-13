# Treasure Chest

Welcome to Treasure Chest on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In the `Types` Concept, we learned that:

- Types in Julia form a hierarchy.
- Each type has a supertype.
- `Any` is at the top of the hierarchy, and is its own supertype.
- Types _may_ have subtypes, and those which do are called `abstract types`.
- Types without subtypes (leaf nodes on the tree) are called `concrete types`.
- Indivisible types, such as `Char` or `Int64`, are called `primitive types`.

Only `primitive` types follow the abstract versus concrete pattern in its simple form.
`Vector` is a collection, separable into elements with their own type.

```julia-repl
julia> isprimitivetype(Int)
true

julia> isprimitivetype(Vector)
false
```

_A collection of what?_

Each vector (or set) is a collection of elements with some uniform type, which can either be specified with a _parameter_ in braces `{ }`, or omitted for type inference to determine.

```julia-repl
julia> v = [1, 2, 3]
3-element Vector{Int64}:
 1
 2
 3

julia> v8 = Vector{Int8}([2, 4, 6])
3-element Vector{Int8}:
 2
 4
 6
```

These `parametric types` are a form of `generic programming`, and many modern languages have something broadly equivalent – though with many differences in the details.

## Parametric Composite Types

Sometimes we want to create a composite type flexible (generic) enough to handle different field types.

This can be achieved with a dummy type in the definition, usually called `T`.

```julia-repl
julia> struct Point{T}
               x::T
               y::T
       end

# high definition version

julia> real_point = Point(7.3, 4.2)
Point{Float64}(7.3, 4.2)

julia> typeof(real_point)
Point{Float64}

# low definition version

julia> int8point = Point{Int8}(17, 23)
Point{Int8}(17, 23)

julia> typeof(int8point)
Point{Int8}

julia> Point(Int8(17), Int8(23))
Point{Int8}(17, 23)
```

Naturally, this approach also works with collections in fields:

```julia-repl
julia> struct Record{T}
           data::Vector{T}
           comment::String
       end

julia> rec = Record{Float64}([1.3, 5.2], "some data")
Record{Float64}([1.3, 5.2], "some data")

julia> rec.data
2-element Vector{Float64}:
 1.3
 5.2

julia> rec2 = Record{Int32}([3, 5], "more data")
Record{Int32}(Int32[3, 5], "more data")

julia> rec2.data
2-element Vector{Int32}:
 3
 5
```

## Instructions

In this exercise you're going to write a generic (/ magical!) TreasureChest, to store some treasure.

## 1. Define the TreasureChest type

Define a `TreasureChest{T}` parametric type with two fields.

- A `password` field of type `String`, which will be used to store the password of the treasure chest.
- A `treasure` field of type `T`, which will be used to store the treasure.
This value is generic so that the treasure can be anything.

```julia-repl
julia> chest = TreasureChest{String}("password", "gold")
TreasureChest{String}("password", "gold")
```



## 2. Define the get_treasure() function

This function should take two arguments.

- A `String` (for trying a password)
- A `TreasureChest` type

This function should check the provided password attempt against the `password` in the `TreasureChest`.

- If the passwords match then return the treasure.
- If the passwords do not match then return `nothing`.

```julia-repl
julia> get_treasure("password", chest)
"gold"

julia> get_treasure("wrong", chest)
# no output

julia> isnothing(get_treasure("wrong", chest))
true
```

## 3. Define the multiply_treasure() function

This function should take two arguments.

- An integer multiplier `n`.
- A `TreasureChest{T}` type.

The function should return a new `TreasureChest{Vector{T}}`, with
- The same password as the original
- The multiplied treasure as a `Vector{T}` of length `n`, and the original treasure repeated `n` times.

```julia-repl
julia> multiply_treasure(3, chest)
TreasureChest{Vector{String}}("password", ["gold", "gold", "gold"])
```

## Source

### Created by

- @colinleach