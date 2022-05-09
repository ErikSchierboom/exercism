# Bread And Potions

Welcome to Bread And Potions on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Protocols

Protocols are a mechanism to achieve polymorphism in Elixir when you want behavior to vary depending on the data type.

Protocols are defined using `defprotocol` and contain one or more function headers.

```elixir
defprotocol Reversible do
  def reverse(term)
end
```

Protocols can be implemented using `defimpl`.

```elixir
defimpl Reversible, for: List do
  def reverse(term) do
    Enum.reverse(term)
  end
end
```

A protocol can be implemented for any existing Elixir data type or for a struct.

When a protocol function is invoked, the appropriate implementation gets automatically chosen based on the type of the first argument.

## Instructions

You're developing your own role-playing video game. In your game, there are _characters_ and _items_. One of the many actions that you can do with an item is to make a character eat it.

Not all items are edible, and not all edible items have the same effects on the character. Some items, when eaten, turn into a different item (e.g. if you eat an apple, you are left with an apple core).

To allow for all that flexibility, you decided to create an `Edible` protocol that some of the items can implement.

## 1. Define edibility

Create the `RPG.Edible` protocol. The protocol has one function - `eat`. The `eat` function accepts an item and a character and returns a by-product and a character.

## 2. Make loaves of bread edible

Implement the `RPG.Edible` protocol for the `RPG.LoafOfBread` item. When eaten, a loaf of bread gives the character 5 health points and has no by-product.

```elixir
RPG.Edible.eat(%RPG.LoafOfBread{}, %RPG.Character{health: 31})
# => {nil, %RPG.Character{health: 36, mana: 0}}
```

## 3. Make mana potions edible

Implement the `RPG.Edible` protocol for the `RPG.ManaPotion` item. When eaten, a mana potion gives the character as many mana points as the potion's strength, and produces an empty bottle.

```elixir
RPG.Edible.eat(%RPG.ManaPotion{strength: 13}, %RPG.Character{mana: 50})
# => {%RPG.EmptyBottle{}, %RPG.Character{health: 100, mana: 63}}
```

## 4. Make poisons edible

Implement the `RPG.Edible` protocol for the `RPG.Poison` item. When eaten, a poison takes away all the health points from the character, and produces an empty bottle.

```elixir
RPG.Edible.eat(%RPG.Poison{}, %RPG.Character{health: 3000})
# => {%RPG.EmptyBottle{}, %RPG.Character{health: 0, mana: 0}}
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw