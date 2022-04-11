# Boutique Inventory

Welcome to Boutique Inventory on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

## More enumeration methods

In Bird Count, you were introduced to the `count`, `any?`, `select`, `all` and `map` enumeration methods.
Here's a recap of those, with a few extras added:

```ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.count  { |number| number == 1 }   #=> 2
fibonacci.any?   { |number| number > 20 }   #=> false
fibonacci.none?  { |number| number > 20 }   #=> true
fibonacci.select { |number| number.odd? }   #=> [1, 1, 3, 5, 13]
fibonacci.all?   { |number| number < 20 }   #=> true
fibonacci.map    { |number| number * 2  }   #=> [0, 2, 2, 4, 6, 10, 16, 26]
fibonacci.select { |number| number >= 5}    #=> [5, 8, 13]
fibonacci.find   { |number| number >= 5}    #=> 5

# Some methods work with or without a block
fibonacci.sum  #=> 33
fibonacci.sum {| number | number * number }  #=> 273

# There are also methods to help with nested arrays:
animals = [ ['cat', 'bob'], ['horse', 'caris'], ['mouse', 'arya'] ]
animals.flatten  #=> ["cat", "bob", "horse", "caris", "mouse", "arya"]
```

## Enumerating Hashes

Enumerating `Hash` objects is exactly the same as enumerating `Array` objects, except that the block receives two arguments: the key and the value:

```ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
pet_names.each { |animal, name| ... }
```

If you only need one of the values, you can use the special `_` symbol to indicate that one value is not needed.
This helps both in terms of developer clarity and also is a performance optimisation.

```ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
pet_names.map { |_, name| name }  #=> ["bob, "caris", "arya"]
```

## Nested Enumerations

You can also enumerate in nested blocks, and daisy chain methods together.
For example, if we have an array of hashes of animals, and we want extract the animals with short names, we might want to do something like:

```ruby
pets = [
  { animal: "cats", names: ["bob", "fred", "sandra"] },
  { animal: "horses", names: ["caris", "black beard", "speedy"] },
  { animal: "mice", names: ["arya", "jerry"] }
]

pets.map { |pet|
  pet[:names].select { |name| name.length <= 5 }
}.flatten.sort
#=> ["arya", "bob", "caris", "fred", "jerry"]
```

## Instructions

You run an online fashion boutique. Your big annual sale is coming up, so you want to create some functionality to help you take stock of your inventory to make sure you're ready.

A single item in the inventory is represented by a hash, and the whole inventory is an array of these hashes.

```ruby
[
  {
    name: "White Shirt",
    price: 40,
    quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}
  },
  { ... }
]
```

## 1. Return a list of the names of the items in stock

Implement `BoutiqueInventory.item_names` which should return a list of the item names, ordered alphabetically.

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).item_names

#=> ["Bamboo Socks Cats", "Black Short Skirt", "Maxi Brown Dress", "Red Short Skirt"]
```

## 2. Return any items that are cheap

Implement `BoutiqueInventory.cheap` which should return any items that cost less than $30.

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).cheap

# => [
#      {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
#      {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
#    ]
```

## 3. Return any items that are out of stock

Implement `BoutiqueInventory.out_of_stock` which should return any items that have no stock (where `quantity_by_size` is empty).

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).out_of_stock

#=> [{price: 50.00, name: "Red Short Skirt", quantity_by_size: {}}]
```

## 4. Return a single item's stock

Implement `BoutiqueInventory.stock_for_item(name)` to return the stock of an item by its name:

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).stock_for_item("Black Short Skirt")

#=> {s: 1, xl: 4}
```

## 5. Return the total stock

Implement `BoutiqueInventory.total_stock` to calculate the total amount of items in your storeroom:

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).total_stock

#=> 36
```

## Source

### Created by

- @iHiD