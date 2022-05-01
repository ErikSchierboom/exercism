# City Office

Welcome to City Office on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Docs

Documentation in Elixir is a first-class citizen.

There are two module attributes commonly used to document your code - `@moduledoc` for documenting a module and `@doc` for documenting a function that follows the attribute. The `@moduledoc` attribute usually appears on the first line of the module, and the `@doc` attribute usually appears right before a function definition, or the function's typespec if it has one. The documentation is commonly written in a multiline string using the heredoc syntax.

Elixir documentation is written in [**Markdown**][markdown].

```elixir
defmodule String do
  @moduledoc """
  Strings in Elixir are UTF-8 encoded binaries.
  """

  @doc """
  Converts all characters in the given string to uppercase according to `mode`.

  ## Examples

      iex> String.upcase("abcd")
      "ABCD"

      iex> String.upcase("olá")
      "OLÁ"
  """
  def upcase(string, mode \\ :default)
end
```

## Typespecs

Elixir is a dynamically typed language, which means it doesn't provide compile-time type checks. Still, type specifications can be used as a form of documentation.

A type specification can be added to a function using the `@spec` module attribute right before the function definition. `@spec` is followed by the function name and a list of all of its arguments' types, in parentheses, separated by commas. The type of the return value is separated from the function's arguments with a double colon `::`.

```elixir
@spec longer_than?(String.t(), non_neg_integer()) :: boolean()
def longer_than?(string, length), do: String.length(string) > length
```

### Types

Most commonly used types include:

- booleans: `boolean()`
- strings: `String.t()`
- numbers: `integer()`, `non_neg_integer()`, `pos_integer()`, `float()`
- lists: `list()`
- a value of any type: `any()`

Some types can also be parameterized, for example `list(integer)` is a list of integers.

Literal values can also be used as types.

A union of types can be written using the pipe `|`. For example, `integer() | :error` means either an integer or the atom literal `:error`.

A full list of all types can be found in the ["Typespecs" section in the official documentation][types].

### Naming arguments

Arguments in the typespec could also be named which is useful for distinguishing multiple arguments of the same type. The argument name, followed by a double colon, goes before the argument's type.

```elixir
@spec to_hex({hue :: integer, saturation :: integer, lightness :: integer}) :: String.t()
```

### Custom types

Typespecs aren't limited to just the built-in types. Custom types can be defined using the `@type` module attribute. A custom type definition starts with the type's name, followed by a double colon and then the type itself.

```elixir
@type color :: {hue :: integer, saturation :: integer, lightness :: integer}

@spec to_hex(color()) :: String.t()
```

A custom type can be used from the same module where it's defined, or from another module.

[types]: https://hexdocs.pm/elixir/typespecs.html#types-and-their-syntax
[markdown]: https://docs.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax

## Instructions

You have been working in the city office for a while, and you have developed a set of tools that speed up your day-to-day work, for example with filling out forms.

Now, a new colleague is joining you, and you realized your tools might not be self-explanatory. There are a lot of weird conventions in your office, like always filling out forms with uppercase letters and avoiding leaving fields empty.

You decide to write some documentation so that it's easier for your new colleague to hop right in and start using your tools.

## 1. Document the purpose of the form tools

Add documentation to the `Form` module that describes its purpose. It should read:

```
A collection of loosely related functions helpful for filling out various forms at the city office.
```

## 2. Document filling out fields with blank values

Add documentation and a typespec to the `Form.blanks/1` function. The documentation should read:

```
Generates a string of a given length.

This string can be used to fill out a form field that is supposed to have no value.
Such fields cannot be left empty because a malicious third party could fill them out with false data.
```

The typespec should explain that the function accepts a single argument, a non-negative integer, and returns a string.

## 3. Document splitting values into lists of uppercase letters

Add documentation and a typespec to the `Form.letters/1` function. The documentation should read:

```
Splits the string into a list of uppercase letters.

This is needed for form fields that don't offer a single input for the whole string,
but instead require splitting the string into a predefined number of single-letter inputs.
```

The typespec should explain that the function accepts a single argument, a string, and returns a list of strings.

## 4. Document checking if a value fits a field with a max length

Add documentation and a typespec to the `Form.check_length/2` function. The documentation should read:

```
Checks if the value has no more than the maximum allowed number of letters.

This is needed to check that the values of fields do not exceed the maximum allowed length.
It also tells you by how much the value exceeds the maximum.
```

The typespec should explain that the function accepts two arguments, a string and a non-negative integer, and returns one of two possible values. It returns either the `:ok` atom or a 2-tuple with the first element being the `:error` atom, and the second a positive integer.

## 5. Document different address formats

For some unknown to you reason, the city office's internal system uses two different ways of representing addresses - either as a map or as a tuple.

Document this fact by defining three custom public types:
- `address_map` - a map with the keys `:street`, `:postal_code`, and `:city`. Each key holds a value of type string.
- `address_tuple` - a tuple with three values - `street`, `postal_code`, and `city`. Each value is of type string. Differentiate the values by giving them names in the typespec.
- `address` - can be either an `address_map` or an `address_tuple`.

## 6. Document formatting the address

Add documentation and a typespec to the `Form.format_address/1` function. The documentation should read:

```
Formats the address as an uppercase multiline string.
```

The typespec should explain that the function accepts one argument, an address, and returns a string.

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw
- @michallepicki