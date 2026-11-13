# Boutique Suggestions

Welcome to Boutique Suggestions on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Anyone who has used Python has almost certainly used list comprehensions, which have been central to Python syntax since early versions.

Something so convenient gradually finds its way into other languages, including Julia.

Comprehensions are an option rather than a necessity for Julia programmers, as there are usually alternatives (broadcasting, higher-order functions, etc.).

However, a comprehension will often provide a simple, readable and performant way to construct an array.
Use is ultimately a matter of personal taste, and how you feel about Python versus functional languages.

The syntax is mostly a direct copy of Python, but with extensions for higher-dimensional arrays.

## Single variable

Very Pythonic, including the optional `if` clause.

```julia-repl
julia> [x^2 for x in 1:3]
3-element Vector{Int64}:
 1
 4
 9
julia> [x^2 for x in 1:3 if isodd(x^2)]
2-element Vector{Int64}:
 1
 9
```

Output shape depends on the details of the comprehension: typically the same as the input collection in simple cases, but flattened to a Vector by an `if` clause.

```julia-repl
julia> m
2×3 Matrix{Int64}:
 1  2  3
 4  5  6
julia> [x^2 for x in m]
2×3 Matrix{Int64}:
  1   4   9
 16  25  36
julia> [x^2 for x in m if isodd(x^2)]
3-element Vector{Int64}:
  1
 25
  9
```

## Multi-variable, Vector output

Like Python, we can have multiple `for` clauses with different variables, with the same or different input collections.

```julia-repl
julia> [x * y for x in 1:3 for y in 4:6]
9-element Vector{Int64}:
  4
  5
  6
  8
 10
 12
 12
 15
 18
julia> [x * y for x in 1:3 for y in 4:6 if isodd(x * y)]
2-element Vector{Int64}:
  5
 15
```

This is equivalent to nested loops.
The output is one-dimensional, even with matrix input.

```julia-repl
julia> m
2×3 Matrix{Int64}:
 1  2  3
 4  5  6
julia> [x*y for x in m for y in m]
36-element Vector{Int64}:
  1
  4
  2
  5
(truncated output...)
```

## Multi-variable, multi-dimensional output

The previous section described multiple `for` clauses separated only by spaces.

In this section, there is a single `for` and the variables are comma-separated.

```julia-repl
julia> [(x, y) for x in 1:3, y in 4:6]
3×3 Matrix{Tuple{Int64, Int64}}:
 (1, 4)  (1, 5)  (1, 6)
 (2, 4)  (2, 5)  (2, 6)
 (3, 4)  (3, 5)  (3, 6)
```

Each variable in the comprehension creates a new dimension in the output, with an entry for each possible combination of the variables.

In the example above, `x` increases down the rows, `y` increases across the columns.
Higher dimensions are possible, with the usual warnings about readability of the output.

## Generator expressions

The previous sections have concentrated on array output, with the comprehension placed inside brackets `[ ... ]`.

When the brackets are replaced by parentheses `( ... )` something different happens: we get a `generator expression`: a lazily-evaluated iterator which can yield the next value on demand.

```julia-repl
julia> g = ((x, y) for x in 1:3, y in 4:6)
Base.Generator{Base.Iterators.ProductIterator{Tuple{UnitRange{Int64}, UnitRange{Int64}}}, var"#9#10"}(var"#9#10"(), Base.Iterators.ProductIterator{Tuple{UnitRange{Int64}, UnitRange{Int64}}}((1:3, 4:6)))
# Indexing fails with a generator, the entries don't exist yet
julia> g[1, 2]
ERROR: MethodError: no method matching getindex(::Base.Generator{Base.Iterators.ProductIterator{Tuple{UnitRange{…}, UnitRange{…}}}, var"#9#10"}, ::Int64, ::Int64)
# conversion to array
julia> collect(g)
3×3 Matrix{Tuple{Int64, Int64}}:
 (1, 4)  (1, 5)  (1, 6)
 (2, 4)  (2, 5)  (2, 6)
 (3, 4)  (3, 5)  (3, 6)
# generators are mainly designed for iteration
julia> [i * j for (i, j) in g]
3×3 Matrix{Int64}:
  4   5   6
  8  10  12
 12  15  18
```

When the result of a comprehension is immediately used for further processing, a generator can be memory-efficient, avoiding the need to store a large intermediate array.

A generator used as a function argument does not need additional parentheses.

```julia-repl
# inefficient
julia> v = [x^2 for x in 1:1e6];
julia> sum(v)
3.333338333335e17
# better - use a generator
julia> sum(x^2 for x in 1:1e6)
3.3333383333312755e17
```

Generator syntax is identical to comprehensions, other than the surrounding brackets.

Generators can also be convenient in dictionary constructors.

```julia-repl
julia> Dict(x => x^2 for x in 1:5)
Dict{Int64, Int64} with 5 entries:
  5 => 25
  4 => 16
  2 => 4
  3 => 9
  1 => 1
```

## Instructions

You work at an online fashion boutique store.
You come up with the idea for a website feature where outfits are suggested to the user.
Of interest are the potential outfits, their prices and eliminating clashing options.

~~~~exercism/note
While there may be different ways to solve the following problems, all can be solved with a comprehension.
~~~~

## 1. Create clothing item


Implement `clothingitem()` to take two `Tuple`s, one of `categories` and the other of their respective `qualities`.
The function should return a `Dict` with the `categories` as keys and `qualities` as values.

```julia-repl
julia> categories = ("item_name", "price", "color", "base_color");

julia> qualities = ("Descriptive Name", 99.00, "Ochre Red", "red");

julia> clothingitem(categories, qualities)
Dict{String, Any} with 4 entries:
  "price"      => 99.0
  "item_name"  => "Descriptive Name"
  "base_color" => "red"
  "color"      => "Ochre Red"
```

Your function should be able to handle any number of `categories`.

## 2. Suggest combinations

Implement `get_combinations()` to take a `Tuple` of tops and a `Tuple` of bottoms.
The function should return the `cartesian product` of the tuples as a 2-D array (i.e. `Matrix`).
Each entry is a `(top, bottom)` combination as a `Tuple`.
Tops change down the rows, bottoms change across the columns.

```julia-repl
julia> tops = (
        Dict("item_name" => "Dress shirt"),
        Dict("item_name" => "Casual shirt")
        );

julia> bottoms = (
        Dict("item_name" => "Jeans"),
        Dict("item_name" => "Dress trousers")
       );

julia> get_combinations(tops, bottoms)
2×2 Matrix{Tuple{Dict{String, String}, Dict{String, String}}}:
 (Dict("item_name"=>"Dress shirt"), Dict("item_name"=>"Jeans"))   (Dict("item_name"=>"Dress shirt"), Dict("item_name"=>"Dress trousers"))
 (Dict("item_name"=>"Casual shirt"), Dict("item_name"=>"Jeans"))  (Dict("item_name"=>"Casual shirt"), Dict("item_name"=>"Dress trousers"))
```

## 3. Add up outfit prices

Each piece of clothing has a `price` field associated with it, so it could be helpful to be able to compare the full price of outfits.
Implement `get_prices()` which takes an array of clothing combinations.
The function should return a similarly shaped array with the prices of the outfits in their respective positions.

```julia-repl
julia> tops = (
        Dict("item_name" => "Dress shirt", "base_color" => "blue", "price" => 35),
        Dict("item_name" => "Casual shirt", "base_color" => "black", "price" => 20)
       );

julia> bottoms = (
        Dict("item_name" => "Jeans", "base_color" => "blue", "price" => 30),
        Dict("item_name" => "Dress trousers", "base_color" => "black", "price" => 75)
       );

julia> combomatrix = get_combinations(tops, bottoms);

julia> get_prices(combomatrix)
2×2 Matrix{Int}::
 65  110
 50   95

julia> filteredmatrix = filter_clashing(combomatrix)
1-element Vector{Tuple{Dict{String, Any}, Dict{String, Any}}}:
 (Dict("price" => 20, "item_name" => "Casual shirt", "base_color" => "black"), Dict("price" => 30, "item_name" => "Jeans", "base_color" => "blue"))

julia> get_prices(filteredmatrix)
1-element Vector{Int}:
 50
```

## 4. Filter out clashing outfits

Each piece of clothing has a `base_color` field.
Use this field to remove all combinations where the top and the bottom have the same base color.
Implement `filter_clashing()` to take an array of clothing combinations.
Return a 1-D array (i.e. `Vector`) of the matching combinations.

```julia-repl
julia> tops = (
        Dict("item_name" => "Dress shirt", "base_color" => "blue", "price" => 35),
        Dict("item_name" => "Casual shirt", "base_color" => "black", "price" => 20)
       );

julia> bottoms = (
        Dict("item_name" => "Jeans", "base_color" => "blue", "price" => 30),
        Dict("item_name" => "Dress trousers", "base_color" => "black", "price" => 75)
       );

julia> combos = get_combinations(tops, bottoms);

julia> filter_clashing(combos)
1-element Vector{Tuple{Dict{String, Any}, Dict{String, Any}}}:
 (Dict("price" => 20, "item_name" => "Casual shirt", "base_color" => "black"), Dict("price" => 30, "item_name" => "Jeans", "base_color" => "blue"))
```

## Source

### Created by

- @colinleach