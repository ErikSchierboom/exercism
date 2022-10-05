# File Sniffer

Welcome to File Sniffer on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Binaries

Elixir provides an elegant syntax for working with binary data as we have seen with the `<<>>` special form provided for working with [bitstrings][exercism-bitstrings].

The binary type is a specialization on the bitstring type. Where bitstrings could be of any length (any number of [bits][wiki-bit]), binaries are where the number of bits can be evenly divided by 8. That is, when working with binaries, we often think of things in terms of [bytes][wiki-byte] (8 bits). A byte can represent integer numbers from `0` to `255`. It is common to work with byte values in [hexadecimal][wiki-hexadecimal], `0x00 - 0xFF`.

Binary literals are defined using the bitstring special form `<<>>`. When defining a binary literal, we can use integer and string literals. Integer values greater than 255 will overflow and only the last 8 bits of the integer will be used. By default, the `::binary` modifier is applied to the value. We can concatenate binaries with the `<>/2` operator.

```elixir
<<255>> == <<0xFF>>
<<256>> == <<0>> # Overflowing bits are truncated
<<2, 4, 6, 8, 10, 12, 14, 16>> == <<0x02, 0x04, 0x06, 0x08, 0x0A, 0x0C, 0x0E, 0x10>>
```

A _null-byte_ is another name for `<<0>>`.

### Pattern matching on binary data

[Pattern matching][exercism-pattern-matching] is even extended to binaries, and we can pattern match on a portion of binary data much like we could for a list.

```elixir
# Ignore the first 8 bytes, match and bind the remaining to `body`
<<_::binary-size(8), body::binary>>
```

Like with other types of pattern matching, we can use this in function signatures to match when selecting from multiple function clauses.

[wiki-bit]: https://en.wikipedia.org/wiki/Bit
[wiki-byte]: https://en.wikipedia.org/wiki/Byte
[wiki-hexadecimal]: https://en.wikipedia.org/wiki/Hexadecimal
[exercism-bitstrings]: https://exercism.org/tracks/elixir/concepts/bitstrings
[exercism-pattern-matching]: https://exercism.org/tracks/elixir/concepts/pattern-matching

## Instructions

You have been working on a project which allows users to upload files to the server to be shared with other users. You have been tasked with writing a function to verify that an upload matches its [media type][mimetype]. You do some research and discover that the first few bytes of a file are generally unique to that file type, giving it a sort of signature.

Use the following table for reference:

| File type | Common extension | Media type                   | binary 'signature'                               |
| --------- | ---------------- | ---------------------------- | ------------------------------------------------ |
| ELF       | `"exe"`          | `"application/octet-stream"` | `0x7F, 0x45, 0x4C, 0x46`                         |
| BMP       | `"bmp"`          | `"image/bmp"`                | `0x42, 0x4D`                                     |
| PNG       | `"png"`          | `"image/png"`                | `0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A` |
| JPG       | `"jpg"`          | `"image/jpg"`                | `0xFF, 0xD8, 0xFF`                               |
| GIF       | `"gif"`          | `"image/gif"`                | `0x47, 0x49, 0x46`                               |

## 1. Given an extension, return the expected media type

Implement the `type_from_extension/1` function. It should take a file extension (string) and return the media type (string).

```elixir
FileSniffer.type_from_extension("exe")
# => "application/octet-stream"
```

## 2. Given a binary file, return the expected media type

Implement the `type_from_binary/1` function. It should take a file (binary) and return the media type (string).

```elixir
file = File.read!("application.exe")
FileSniffer.type_from_binary(file)
# => "application/octet-stream"
```

Don't worry about reading the file as a binary. Assume that has been done for you and is provided by the tests as an argument.

## 3. Given an extension and a binary file, verify that the file matches the expected type

Implement the `verify/2` function. It should take a file (binary) and extension (string) and return an `:ok` or `:error` tuple.

```elixir
file = File.read!("application.exe")

FileSniffer.verify(file, "exe")
# => {:ok, "application/octet-stream"}

FileSniffer.verify(file, "png")
# => {:error, "Warning, file format and file extension do not match."}
```

[mimetype]: https://en.wikipedia.org/wiki/Media_type

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska