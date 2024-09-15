# Squeaky Clean

Welcome to Squeaky Clean on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The F# `char` type is a 16 bit value to represent the smallest addressable components of text, immutable by default.

`char`s can be defined as literals with single quotes:

```fsharp
let ch = 'A'
// => val ch: char = 'A'
```

Strings are a sequence of chars.

An individual `char` can be retrieved from a string with (zero-based) indexing:

```fsharp
"Exercism"[4] //  =>  'c'
```

Iterating over a string returns a `char` at each step.

The next example uses a higher order function and an anonymous function, for convenience.
These will be covered properly later in the syllabus, but for now they are essentially a concise way to write a loop over the characters in a string.

```fsharp
Seq.map (fun c -> c, int c) "F#"  //  =>  [('F', 70); ('#', 35)]
```

As shown above, a `char` can be cast to its `int` value.
This also works (*at least some of the time*) for other scripts:

```fsharp
Seq.map (fun c -> c, int c) "東京"  //  =>  [('東', 26481); ('京', 20140)]
```

The underlying Int16 is used when comparing characters:

```fsharp
'A' < 'D'  // =>  true
```

Also, an `int` can be cast to `char`:

```fsharp
char 77  // => 'M'
```

The `System.Char` library contains the full set of methods expected for a .NET language, such as upper/lower conversions:

```fsharp
'a' |> System.Char.ToUpper  // =>  'A'

'Q' |> System.Char.ToLower  // =>  'q'
```

## Instructions

In this exercise you will implement a partial set of utility routines to help a developer clean up identifier names.

In the 6 tasks you will gradually build up the functions `transform` to convert single characters and `clean` to convert strings.

A valid identifier comprises zero or more letters, underscores, hyphens, question marks and emojis.

If an empty string is passed to the `clean` function, an empty string should be returned.

## 1. Replace any hyphens encountered with underscores

Implement the `transform` function to replace any hyphens with underscores.

```fsharp
transform '-'  // => "_"
```

## 2. Remove all whitespace

Remove all whitespace characters.
This will include leading and trailing whitespace.

```fsharp
transform ' '  // => ""
```

## 3. Convert camelCase to kebab-case

Modify the `transform` function to convert camelCase to kebab-case

```fsharp
transform 'D'  // => "-d"
```

## 4. Omit characters that are digits

Modify the `transform` function to omit any characters that are numeric.

```fsharp
transform '7'  // => ""
```

## 5. Replace Greek lower case letters with question marks

Modify the `transform` function to replace any Greek letters in the range 'α' to 'ω'.

```fsharp
transform 'β' // => "?"
```

## 6. Combine these operations to operate on a string

Implement the `clean` function to apply these operations to an entire string.

Characters which fall outside the rules should pass through unchanged.

```fsharp
clean "  a2b Cd-ω😀  " //  => "ab-cd_?😀"
```

## Assembling a string from characters

This topic will be covered in detail later in the syllabus.

For now, it may be useful to know that there is a [higher order function][higher-order-function] called [`String.collect`][string-collect] that converts a collection of `char`s to a string, using a function that you supply.

```fsharp
let transform ch = $"{ch}_"
String.collect transform "abc"  // =>  "a_b_c_"
```

[higher-order-function]: https://exercism.org/tracks/fsharp/concepts/higher-order-functions
[string-collect]: https://fsharp.github.io/fsharp-core-docs/reference/fsharp-core-stringmodule.html#collect

## Source

### Created by

- @colinleach
- @ErikSchierboom