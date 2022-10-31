# Squeaky Clean

Welcome to Squeaky Clean on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Chars

The C# `char` type is a 16 bit quantity to represent the smallest addressable components of text.
Multiple `char`s can comprise a string such as `"word"` or `char`s can be
processed independently. Their literals have single quotes e.g. `'A'`.

C# `char`s support UTF-16 Unicode encoding - so in addition to the latin character set
pretty much all the writing systems in use worldwide can be represented,
e.g. the Greek letter `'β'`.

There are many builtin library methods to inspect and manipulate `char`s. These
can be found as static methods of the `System.Char` class.

## String Builder

`char`s are sometimes used in conjunction with a `StringBuilder` object.
This object has methods that allow a string to be constructed
character by character and manipulated. At the end of the process
`ToString` can be called on it to output a complete string.

## Instructions

In this exercise you will implement a partial set of utility routines to help a developer
clean up identifier names.

In the 5 tasks you will gradually build up the routine `Clean` A valid identifier comprises
zero or more letters and underscores.

In all cases the input string is guaranteed to be non-null. If an empty string is passed to the `Clean` function, an empty string should be returned.

Note that the caller should avoid calling the routine `Clean` with an empty identifier since such identifiers are ineffectual.

## 1. Replace any spaces encountered with underscores

Implement the (_static_) `Identifier.Clean()` method to replace any spaces with underscores. This also applies to leading and trailing spaces.

```csharp
Identifier.Clean("my   Id");
// => "my___Id"
```

## 2. Replace control characters with the upper case string "CTRL"

Modify the (_static_) `Identifier.Clean()` method to replace control characters with the upper case string `"CTRL"`.

```csharp
Identifier.Clean("my\0Id");
// => "myCTRLId",
```

## 3. Convert kebab-case to camelCase

Modify the (_static_) `Identifier.Clean()` method to convert kebab-case to camelCase.

```csharp
Identifier.Clean("à-ḃç");
// => "àḂç"
```

## 4. Omit characters that are not letters

Modify the (_static_) `Identifier.Clean()` method to omit any characters that are not letters.

```csharp
Identifier.Clean("1😀2😀3😀");
// => ""
```

## 5. Omit Greek lower case letters

Modify the (_static_) `Identifier.Clean()` method to omit any Greek letters in the range 'α' to 'ω'.

```csharp
Identifier.Clean("MyΟβιεγτFinder");
// => "MyΟFinder"
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin