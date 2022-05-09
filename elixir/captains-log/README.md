# Captain's Log

Welcome to Captain's Log on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Randomness

In Elixir, to choose a random element from an enumerable data structure (e.g. list, range), we use `Enum.random`. This function will pick a single element, with every element having equal probability of being picked.

Elixir does not have its own functions for picking a random float. To do that, we have to use Erlang directly.

## Erlang Libraries

Elixir code runs in the BEAM virtual machine. BEAM is part of the Erlang Run-Time System. Being inspired by Erlang, and sharing its run environment, Elixir provides great interoperability with Erlang libraries. This means that Elixir developers can use Erlang libraries from within their Elixir code. In fact, writing Elixir libraries for functionality already provided by Erlang libraries is discouraged in the Elixir community.

As a result, certain functionality, like mathematical operations or timer functions, is only available in Elixir via Erlang.

Erlang's standard library is available for use in our Elixir code without any extra steps necessary.

Erlang functions can be called in the same way we call Elixir functions, with one small difference. Erlang module names are `snake_case` atoms. For example, to call the Erlang `pi/0` function from the `math` module, one would write:

```elixir
:math.pi()
# => 3.141592653589793
```

The most commonly used Erlang functions that do not have an Elixir equivalent are:

- `:timer.sleep/1` which suspends a process for the given amount of milliseconds.
- `:rand.uniform/0` which generates a random float `x`, where `0.0 <= x < 1.0`.
- `:io_lib.format/2` which provides C-style string formatting (using control sequences). Using this function, we could for example print an integer in any base between 2 and 36 or format a float with desired precision. Note that this function, like many Erlang functions, returns a charlist.
- The `math` module that provides mathematical functions such as `sin/1`, `cos/1`, `log2/1`, `log10/1`, `pow/2`, and more.

To discover Erlang's standard library, explore the [STDLIB Reference Manual][erl-stdlib-ref].

[erl-stdlib-ref]: http://www.erlang.org/doc/apps/stdlib/index.html

## Instructions

Mary is a big fan of the TV series _Star Trek: The Next Generation_. She often plays pen-and-paper role playing games, where she and her friends pretend to be the crew of the _Starship Enterprise_. Mary's character is Captain Picard, which means she has to keep the captain's log. She loves the creative part of the game, but doesn't like to generate random data on the spot.

Help Mary by creating random generators for data commonly appearing in the captain's log.

## 1. Generate a random planet

The _Starship Enterprise_ encounters many planets in its travels. Planets in the Star Trek universe are split into categories based on their properties. For example, Earth is a class M planet. All possible planetary classes are: D, H, J, K, L, M, N, R, T, and Y.

Implement the `random_planet_class/0` function. It should return one of the planetary classes at random.

```elixir
CaptainsLog.random_planet_class()
# => "K"
```

## 2. Generate a random starship registry number

Enterprise (registry number NCC-1701) is not the only starship flying around! When it rendezvous with another starship, Mary needs to log the registry number of that starship.

Registry numbers start with the prefix "NCC-" and then use a number from 1000 to 9999 (inclusive).

Implement the `random_ship_registry_number/0` function that returns a random starship registry number.

```elixir
CaptainsLog.random_ship_registry_number()
# => "NCC-1947"
```

## 3. Generate a random stardate

What's the use of a log if it doesn't include dates?

A stardate is a floating point number. The adventures of the _Starship Enterprise_ from the first season of _The Next Generation_ take place between the stardates 41000.0 and 42000.0. The "4" stands for the 24th century, the "1" for the first season.

Implement the function `random_stardate/0` that returns a floating point number between 41000.0 (inclusive) and 42000.0 (exclusive).

```elixir
CaptainsLog.random_stardate()
# => 41458.15721310934
```

## 4. Format the stardate

In the captain's log, stardates are usually rounded to a single decimal place.

Implement the `format_stardate/1` function that will take a floating point number and return a string with the number rounded to a single decimal place.

```elixir
CaptainsLog.format_stardate(41458.15721310934)
# => "41458.2"
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw