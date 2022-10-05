# High Score

Welcome to High Score on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Maps

Maps in Elixir are the data structure for storing information in key-value pairs. In other languages, these might also be known as associative arrays (PHP), hashes (Perl 5, Raku), or dictionaries (Python).

Keys and values can be of any data type, but if the key is an atom we can use a shorthand syntax. Maps do not guarantee the order of their entries when accessed or returned.

### Literal forms

An empty map is simply declared with `%{}`. If we want to add items to a map literal, we can use two forms:

```elixir
# If the key is an atom:
%{atom_key: 1}

# If the key is a different type:
%{1 => :atom_value}

# You can even mix these if the atom form comes second:
%{"first_form" => :a, atom_form: :b}
```

While there is no canonical format, choose a consistent way to represent the key-value literal pairs.

### Map module functions

Elixir provides many functions for working with maps in the _Map module_. Some _Map module_ functions require an _anonymous_ function to be passed into the function to assist with the map transformation.

## Module Attributes As Constants

In Elixir, we can define module attributes which can be used as constants in our functions.

```elixir
defmodule Example do

  # Defines the attribute as the value 1
  @constant_number 1

  def example_value() do
    # Returns the value 1
    @constant_number
  end
end
```

When used to define module constants, attributes can be any expression which can be evaluated at compilation time. After compilation, module attributes are not accessible since they are expanded during compilation, similar to defined macros in languages like C.

## Instructions

In this exercise, you're implementing a way to keep track of the high scores for the most popular game in your local arcade hall.

## 1. Define a new high score map

To make a new high score map, define the `HighScore.new/0` function which doesn't take any arguments and returns a new, empty map of high scores.

```elixir
HighScore.new()
# => %{}
```

## 2. Add players to the high score map

To add a player to the high score map, define `HighScore.add_player/3`, which is a function which takes 3 arguments:

- The first argument is the map of scores.
- The second argument is the name of a player as a string.
- The third argument is the score as an integer. The argument is optional, implement the third argument with a default value of 0.

Store the default initial score in a module attribute. It will be needed again.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas")
# => %{"Dave Thomas" => 0}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 0, "José Valim"=> 486_373}
```

## 3. Remove players from the score map

To remove a player from the high score map, define `HighScore.remove_player/2`, which takes 2 arguments:

- The first argument is the map of scores.
- The second argument is the name of the player as a string.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas")
# => %{"Dave Thomas" => 0}
score_map = HighScore.remove_player(score_map, "Dave Thomas")
# => %{}
```

## 4. Reset a player's score

To reset a player's score, define `HighScore.reset_score/2`, which takes 2 arguments:

- The first argument is the map of scores.
- The second argument is the name of the player as a string, whose score you wish to reset.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"José Valim"=> 486_373}
score_map = HighScore.reset_score(score_map, "José Valim")
# => %{"José Valim"=> 0}
```

## 5. Update a player's score

To update a player's score by adding to the previous score, define `HighScore.update_score/3`, which takes 3 arguments:

- The first argument is the map of scores.
- The second argument is the name of the player as a string, whose score you wish to update.
- The third argument is the score that you wish to **add** to the stored high score.

The function should also work if the player doesn't have a previous score - assume the previous score is 0.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"José Valim"=> 486_373}
score_map = HighScore.update_score(score_map, "José Valim", 5)
# => %{"José Valim"=> 486_378}
```

## 6. Get a list of players

To get a list of players, define `HighScore.get_players/1`, which takes 1 argument:

- The first argument is the map of scores.

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas", 2_374)
# => %{"Dave Thomas" => 2_374}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 2_374, "José Valim"=> 486_373}
HighScore.get_players(score_map)
# => ["Dave Thomas", "José Valim"]
```

## Source

### Created by

- @neenjaw