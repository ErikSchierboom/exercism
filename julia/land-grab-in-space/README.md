# Land Grab In Space

Welcome to Land Grab In Space on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

It is often useful to define custom types in our programs.

Creating new primitive types is possible, but rarely done.
The built-in primitive types are not an arbitrary choice: they closely match the standard types in the LLVM compiler used by Julia for JIT compilation.

Much more useful is the ability to define composite types, with named fields.

Other languages have something similar, calling them `structs` or `records`.
The Julia documentation refers to them as `composite types`, though (in a slight mismatch) the language syntax defines them with the `struct` keyword.

```julia-repl
julia> struct Person
           id
           name::String
           age::Integer
       end

julia> fred = Person(23, "Fred Smith", 46)
Person(23, "Fred Smith", 46)

julia> typeof(fred)
Person

julia> isstructtype(Person)
true

julia> isconcretetype(Person)
true

julia> fred.age
46
```

A few points are worth noting in the above example:

- No type is specified for `id`, so the compiler interprets this as `id::Any`.
- The type name is used as a constructor, as in `Person(id, name, age)`, to give an instance of type `Person`.
- Individual fields can be accessed with dot notation, the same as named tuples.

Items of type `Person` are immutable, so updates are not allowed.

```julia-repl
julia> fred.age += 1
ERROR: setfield!: immutable struct of type Person cannot be changed
```

If mutability is necessary, add `mutable` to the definition.

```julia-repl
julia> mutable struct MutPerson
           name
           age
       end

julia> shaila = MutPerson("Shaila", 23)
MutPerson("Shaila", 23)

julia> shaila.age += 1
24

julia> shaila
MutPerson("Shaila", 24)
```

The constructor, by default, requires the fields to appear in the same order as the definition, which becomes inconvenient for more complicated types.

Using the `@kwdef` macro allows two new capabilities:

- The constructor uses keywords, not position.
- Fields can have default values, and optionally can be omitted from the constructor.

```julia-repl
julia> @kwdef struct KwPerson
           name
           age = 42
       end
KwPerson

julia> suki = KwPerson(age=29, name="Suki")
KwPerson("Suki", 29)

julia> qi = KwPerson(name="Qi")
KwPerson("Qi", 42)

# create a Vector{KwPerson}

julia> friends = [suki, qi]
2-element Vector{KwPerson}:
 KwPerson("Suki", 29)
 KwPerson("Qi", 42)
```

## Composite Type Hierarchies

So far, we have only created concrete composite types.
If you check, all are subtypes of `Any`.

When creating multiple related types, it probably makes more sense to define a hierarchy for them.
This is very easily done.

First, create an abstract type:

```julia-repl
julia> abstract type AbstractPerson end

julia> supertype(AbstractPerson)
Any
```

Next, include a `<:` operator in a type definition, to show the relationship.

```julia-repl
julia> struct ConcretePerson <: AbstractPerson
            id
            name::String
            age::Integer
        end

julia> supertype(ConcretePerson)
AbstractPerson

julia> ConcretePerson(15, "Luis", 8)
ConcretePerson(15, "Luis", 8)
```

Repeat as required, remembering that subtyping of concrete types is not allowed.

For a more complex hierarchy, create abstract subtypes as needed.

```julia-repl
julia> abstract type AdultPerson <: AbstractPerson end

julia> supertype(AdultPerson)
AbstractPerson
```

The value of such a hierarchy will become clearer when we reach the `Multiple Dispatch` Concept, and see how functions handle argument types.

## Instructions

You have been tasked by the claims department of Isaac's Asteroid Exploration Co. to improve the performance of their land claim system.

Every time an asteroid is ready for exploitation speculators are invited to stake their claim to a plot of land.
The asteroid's land is divided into non-overlapping rectangular plots.
Dimensions differ, but all have sides parallel to the coordinate axes.
Speculators claim one of the plots of land by specifying its coordinates.

Your goal is to develop a performant system to handle the land rush that has in the past caused the website to crash.

The unit of measure is 100 meters but can be ignored in these tasks.

## 1. Define a Point

Define a `struct` to hold `x` and `y` coordinates.
These are fairly small non-negative integers, so use the type `UInt16`.

```julia-repl
julia> Coord(7, 3)
Coord(0x0007, 0x0003)  # unsigned integers display in hex format by default
```

## 2. Define a Plot

Because all plots must be rectangular, with horizontal and vertical sides, only two opposite corners are needed to define them.

Implement the `Plot` struct, taking two Coord structs in its constructor.

`Plot` should be a keyword struct, with fields `bottom_left` and `top_right`.

```julia-repl
julia> plot = Plot(bottom_left=Coord(10, 1), top_right=Coord(20, 2))
Plot(Coord(0x000a, 0x0001), Coord(0x0014, 0x0002))

julia> plot.top_right
Coord(0x0014, 0x0002)
```

## 3. Check whether your claim has already been filed

There is competition for these claims, so before your claim is allowed it will be checked against existing claims in the register.

Implement the `is_claim_staked()` function to determine whether a claim has already been staked.

```julia-repl
julia> claim = Plot(bottom_left=Coord(10, 1), top_right=Coord(20, 2));
julia> register = Set{Plot}();
julia> is_claim_staked(claim, register)
false
```

## 4. Speculators can stake their claim by specifying a plot identified by its corner coordinates

Implement the `stake_claim!()` mutating function to allow a claim to be registered.

If the same claim has already been staked, return `false`.

If a new claim is possible, add it to the register and return `true`.

```julia_repl
julia> claim = Plot(bottom_left=Coord(10, 1), top_right=Coord(20, 2));
julia> register = Set{Plot}();
julia> stake_claim!(claim, register)
true
```

## 5. Find the length of a plot's longer side.

Implement the `get_longest_side()` function to get the longer side (horizontal or vertical) of a claim.

```julia-repl
claim = Plot(bottom_left=Coord(10, 1), top_right=Coord(20, 2));

julia> get_longest_side(claim)
0x000a
```

## 6. Find the plot claimed that has the longest side, for research purposes

Implement the `get_claim_with_longest_side()` function to examine all registered claims and return the claim(s) with the longest side.

```julia-repl
julia> plot1 = Plot(bottom_left=Coord(5, 3), top_right=Coord(10, 5));
julia> plot2 = Plot(bottom_left=Coord(0, 0), top_right=Coord(3, 3));
julia> register = Set{Plot}([plot1, plot2]);

julia> get_claim_with_longest_side(register)
Plot(Coord(0x0005, 0x0003), Coord(0x000a, 0x0005))
```

Return the Plot(s) as a `Set`, with one element if there is a single longest plot, multiple in the event of a tie.

## Source

### Created by

- @colinleach