# DNA Encoding

Welcome to DNA Encoding on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Bitstrings

Working with binary data is an important concept in any language, and Elixir provides an elegant syntax to write, match, and construct binary data.

In Elixir, binary data is referred to as the bitstring type. The binary data*type* (not to be confused with binary data in general) is a specific form of a bitstring, which we will discuss in a later exercise.

Bitstring literals are defined using the bitstring special form `<<>>`. When defining a bitstring literal, it is defined in segments. Each segment has a value and type, separated by the `::` operator. The type specifies how many bits will be used to encode the value. If the value of the segment overflows the capacity of the segment's type, it will be truncated from the left.

```elixir
# This defines a bitstring with three segments of a single bit each
<<0::1, 1::1, 0::1>> == <<0::size(1), 1::size(1), 0::size(1)>>
# => true
<<0::1, 1::1, 0::1>> == <<2::size(3)>>
# => true
<<2::1>> == <<0::1>>
# => true because of value overflow
```

When writing binary integer literals, we can write them directly in base-2 notation by prefixing the literal with `0b`.

```elixir
value = 0b11111011011 = 2011
```

By default, bitstrings are displayed in chunks of 8 bits (a byte).

```
<<value::11>>
# => <<251, 3::size(3)>>
```

### Constructing

We can combine bitstrings stored in variables using the special form:

```elixir
first = <<0b110::3>>
second = <<0b001::3>>
combined = <<first::bitstring, second::bitstring>>
# => <<49::size(6)>>
```

### Pattern matching

Pattern matching can also be done to obtain the value from within the special form:

```elixir
<<value::4, rest::bitstring>> = <<0b01101001::8>>
value == 0b0110
# => true
```

## Tail Call Recursion

When [recursing][exercism-recursion] through enumerables (lists, bitstrings, strings), there are often two concerns:

- how much memory is required to store the trail of recursive function calls
- how to build the solution efficiently

To deal with these concerns an _accumulator_ may be used.

An accumulator is a variable that is passed along in addition to the data. It is used to pass the current state of the function's execution, from function call to function call, until the _base case_ is reached. In the base case, the accumulator is used to return the final value of the recursive function call.

Accumulators should be initialized by the function's author, not the function's user. To achieve this, declare two functions - a public function that takes just the necessary data as arguments and initializes the accumulator, and a private function that also takes an accumulator. In Elixir, it is a common pattern to prefix the private function's name with `do_`.

```elixir
# Count the length of a list without an accumulator
def count([]), do: 0
def count([_head | tail]), do: 1 + count(tail)

# Count the length of a list with an accumulator
def count(list), do: do_count(list, 0)

defp do_count([], count), do: count
defp do_count([_head | tail], count), do: do_count(tail, count + 1)
```

The usage of an accumulator allows us to turn recursive functions into _tail-recursive_ functions. A function is tail-recursive if the _last_ thing executed by the function is a call to itself.

[exercism-recursion]: https://exercism.org/tracks/elixir/concepts/recursion

## Instructions

In your DNA research lab, you have been working through various ways to compress your research data to save storage space. One teammate suggests converting the DNA data to a binary representation:

| Nucleic Acid | Code   |
| ------------ | ------ |
| a space      | `0000` |
| A            | `0001` |
| C            | `0010` |
| G            | `0100` |
| T            | `1000` |

You ponder this, as it will potentially halve the required data storage costs, but at the expense of human readability. You decide to write a module to encode and decode your data to benchmark your savings.

## 1. Encode nucleic acid to binary value

Implement `encode_nucleotide/1` to accept the code point for the nucleic acid and return the integer value of the encoded code.

```elixir
DNA.encode_nucleotide(?A)
# => 0b0001
```

## 2. Decode the binary value to the nucleic acid

Implement `decode_nucleotide/1` to accept the integer value of the encoded code and return the code point for the nucleic acid.

```elixir
DNA.decode_nucleotide(0b0001)
# => ?A
```

## 3. Encode a DNA charlist

Implement `encode/1` to accept a charlist representing nucleic acids and gaps and return a bitstring of the encoded data.

```elixir
DNA.encode('AC GT')
# => <<18, 4, 8::size(4)>>
```

## 4. Decode a DNA bitstring

Implement `decode/1` to accept a bitstring representing nucleic acids and gaps and return the decoded data as a charlist.

```elixir
DNA.decode(<<132, 2, 1::size(4)>>)
# => 'TG CA'
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @NobbZ