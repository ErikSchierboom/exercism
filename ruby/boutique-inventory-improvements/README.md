# Boutique Inventory Improvements

Welcome to Boutique Inventory Improvements on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

`OpenStruct` allows you to easily create an object from a `Hash`. 
Rather than having to access using `Hash` keys, `OpenStruct` instead allows us to use methods to access and set values.


```ruby
attributes = { name: "Jeremy Walker", age: 21, location: "Nomadic" }
person = OpenStruct.new(attributes)

person.name
#=> Jeremy Walker

person.location
#=> Nomadic

# Update the age
person.age = 35

# It sets correctly
person.age
#=> 35
```

One bonus to this approach is that we can take advantage of a shortcut when using block syntax. 
In situations where a block calls a single method, you can replace the block with `&:` followed by the method name. 
For example, these two lines are synonymous:

```ruby
people.sum { |person| person.age }
people.sum(&:age)
```

## Standard Library

All of the classes you've seen in previous exercises have been part of Ruby's Core Library.

OpenStruct is part of Ruby's Standard Library (often shortened to "stdlib") - a collection of classes for working with things such as dates, json, and networking.
It also provides some useful functionality for making your code easier to work with.

When using classes that are not from the Core Library — your own code in different files, classes from stdlib, or external dependencies — we need to import them using the `require` method before we can use them.
For example:

```ruby
require 'ostruct'

person = OpenStruct.new(name: "Jeremy Walker")
# ...
```

## Instructions

You're continuing to work on the stock management system you built previously. Since discovering `OpenStruct` and block shortcuts, you've decided to refactor the code a little. Rather than storing the items as hashes, you're going to utilize your newfound skills.

## 1. Allow retrievable of items

You want to continue to retrieve the list of items in stock, but this time they should be objects that can have methods called on them.

```ruby
inventory = BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
])

inventory.items.first.name
# => "Maxi Brown Dress"

inventory.items.first.price
# => 65

inventory.items.size
# => 4
```

Refactor `item_names` to use the new block shortcut you've learnt rather than hashes.
As a reminder, the method should return:

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).item_names

# => ["Bamboo Socks Cats", "Black Short Skirt", "Maxi Brown Dress", "Red Short Skirt"]
```


Refactor `total_stock` to use the new block shortcut you've learnt rather than hashes.
As a reminder, the method should return::

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).total_stock

# => 36
```

## Source

### Created by

- @iHiD