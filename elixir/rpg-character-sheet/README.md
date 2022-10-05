# RPG Character Sheet

Welcome to RPG Character Sheet on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## IO

Functions for handling input and output are provided by the `IO` module.

### Output

To write a string to the standard output, use `IO.puts`. `IO.puts` always adds a new line at the end of the string. If you don't want that behavior, use `IO.write` instead. Both functions return the atom `:ok` if they succeed.

```elixir
IO.puts("Hi!")
# > Hi!
# => :ok
```

`IO.puts` is useful for writing strings, but not much else. If you need a tool for debugging that will allow you to write any value to standard output, use `IO.inspect` instead. `IO.inspect` returns the value it was passed unchanged, so it can be inserted in any point in your code. It also accepts many options, for example `:label`, that will allow you to distinguish it from other `IO.inspect` calls.

### Input

To read a line from the standard input, use `IO.gets`. `IO.gets` accepts one argument - a string that it will print as a prompt for the input. `IO.gets` doesn't add a new line after the prompt, include it yourself if you need it.

```elixir
IO.gets("What's your name?\n")
# > What's your name?
# < Mary
# => "Mary\n"
```

## Instructions

You and your friends love to play pen-and-paper role-playing games, but you noticed that it's difficult to get new people to join your group. They often struggle with character creation. They don't know where to start. To help new players out, you decided to write a small program that will guide them through the process.

## 1. Welcome the new player

Implement the `RPG.CharacterSheet.welcome/0` function. It should print a welcome message, and return `:ok`.

```elixir
RPG.CharacterSheet.welcome()
# > Welcome! Let's fill out your character sheet together.
# => :ok
```

## 2. Ask for the character's name

Implement the `RPG.CharacterSheet.ask_name/0` function. It should print a question, wait for an answer, and return the answer without leading and trailing whitespace.

```elixir
RPG.CharacterSheet.ask_name()
# > What is your character's name?
# < Mathilde
# => "Mathilde"
```

## 3. Ask for the character's class

Implement the `RPG.CharacterSheet.ask_class/0` function. It should print a question, wait for an answer, and return the answer without leading and trailing whitespace.

```elixir
RPG.CharacterSheet.ask_class()
# > What is your character's class?
# < healer
# => "healer"
```

## 4. Ask for the character's level

Implement the `RPG.CharacterSheet.ask_level/0` function. It should print a question, wait for an answer, and return the answer as an integer.

```elixir
RPG.CharacterSheet.ask_level()
# > What is your character's level?
# < 2
# => 2
```

## 5. Combine previous steps into one

Implement the `RPG.CharacterSheet.run/0` function. It should welcome the new player, ask for the character's name, class, and level, and return the character sheet as a map. It should also print the map with the label "Your character".

```elixir
RPG.CharacterSheet.run()
# > Welcome! Let's fill out your character sheet together.
# > What is your character's name?
# < Mathilde
# > What is your character's class?
# < healer
# > What is your character's level?
# < 2
# > Your character: %{class: "healer", level: 2, name: "Mathilde"}
# => %{class: "healer", level: 2, name: "Mathilde"}
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw