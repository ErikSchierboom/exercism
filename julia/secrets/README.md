# Secrets

Welcome to Secrets on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Binary digits ultimately map directly to the transistors in your CPU or RAM, and whether each is "on" or "off".

Low-level manipulation, informally called "bit-twiddling", is particularly important in system languages.

High-level languages like Julia usually abstract away most of this detail.
However, a full range of bit-level operations are available in the base language.

***Note:*** To see human-readable binary output in the REPL, nearly all the examples below need to be wrapped in a `bitstring()` function.
This is visually distracting, so most occurrences of this function have been edited out.

## Bit-shift operations

Integer types, signed or unsigned, can be represented as a string of 1's and 0's.

```julia-repl
julia> bitstring(UInt8(5))
"00000101"
```

Bit-shifts just move everything to the left or right by a specified number of positions.
With `UInt` types, some bits drop off one end, and the other end is padded with zeros:

```julia-repl
julia> ux::UInt8 = 5
5

julia> bitstring(ux)
"00000101"

julia> ux << 2 # left by 2
"00010100"

julia> ux >> 1 # right by 1
"00000010"
```

Each left-shift doubles the value and each right-shift halves it (subject to truncation).
This is more obvious in decimal representation:

```julia-repl
julia> 3 << 2
12

julia> 24 >> 3
3
```

Such bit-shifting is much faster than "proper" arithmetic, making the technique very popular in low-level coding.

With signed integers, we need to be a bit more careful.

Left shifts are relatively simple:

```julia-repl
julia> sx = Int8(5)
5

julia> sx # positive integer
"00000101"

julia> sx << 2
"00010100"

julia> -sx # negative integer
"11111011"

julia> -sx << 2
"11101100"
```

Left-shifting positive signed integers is thus the same as with unsigned integers.

Negative values are stored in [two's complement][2complement] form, which means that the left-most bit is 1.
No problem for a left-shift, but when right-shifting how do we pad the left-most bits?

```julia-repl
julia> sx >> 2 # simple for positive values!
"00000001"

julia> -sx # negative integer
"11111011"

julia> -sx >> 2 # pad with repeated sign bit
"11111110"

julia> -sx >>> 2 # pad with 0
"00111110"
```

The `>>` operator performs arithmetic shift, preserving the sign bit.

The `>>>` operator performs logical shift, padding with zeros as if the number was unsigned.

## Bitwise logic

We saw in a previous Concept that the operators `&&` (and), `||` (or) and `!` (not) are used with boolean values.

There are equivalent operators `&` (bitwise and), `|` (bitwise or) and `~` (a tilde, bitwise not) to compare the bits in two integers.

```julia-repl
julia> 0b1011 & 0b0010 # bit is 1 in both numbers
"00000010"

julia> 0b1011 | 0b0010 # bit is 1 in at least one number
"00001011"

julia> ~0b1011 # flip all bits
"11110100"

julia> xor(0b1011, 0b0010) # bit is 1 in exactly one number, not both
"00001001"
```

Here, `xor()`  is exclusive-or, used as a function.

[2complement]: https://en.wikipedia.org/wiki/Two%27s_complement

## Instructions

Your friend has just sent you a message with an important secret.
Not wanting to make it easy for others to read it, the message was encrypted by performing a series of bit manipulations.
You will need to write the functions to help decrypt the message.

## 1. Shift back the bits

The first step in decrypting the message is to undo the shifting from the encryption process by shifting the bits back to the right.
There will be further steps in the decryption process that assume 0s are inserted from the left hand side.

Implement the `shift_back()` function that takes a value and the number of places to shift and peforms the shift.

```julia
shift_back(0b1001, 2) # => 0b0010
```

## 2. Set some bits

Next, there are some bits that need to be set to 1.

Implement the `set_bits()` function that takes a value and a mask and returns the result of setting the bits in value to 1.
A bit from `value` should be set to 1 where the bit in the `mask` is also 1.
All other bits should be kept unchanged.

```julia
set_bits(0b0110, 0b0101) # => 0b0111
```

## 3. Flip specific bits

Some bits are flipped during encryption.
They will need to be flipped back to decrypt the message.

Implement the `flip_bits()` function that takes a value and the mask.
The mask indicates which bits in the value to flip.
If the bit is 1 in `mask`, the bit is flipped in the `value`.
All other bits are kept unchanged.

```julia
flip_bits(0b1100, 0b0101) # => 0b1001
```

## 4. Clear specific bits

Lastly, there are also certain bits that always decrypt to 0.

Implement the `clear_bits()` function that takes a value and a mask.
The bits in the `value` should be set to 0 where the bit in the mask is 1.
All other bits should be kept unchanged.

```julia
clear_bits(0b0110, 0b0101) # => 0b0010
```

## Source

### Created by

- @colinleach