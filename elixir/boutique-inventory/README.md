# Boutique Inventory

Welcome to Boutique Inventory on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Enum

`Enum` is a very useful module that provides a set of algorithms for working with enumerables. It offers sorting, filtering, grouping, counting, searching, finding min/max values, and much more.

In general, an _enumerable_ is any data that can be iterated over, a collection. In Elixir, an enumerable is any data type that implements the `Enumerable` [protocol][exercism-protocols]. The most common of those are [lists][exercism-lists] and [maps][exercism-maps].

Many `Enum` functions accept a function as an argument.

```elixir
Enum.all?([1, 2, 3, 4, 5], fn x -> x > 3 end)
# => false
```

The most common `Enum` functions are `map` and `reduce`.

### `map/2`

`Enum.map/2` allows you to replace every element in an enumerable with another element. The second argument to `Enum.map/2` is a function that accepts the original element and returns its replacement.

### `reduce/3`

`Enum.reduce/3` allows you to _reduce_ the whole enumerable to a single value. To achieve this, a special variable called the _accumulator_ is used. The accumulator carries the intermediate state of the reduction between iterations.

The second argument to `Enum.reduce/3` is the initial value of the accumulator. The third argument is a function that accepts an element and an accumulator, and returns the new value for the accumulator.

### Working with maps

When using maps with `Enum` functions, the map gets automatically converted to a list of 2 `{key, value}` tuples.

To transform it back to a map, use `Enum.into/2`. `Enum.into/2` is a function that transforms an enumerable into a collectable - any data structure implementing the `Collectable` protocol. It can be thought of as the opposite of `Enum.reduce/3`.

`Enum` also has `Enum.into/3`. `Enum.into/3` is a variation of `Enum.into/2` that accepts a transformation function to be applied while transforming the enumerable into a collectable.

#### Mapping maps

Instead of using `Enum.into/3` or `Enum.map/2` plus `Enum.into/1` to apply a transformation (mapping) to a map, we can also use a dedicated `Map.new/2` function. It works exactly like `Enum.into/3` in that it accepts an enumerable and a transformation function, but it always returns a new map instead of letting us choose a collectible.

[exercism-protocols]: https://exercism.org/tracks/elixir/concepts/protocols
[exercism-lists]: https://exercism.org/tracks/elixir/concepts/lists
[exercism-maps]: https://exercism.org/tracks/elixir/concepts/maps

## Instructions

You are running an online fashion boutique. Your big annual sale is coming up, so you need to take stock of your inventory to make sure you're ready.

A single item in the inventory is represented by a map, and the whole inventory is a list of such maps.

```elixir
%{
  name: "White Shirt",
  price: 40,
  quantity_by_size: %{s: 3, m: 7, l: 8, xl: 4}
}
```

## 1. Sort items by price

Implement the `sort_by_price/1` function. It should take the inventory and return it sorted by item price, ascending.

```elixir
BoutiqueInventory.sort_by_price([
  %{price: 65, name: "Maxi Brown Dress", quantity_by_size: %{}},
  %{price: 50, name: "Red Short Skirt", quantity_by_size: %{}},
  %{price: 50, name: "Black Short Skirt", quantity_by_size: %{}},
  %{price: 20, name: "Bamboo Socks Cats", quantity_by_size: %{}}
])
# => [
#      %{price: 20, name: "Bamboo Socks Cats", quantity_by_size: %{}},
#      %{price: 50, name: "Red Short Skirt", quantity_by_size: %{}},
#      %{price: 50, name: "Black Short Skirt", quantity_by_size: %{}},
#      %{price: 65, name: "Maxi Brown Dress", price: 65, quantity_by_size: %{}}
#    ]
```

## 2. Find all items with missing prices

After sorting your inventory by price, you noticed that you must have made a mistake when you were taking stock and forgot to fill out prices for a few items.

Implement the `with_missing_price/1` function. It should take the inventory and return a list of items that do not have prices.

```elixir
BoutiqueInventory.with_missing_price([
  %{price: 40, name: "Black T-shirt", quantity_by_size: %{}},
  %{price: nil, name: "Denim Pants", quantity_by_size: %{}},
  %{price: nil, name: "Denim Skirt", quantity_by_size: %{}},
  %{price: 40, name: "Orange T-shirt", quantity_by_size: %{}}
])
# => [
#      %{price: nil, name: "Denim Pants", quantity_by_size: %{}},
#      %{price: nil, name: "Denim Skirt", quantity_by_size: %{}}
#    ]
```

## 3. Update item names

You noticed that some item names have a word that you don't like to use anymore. Now you need to update all the item names with that word.

Implement the `update_names/3` function. It should take the inventory, the old word that you want to remove, and a new word that you want to use instead. It should return a list of items with updated names.

```elixir
BoutiqueInventory.update_names(
  [
    %{price: 40, name: "Black T-shirt", quantity_by_size: %{}},
    %{price: 70, name: "Denim Pants", quantity_by_size: %{}},
    %{price: 65, name: "Denim Skirt", quantity_by_size: %{}},
    %{price: 40, name: "Orange T-shirt", quantity_by_size: %{}}
  ],
  "T-shirt",
  "Tee"
)
# => [
#      %{price: 40, name: "Black Tee", quantity_by_size: %{}},
#      %{price: 70, name: "Denim Pants", quantity_by_size: %{}},
#      %{price: 65, name: "Denim Skirt", quantity_by_size: %{}},
#      %{price: 40, name: "Orange Tee", quantity_by_size: %{}}
#    ]
```


## 4. Increment the item's quantity

Some items were selling especially well, so you ordered more, in all sizes.

Implement the `increase_quantity/2` function. It should take a single item and a number `n`, and return that item with the quantity for each size increased by `n`.

```elixir
BoutiqueInventory.increase_quantity(
 %{
   name: "Polka Dot Skirt",
   price: 68,
   quantity_by_size: %{s: 3, m: 5, l: 3, xl: 4}
 },
 6
)
# => %{
#      name: "Polka Dot Skirt",
#      price: 68,
#      quantity_by_size: %{l: 9, m: 11, s: 9, xl: 10}
#    }

```

## 5. Calculate the item's total quantity

To know how much space you need in your storage, you need to know how many of each item you have in total.

Implement the `total_quantity/1` function. It should take a single item and return how many pieces you have in total, in any size.

```elixir
BoutiqueInventory.total_quantity(%{
  name: "Red Shirt",
  price: 62,
  quantity_by_size: %{s: 3, m: 6, l: 5, xl: 2}
})
# => 16
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw
- @fmmatheus