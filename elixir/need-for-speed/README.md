# Need For Speed

Welcome to Need For Speed on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

To share code between different Elixir modules within the same project, you need to reference the outside module by its full name. But what if that name is too long or confusing?

## Alias

The special form `alias` allows you to shorten or change the name by which you reference an outside module. When used without any arguments, it trims down the module name to its last segment, e.g. `MyApp.Logger.Settings` becomes `Settings`. A custom name can be specified with the `:as` option.

Usually aliases are added at the beginning of the module definition.

```elixir
defmodule Square do
  alias Integer, as: I

  def area(a), do: I.pow(a, 2)
end
```

## Import

The special form `import` allows you to use functions from an outside module without using the module's name.

Importing a whole outside module might create conflicts with existing local functions. To avoid this, two options are available: `:except` and `:only`. Both expect a keyword list, where the key is the function name, and the value is the function's arity.

Usually imports are added at the beginning of the module definition.

```elixir
defmodule Square do
  import Integer, only: [pow: 2]

  def area(a), do: pow(a, 2)
end
```

## Instructions

That remote controlled car that you bought recently has turned into a whole new hobby. You have been organizing remote control car races.

You were almost finished writing a program that would allow to run race simulations when your cat jumped at your keyboard and deleted a few lines of code. Now your program doesn't compile anymore...

## 1. Fix compilation error `Race.__struct__/0 is undefined`

Add an alias so that the module `NeedForSpeed.Race` can be referenced by the shorter name `Race`.

## 2. Fix compilation error `Car.__struct__/0 is undefined`

Add an alias so that the module `NeedForSpeed.RemoteControlCar` can be referenced by the shorter name `Car`.

## 3. Fix compilation error `undefined function puts/1`

The function `puts/1` comes from the module `IO`. Import it to be able to use it without referencing the module.

## 4. Fix compilation error `undefined function default_color/0`

The functions `default_color/0`, `red/0`, `cyan/0`, and `green/0` all come from the module `IO.ANSI`. You're planning to add support for other car colors, so you want to import the whole module. Unfortunately, the function `color/1` from the module `IO.ANSI` conflicts with one of your local functions. Import the whole `IO.ANSI` module except that one function.

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw