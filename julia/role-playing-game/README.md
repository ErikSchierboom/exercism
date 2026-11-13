# Role Playing Game

Welcome to Role Playing Game on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

We saw in previous Concepts that types in Julia form a hierarchy, with `Any` at the top.

Abstract types such as `Number` have subtypes, but cannot themselves be instantiated.
Setting a variable to an abstract type _constrains_ values of the variable to be any subtype of the abstract type.
For example:

```julia-repl
julia> x::Number = 3
3
julia> typeof(x)  # one subtype of Number
Int64
julia> x = 4.2
4.2
julia> typeof(x) # another subtype of Number
Float64
julia> x = "fail" # not a number type!
ERROR: MethodError: Cannot `convert` an object of type String to an object of type Number
```

This gives us one type of flexibility in constraining which inputs are valid.

However, suppose we want a variable to accept both integer and string values?
These types are not in the same branch of the hierarchy.

We could set the type to `Any`, or let it default to that, but then we lose all control of the allowed types.

For a better approach, we have the `Union{ }` syntax, with two or more types listed inside the braces.

```julia-repl
julia> y::Union{Integer, String} = 4
4
julia> typeof(y)
Int64
julia> y = "works"
"works"
julia> typeof(y)
String
julia> y = 5.3
ERROR: MethodError: Cannot `convert` an object of type
  Float64 to an object of type
  Union{Integer, String}
```

Another example uses the same type union in a function signature:

```julia-repl
julia> IntOrString = Union{Integer, String}
Union{Integer, String}
julia> f(z::IntOrString) = z^3
f (generic function with 1 method)
julia> f(2) # integers are cubed
8
julia> f("ab") # strings are repeated 3 times
"ababab"
```

Here, we gave the type a name, which can provide convenient shorthand but is not strictly necessary.
The function `g(z::Union{Integer, String}) = z^3` behaves the same way.

There will be much more to say about function signatures in the Multiple Dispatch Concept.

## Unions with nothing

Several other languages have types that may or may not contain a value, with names such as `Option`, `Nullable` or `Maybe`.

Julia has no specific syntax for this, but type unions are a generalization of the same idea.

We saw in the `Nothingness` Concept that Julia has various ways to represent non-values, including `nothing` and `missing`.
Either of these can be included in a type union.

For example, in defining some sort of linked list, we need a way to terminate the list if there are no further nodes.
`Nothing` is the type with singleton value `nothing`, and this Node definition makes it possible to signal the end of the chain:

```julia-repl
julia> struct Node
           value::Any
           next::Union{Node, Nothing}
       end
```

Similarly, `missing` can be used as a placeholder for absent values, especially in collections such as vectors.
The example below is very contrived, but missing values are common in real-world data sets.

```julia-repl
julia> q(x::Real) = x >= 0 ? sqrt(x) : missing  # skip negative values
q (generic function with 1 method)
julia> vals::Vector{Union{Real, Missing}} = q.([4, 3.1, -1, 0])
4-element Vector{Union{Missing, Float64}}:
 2.0
 1.760681686165901
  missing
 0.0
```

## Instructions

Josh is working on a new role-playing game and needs your help implementing some of the mechanics.

## 1. Define type unions

Define a type union of `String` and `Missing` named `StringOrMissing` which can be used in later code.
Define a type union of `Int64` and `Nothing` named `IntOrNothing` which can be used in later code.

## 2. Implement the Player composite type

The Player composite type should contain four fields, each having a type annotation and a default value:
- The `name` is a `StringOrMissing`, with a default of `missing`
- The `level` is an `Int64`, with a default of `0`
- The `health` is an `Int64`, with a default of `100`
- The `mana` is an `IntOrNothing`, with a default of `nothing`

```julia-repl
julia> defaultplayer = Player()
Player(missing, 0, 100, nothing)

julia> wealthyplayer = Player(mana=100)
Player(missing, 0, 100, 100)

julia> namedplayer = Player(name="Guilian", level=10)
Player("Guilian", 10, 100, nothing)
```

## 3. Introduce yourself

Implement the `introduce` function.

Stealthy players may be hiding their name and will be introduced as `"Mighty Magician"`.
Otherwise, just use the player's name to introduce them.

```julia-repl
julia> introduce(Player(level=2, health=8))
"Mighty Magician"

julia> introduce(Player(name="Merlin", level=2, health=8))
"Merlin"
```

## 4. Implement increment methods

The `increment` helper function has two methods, each with a different function signature.
The argument of each needs a type annotation to make the signature explicit.

The `increment` method for names should take a player's `name`.
- If the name is `missing` return the title "The Great".
- Otherwise the title " the Great" is added onto the name.

This `increment` method returns the new name.

```julia-repl
julia> player1 = Player(name="Ogre", level=5, health=49, mana=26)
Player("Ogre", 5, 49, 26)

julia> increment(player1.name)
"Ogre the Great"

julia> player2 = Player(level=32, mana=57)
Player(missing, 32, 100, 57)

julia> increment(player2.name)
"The Great"
```

The `increment` method for mana should take a player's `mana`.
- If the player's mana is `nothing`, return a value of `50`.
- Otherwise the mana should be increased by `100`.

This `increment` method returns the updated mana.

```julia-repl
julia> player3 = Player(level=3)
Player(missing, 3, 100, nothing)

julia> increment(player3.mana)
50

julia> player4 = Player("Goblin", level=15, health=49, mana=26)
Player("Goblin", 5, 49, 26)

julia> increment(player4.mana)
126
```

## 5. Implement the title function

The highest level in the game is `42`.  To recognize the accomplishment of players who achieve this level, a title is attached to their names.  The `title!` function updates a player's name as follows.

- If the player's level is 42, the name is updated using the `increment` function.
- Otherwise, the name remains unchanged.

In either case, the `title!` function returns the player's name.

```julia-repl
julia> player1 = Player(level=42, health=12)
Player(missing, 42, 12, nothing)

julia> title!(player1)
"The Great"

julia> player1.name
"The Great"

julia> player2 = Player(name="Svengali", level=42, health=36, mana=54)
Player("Svengali", 42, 36, 54)

julia> title!(player2)
"Svengali the Great"

julia> player2.name
"Svengali the Great"

julia> player3 = Player(name="Rasputin", level=21, health=100, mana=54)
Player("Rasputin", 21, 100, 54)

julia> title!(player3)
"Rasputin"

julia> player3.name
"Rasputin"
```

## 6. Implement the revive function

The `revive!` function should check that the player's character is indeed dead (their health has reached `0`).

If the player is dead:
- The player should be revived with `100` health.
- The player's mana should be incremented using the `increment` function.

If the player is alive, nothing happens to the player.

The `revive!` function should return the player.

```julia-repl
julia> deadplayer1 = Player(level=2, health=0)
Player(missing, 2, 0, nothing)

julia> revive!(deadplayer1)
Player(missing, 2, 100, 50)

julia> deadplayer2 = Player(level=12, health=0, mana=5)
Player(missing, 12, 0, 5)

julia> revive!(deadplayer2)
Player(missing, 12, 100, 105)

julia> aliveplayer = Player(level=23, health=1)
Player(missing, 23, 1, nothing)

julia> revive!(aliveplayer)
Player(missing, 23, 1, nothing)
```

## Source

### Created by

- @colinleach
- @depial