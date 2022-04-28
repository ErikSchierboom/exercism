# Language List

Welcome to Language List on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Lists

Lists are built-in to the Elixir language. They are considered a basic type, denoted by square brackets. Lists may be empty or hold any number of items of any type. For example:

```elixir
empty_list = []
one_item_list = [1]
two_item_list = [1, 2]
multiple_type_list = [1, :pi, 3.14]
```

Elixir implements lists as a linked list, where each node stores the reference to the next list. The first item in the list is referred to as the _head_ and the remaining list of items is called the _tail_. We can use this notation in code:

```elixir
# [1] represented in [head | tail] notation
[1 | []]

# [1, 2, 3] represented in [head | tail] notation
[1 | [2 | [3 | []]]]
```

We can use _`[head | tail]`_ notation to prepend elements to a list:

```elixir
# Suppose
list = [2, 1]

[3, 2, 1] == [3 | list]
# => true
```

There are several functions in the `Kernel` module for working with lists, as well as the whole `List` module.

```elixir
# Check if 1 is a member of the list
1 in [1, 2, 3, 4]
# => true
```

## Instructions

In this exercise you need to implement some functions to manipulate a list of programming languages.

## 1. Define a function to return an empty language list

Define the `new/0` function that takes no arguments and returns an empty list.

```elixir
LanguageList.new()
# => []
```

## 2. Define a function to add a language to the list

Define the `add/2` function that takes 2 arguments (a _language list_ and a string literal of a _language_). It should return the resulting list with the new language prepended to the given list.

```elixir
LanguageList.new()
|> LanguageList.add("Clojure")
|> LanguageList.add("Haskell")
# => ["Haskell", "Clojure"]
```

## 3. Define a function to remove a language from the list

Define the `remove/1` function that takes 1 argument (a _language list_). It should return the list without the first item. Assume the list will always have at least one item.

```elixir
LanguageList.new()
|> LanguageList.add("Clojure")
|> LanguageList.add("Haskell")
|> LanguageList.remove()
# => ["Clojure"]
```

## 4. Define a function to return the first item in the list

Define the `first/1` function that takes 1 argument (a _language list_). It should return the first language in the list. Assume the list will always have at least one item.

```elixir
LanguageList.new()
|> LanguageList.add("Elm")
|> LanguageList.add("Prolog")
|> LanguageList.first()
# => "Prolog"
```

## 5. Define a function to return how many languages are in the list

Define the `count/1` function that takes 1 argument (a _language list_). It should return the number of languages in the list.

```elixir
LanguageList.new()
|> LanguageList.add("Elm")
|> LanguageList.add("Prolog")
|> LanguageList.count()
# => 2
```

## 6. Define a function to determine if the list includes a functional language

Define the `functional_list?/1` function which takes 1 argument (a _language list_). It should return a boolean value. It should return true if _"Elixir"_ is one of the languages in the list.

```elixir
LanguageList.new()
|> LanguageList.add("Elixir")
|> LanguageList.functional_list?()
# => true
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @fireproofsocks