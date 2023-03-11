# Elyse's Enchantments

Welcome to Elyse's Enchantments on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Vectors

<!-- TODO Write intro -->

### Terminology

`Vector{T}` is an alias for one-dimensional arrays `Array{T, 1}`.

## Pairs

A `Pair` is a data structure that contains exactly two elements accessible through the fields `first` and `second`.

They can be constructed using `x => y`:

```julia
julia> p = 3 => true
3 => true

julia> p.first
3

julia> p.second
true
```

The elements of a `Pair` may be of different type:

```julia
julia> typeof(p)
Pair{Int64,Bool}
```

`Pair`s have two common uses in Julia: dictionaries and replacements.

### Dictionaries

Dictionaries can be constructed from a collection of pairs.
This will be covered in a later exercise.

<!-- TODO: Add link or widget to exercise. -->

### Replacements

Many replacement methods take a `Pair` as argument to make it clear which element is being replaced.
This allows syntax like

```julia
julia> replace!([1, 3, 4, 1], 4 => 0)
4-element Array{Int64,1}:
 1
 3
 0
 1
```

where each `4` in the collection is replaced by `0`, instead of the less clear syntax

```julia
replace!([1, 3, 4, 1], 4, 0) # this method doesn't exist
```

## Instructions

As a magician-to-be, Elyse needs to practice some basics.
She has a deck of cards that she wants to manipulate.

To make things a bit easier she only uses the cards 1 to 10.

## 1. Retrieve a card from a deck

Return the card at position `idx` from the given deck.

```julia
julia> idx = 2;

julia> card([1, 3, 4, 1], idx)
3
```

## 2. Exchange a card in the deck

Exchange the card at position `idx` with the new card provided and return the adjusted deck.
Note that this will mutate (change) the input vector and this is okay.

```julia
julia> idx = 2; new_card = 6;

julia> replace_card!([1, 3, 4, 1], idx => new_card)
[1, 6, 4, 1]
```

## 3. Insert a card at the of top the deck

Insert new card at the top of the deck and return the deck.

```julia
julia> new_card = 8;

julia> insert_card_at_top!([1, 3, 4, 1], new_card)
[1, 3, 4, 1, 8]
```

## 4. Remove a card from the deck

Remove the card at position `idx` from the deck and return the deck.

```julia
julia> idx = 2;

julia> remove_card!([1, 3, 4, 1], idx)
[1, 4, 1]
```

## 5. Remove the top card from the deck

Remove the card at the top of the deck and return the deck.

```julia
julia> remove_card_from_top!([1, 3, 4, 1])
[1, 3, 4]
```

## 6. Insert a card at the bottom of the deck

Insert a new card at the bottom of the deck and return the deck.

```julia
julia> new_card = 8;

julia> insert_card_at_bottom!([1, 3, 4, 1], new_card)
[8, 1, 3, 4, 1]
```

## 7. Remove a card from the bottom of the deck

Remove the card at the bottom of the deck and return the deck.

```julia
julia> remove_card_at_bottom!([1, 3, 4, 1])
[3, 4, 1]
```

## 8. Check size of the deck

Check whether the size of the deck equals a given `deck_size` or not.

```julia
julia> deck_size = 4;

julia> check_deck_size([1, 3, 4, 1], deck_size)
true

julia> check_deck_size([1, 3, 4, 1, 5], deck_size)
false
```

## Source

### Created by

- @SaschaMann

### Contributed to by

- @cmcaine