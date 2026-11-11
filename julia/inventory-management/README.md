# Inventory Management

Welcome to Inventory Management on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Pairs

A `Pair` is just two items joined together.
The items are then imaginatively called `first` and `second`.

Create them either with the `=>` operator or the `Pair()` constructor.

```julia-repl
julia> p1 = "k" => 2
"k" => 2

julia> p2 = Pair("k", 2)
"k" => 2

# Both forms of syntax give the same result
julia> p1 == p2
true

# Each component has its own separate type
julia> dump(p1)
Pair{String, Int64}
  first: String "k"
  second: Int64 2

# Get a component using dot syntax
julia> p1.first
"k"

julia> p1.second
2
```

## Dicts

A `Vector` of Pairs is like any other array: ordered, homogeneous in type, and stored consecutively in memory.

```julia-repl
julia> pv = ['a' => 1, 'b' => 2, 'c' => 3]
3-element Vector{Pair{Char, Int64}}:
 'a' => 1
 'b' => 2
 'c' => 3

# Each pair is a single entry
julia> length(pv)
3
```

A `Dict` is superficially similar, but storage is now implemented in a way that allows fast retrieval by key, even when the number of entries grows large.

```julia-repl
julia> pd = Dict('a' => 1, 'b' => 2, 'c' => 3)
Dict{Char, Int64} with 3 entries:
  'a' => 1
  'c' => 3
  'b' => 2

julia> pd['b']
2

# Key must exist
julia> pd['d']
ERROR: KeyError: key 'd' not found

# Generators are accepted in the constructor (and note the unordered output)
julia> Dict(x => 1 / x for x in 1:5)
Dict{Int64, Float64} with 5 entries:
  5 => 0.2
  4 => 0.25
  2 => 0.5
  3 => 0.333333
  1 => 1.0
```

In other languages, something very similar to a `Dict` might be called a dictionary (Python), a Hash (Ruby) or a HashMap (Java).

For Pairs, whether in isolation or in a Vector, there are few constraints on the type of each component.

To be valid in a `Dict`, the `Pair` must be a `key => value` pair, where the `key` is "hashable".
Most importantly, this means the `key` must be _immutable_, so `Char`, `Int`, `String`, `Symbol`, and `Tuple` are all fine, but `Vector` is not allowed.

### Modifying a Dict

Entries can be added, with a new key, or overwritten, with an existing key.

```julia-repl
julia> pd
Dict{Char, Int64} with 3 entries:
  'a' => 1
  'c' => 3
  'b' => 2

# Add
julia> pd['d'] = 4
4

# Overwrite
julia> pd['a'] = 42
42

julia> pd
Dict{Char, Int64} with 4 entries:
  'a' => 42
  'c' => 3
  'd' => 4
  'b' => 2
```

To remove an entry, use the `delete!()` function, which will change the Dict if the key exists and silently do nothing otherwise.

```julia-repl
julia> delete!(pd, 'd')
Dict{Char, Int64} with 3 entries:
  'a' => 42
  'c' => 3
  'b' => 2
```

### Checking if a key or value exists

There are different approaches.
To check a key, there is a `haskey()` function:

```julia-repl
julia> haskey(pd, 'b')
true
```

Alternatively, search either the keys or the values:

```julia-repl
julia> 'b' in keys(pd)
true

julia> 43 in values(pd)
false

julia> 42 ∈ values(pd)
true
```

## Instructions

In this exercise, you will be managing an inventory system.

The inventory should be organized by the item name and it should keep track of the number of items available.

You will have to handle adding items to an inventory.
Each time an item appears in a given vector, the item's quantity should be increased by `1` in the inventory.
You will also have to handle deleting items from an inventory by decreasing quantities by `1` when requested.

Finally, you will need to implement a function that will return all the key-value pairs in a given inventory as a `vector` of `pair`s.

~~~~exercism/note
The tests in this exercise are mutation agnostic, but the function names indicate they should be non-mutating.
If you would like to use functions from the introduction while not mutating the input, the function `copy()` will be helpful.
~~~~

## 1. Create an inventory based on a vector

Implement the `create_inventory(<input vector>)` function that creates an "inventory" from an input vector of items.
It should return a `dict` containing each item name paired with their respective quantity.

```julia-repl
julia> create_inventory(["coal", "wood", "wood", "diamond", "diamond", "diamond"])
Dict("coal" => 1, "wood" => 2, "diamond" => 3)
```

## 2. Add items from a vector to an existing dictionary

Implement the `add_items(<inventory dict>, <item vector>)` function that adds a vector of items to the passed-in inventory:

```julia-repl
julia> add_items(Dict("coal" => 1), ["wood", "iron", "coal", "wood"])
Dict("coal" => 2, "wood" => 2, "iron" => 1)
```

## 3. Decrement items from the inventory

Implement the `decrement_items(<inventory dict>, <items vector>)` function that takes a `vector` of items.
Your function should remove `1` from an item count for each time that item appears on the `vector`:

```julia-repl
julia> decrement_items(Dict("coal" => 3, "diamond" => 1, "iron" => 5), ["diamond", "coal", "iron", "iron"])
Dict("coal" => 2, "diamond" => 0, "iron" => 3)
```

Item counts in the inventory should not be allowed to fall below 0.
If the number of times an item appears on the input `vector` exceeds the count available, the quantity listed for that item should remain at 0.
Additional requests for removing counts should be ignored once the count falls to zero.

```julia-repl
julia> decrement_items(Dict("coal" => 2, "wood" => 1, "diamond" => 2), ["coal", "coal", "wood", "wood", "diamond"])
Dict("coal" => 0, "wood" => 0, "diamond" => 1)
```

## 4. Remove an entry entirely from the inventory

Implement the `remove_item(<inventory dict>, <item>)` function that removes an item and its count entirely from an inventory:

```julia-repl
julia> remove_item!(Dict("coal" => 2, "wood" => 1, "diamond" => 2), "coal")
Dict("wood" => 1, "diamond" => 2)
```

If the item is not found in the inventory, the function should return the original inventory unchanged.

```julia-repl
julia> remove_item(Dict("coal" => 2, "wood" => 1, "diamond" => 2), "gold")
Dict("coal" => 2, "wood" => 1, "diamond" => 2)
```

## 5. Return the entire content of the inventory

Implement the `list_inventory(<inventory dict>)` function that takes an inventory and returns a vector of `(item, quantity)` pairs.

The vector should only include the _available_ items (_with a quantity greater than zero_), and should be sorted in alphabetical order of items:

```julia-repl
julia> list_inventory(Dict("coal" => 7, "wood" => 11, "diamond" => 2, "iron" => 7, "silver" => 0))
["coal" => 7, "diamond" => 2, "iron" => 7, "wood" => 11]
```

## Source

### Created by

- @colinleach