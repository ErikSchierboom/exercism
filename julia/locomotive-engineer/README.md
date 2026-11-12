# Locomotive Engineer

Welcome to Locomotive Engineer on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The [`Basics`][basics] Concept introduced two ways to define a function.

Most generally, the multiline form:

```julia
function muladd(x, y, z)
    x * y + z
end
```

The "assignment", or "single-line" form for short definitions:
```julia
muladd(x, y, z) = x * y + z
```

In a third and even shorter form, a short, single-use function can be created without a name:

```julia-repl
julia> map(x -> 2x, 1:3)
3-element Vector{Int64}:
 2
 4
 6

julia> map((x, y) -> x * y, 1:3, 4:6)
3-element Vector{Int64}:
  4
 10
 18
```

In this case, `x -> 2x` is an "anonymous function".
This is equivalent to what some other languages call a "lambda function".

Note that multiple arguments need parentheses, as in `(x, y) -> x * y`.

Anonymous functions are common in Julia code, especially when combined with higher-order functions such as `map()` and `filter()` (which will be covered in more detail in a later concept).

```julia-repl
julia> map(x -> x^4, [1, 2, 3])
3-element Vector{Int64}:
  1
 16
 81
```

## Function arguments

So far in the syllabus, we have only looked at functions which have a precise number of arguments, and require function calls to supply all of them, in the correct order.
This would be limiting and inconvenient, so there are several other options.

### Optional arguments

Like many languages, Julia allows function definitions to supply default values for individual arguments.

A function call can then either supply a value for that argument, or omit it and rely on the default.

```julia-repl
julia> f(x, y=10) = x * y
f (generic function with 2 methods)

julia> f(2, 3)
6

julia> f(2)
20
```

All arguments _without_ defaults must come before any arguments _with_ defaults, meaning that `f(x=2, y)` would be invalid.

### Keyword arguments

All the examples so far use `positional arguments`, where values supplied in a function call must match the order of the corresponding arguments in the function definition.

Like many languages, Julia also allows `keyword arguments`.
Function calls must specify the argument name, but multiple keyword arguments can then be specified in any order.

A distinctive feature of Julia is that the keyword arguments (if any) in the function definition must be preceded by a semicolon `;` to separate them from any positional arguments.
A function call can use either `;` or `,` between the last positional argument and the first keyword argument.

```julia-repl
julia> b(x; y) = x + y
b (generic function with 1 method)

julia> b(2, y=3)
5

# keyword is required when calling
julia> b(2, 3)
ERROR: MethodError: no method matching b(::Int64, ::Int64)
The function `b` exists, but no method is defined for this combination of argument types.
```

Default values can optionally be specified, exactly as for positional arguments.

It is common to end up with syntax like `myarg=myarg` within a function call, when a variable with the same name as the parameter was pre-calculated.
A shorthand syntax is allowed in this situation:

```julia-repl
julia> width = 4.0
4.0

julia> height = √ width
2.0

julia> area(; width, height) = width * height
area (generic function with 1 method)

# repetition
julia> area(; width=width, height=height)
8.0

# shorthand form
julia> area(; width, height)
8.0
```

### Splat and slurp

These are the standard names for a useful aspect of Julia syntax, in case you wondered.
Both refer to the `...` operator.

#### Splat

Splatting is used in function _calls_, to expand collections into individual values required by the function.

This may be easier to demonstrate than to explain:

```julia-repl
julia> fxyz(x, y, z) = x * y * z
fxyz (generic function with 1 method)

julia> xyz = [2, 3, 4]
3-element Vector{Int64}:
 2
 3
 4

# Using the vector directly in a function call is invalid
julia> fxyz(xyz)
ERROR: MethodError: no method matching fxyz(::Vector{Int64})
The function `fxyz` exists, but no method is defined for this combination of argument types.

# splatting converts the vector to 3 numbers, used as positional arguments
julia> fxyz(xyz...)
24
```

Some "function calls" are hidden by syntactic sugar, so splatting can also be used in less obvious ways.

For example, multiple assignment uses a tuple constructor function internally:

```julia-repl
julia> first, rest... = [1, 2, 3, 4]
3-element Vector{Int64}:
 1
 2
 3
 4

julia> first
1

julia> rest
3-element Vector{Int64}:
 2
 3
 4
```

Keyword arguments can also be supplied by splatting, typically using a `named tuple`.
A `Dict` will also work, but the keys must be symbols (strings will not work).

```julia-repl
# function with 3 keyword arguments
julia> fabc(; a, b, c) = a + b + c
fabc (generic function with 1 method)

# named tuple
julia> abc_nt = (a=2, b=3, c=4)
(a = 2, b = 3, c = 4)

# there are no positional arguments, so need to use ; before kw argument
julia> fabc(;abc_nt...)
9

# Dict
julia> abc_dict = Dict(:a=>2, :b=>3, :c=>4)
Dict{Symbol, Int64} with 3 entries:
  :a => 2
  :b => 3
  :c => 4

julia> fabc(;abc_dict...)
9
```

#### Slurp

Slurping is used in the function _definition_, to pack an arbitrary number of individual values into a collection.

```julia-repl
julia> f_more(i, j, more...) = i + j + sum(more)
f_more (generic function with 1 method)

julia> f_more(1, 3, 5, 7, 9, 11)
36
```

The name of the slurped argument (in this case `more`) is not significant.
The type of this variable is chosen by the compiler, but for positional arguments is likely to be `tuple` or something similar.

Keyword arguments can also be slurped, giving a `Dict` (or similar).

```julia-repl
julia> f_kwslurp(x, y; switches...) = :mult in keys(switches) ? x * y : x + y
f_kwslurp (generic function with 1 method)

julia> f_kwslurp(5, 6; mult=true)
30

julia> f_kwslurp(5, 6)
11
```

Any keyword arguments can be used in the call.
It is for the function definition to decide which keywords to respond to and which to ignore.


[basics]: https://exercism.org/tracks/julia/concepts/basics

## Instructions

Your friend Linus is a Locomotive Engineer who drives cargo trains between cities.
Although he is amazing at handling trains, he is not amazing at handling logistics or computers.
He would like to enlist your programming help organizing train details and correcting mistakes in route data.

~~~~exercism/note
This exercise could easily be solved using slicing, indexing, and various `Dict` methods.
However, we would like you to practice packing (i.e. slurping), unpacking (i.e. splatting), and multiple assignment in solving each of the tasks below.
~~~~

## 1. Create a vector of all wagons

Your friend has been keeping track of each wagon identifier (ID), but he is never sure how many wagons the system is going to have to process at any given time. It would be much easier for the rest of the logistics program to have this data packaged into a unified `Vector`.

Implement a function `get_vector_of_wagons(args...)` that accepts an arbitrary number of wagon IDs.
Each ID will be a positive integer.
The function should then `return` the given IDs as a single `Vector`.

```julia-repl
julia> get_vector_of_wagons(1, 7, 12, 3, 14, 8, 5)
7-element Vector{Int64}:
  1
  7
 12
  3
 14
  8
  5
```

## 2. Fix the vector of wagons

At this point, you are starting to get a feel for the data and how it's used in the logistics program.
The ID system always assigns the locomotive an ID of **1**, with the remainder of the wagons in the train assigned a randomly chosen ID greater than **1**.

Your friend had to connect two new wagons to the train and forgot to update the system!
Now, the first two wagons in the train `Vector` have to be moved to the end, or everything will be out of order.

To make matters more complicated, your friend just uncovered a second `Vector` that appears to contain missing wagon IDs.
All they can remember is that once the new wagons are moved, the IDs from this second `Vector` should be placed directly after the designated locomotive.

Linus would be really grateful to you for fixing their mistakes and consolidating the data.

Implement a function `fix_vector_of_wagons(each_wagons_id, missing_wagons)` that takes two `Vectors` containing wagon IDs.
It should reposition the first two items of the first `Vector` to the end, and insert the values from the second `Vector` behind (_on the right hand side of_) the locomotive ID (**1**).
The function should then `return` a `Vector` with the modifications.

```julia-repl
julia> fix_vector_of_wagons([2, 5, 1, 7, 4, 12, 6, 3, 13], [3, 17, 6, 15])
13-element Vector{Int64}:
  1
  3
 17
  6
 15
  7
  4
 12
  6
  3
 13
  2
  5
```

## 3. Add missing stops

Now that all the wagon data is correct, Linus would like you to update the system's routing information.
Along a transport route, a train might make stops at a few different stations to pick up and/or drop off cargo.
Each journey could have a different number of these intermediary delivery points.
Your friend would like you to update the system's routing `Dict` with any missing/additional delivery information.

Implement a function `add_missing_stops(route, stops...)` that accepts a routing `Dict` followed by a variable number of `stop_number => city` Pairs.
Your function should then return the routing `Dict` updated with an additional `key` that holds a `Vector` of all the added stops in order.

```julia-repl
julia> add_missing_stops(Dict("from" => "New York", "to" => "Miami"), :stop_1 => "Washington, DC", :stop_2 => "Charlotte", :stop_3 => "Atlanta", :stop_4 => "Jacksonville")
Dict{String, Any} with 3 entries:
  "stops" => ["Washington, DC", "Charlotte", "Atlanta", "Jacksonville"]
  "to"    => "Miami"
  "from"  => "New York"
```

## 4. Extend routing information

Linus has been working on the routing program and has noticed that certain routes are missing some important details.
Initial route information has been constructed as a `Dict` and your friend would like you to update that `Dict` with whatever might be missing.
Every route in the system requires slightly different details, so Linus would really prefer a generic solution.

Implement a function called `extend_route_information(route; more_route_information...)` that accepts a `Dict` which contains the origin and destination cities the train route runs between, plus a variable number of keyword arguments containing routing details such as train speed, length, or temperature.
The function should return a consolidated `Dict` with all routing information.

```julia-repl
julia> extend_route_information(Dict("from" => "Berlin", "to" => "Hamburg"); length = "100", speed = "50")
Dict{Any, String} with 4 entries:
  :speed  => "50"
  "to"    => "Hamburg"
  "from"  => "Berlin"
  :length => "100"


julia> extend_route_information(Dict("from" => "Paris", "to" => "London"), length = "15", temperature = "20", timeOfArrival = "10:30")
Dict{Any, String} with 5 entries:
  :temperature   => "20"
  :timeOfArrival => "10:30"
  "to"           => "London"
  "from"         => "Paris"
  :length        => "15"
```

## Source

### Created by

- @colinleach