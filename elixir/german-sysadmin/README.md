# German Sysadmin

Welcome to German Sysadmin on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Charlists

Charlists are created using single quotes.

```elixir
'hello'
```

Although they look similar to strings, the two data types are quite different from one another. A charlist is a list of integers. The integers represent the Unicode values of a given character — also known as code points.

```elixir
[65, 66, 67]
# => 'ABC'
```

You can prepend a character with `?` to get its code point.

```elixir
?A
# => 65

[?:, ?)]
# => ':)'
```

Because charlist are lists, you can work with them just like with any other list - using recursion and pattern matching.

```elixir
[first_letter | _] = 'cat'
first_letter
# => 99
```

You can concatenate two lists using `++`.

```elixir
'hi' ++ '!'
# => 'hi!'
```

The longer the first list is, the slower the concatenation, so avoid repeatedly appending to lists of arbitrary length.

## Case

`case` is a control flow structure that allows us to compare a given value against many patterns. Clauses in a `case` expression are evaluated from top to bottom, until a match is found.

```elixir
age = 15

case age do
  0 -> 'infant'
  age when age < 4 -> 'baby'
  age when age < 13 -> 'child'
  age when age < 18 -> 'teenager'
  _ -> 'adult'
end

# => 'teenager'
```

## Instructions

You are working as a system administrator for a big company in Munich, Germany. One of your responsibilities is managing email accounts.

You have been hearing complaints from people saying they are unable to write emails to Mr. Müller. You quickly realize that most of the company uses an old email client that doesn't recognize `müller@firma.de` as a valid email address because of the non-Latin character.

Telling people to give up their favorite old email client is a lost battle, so you decide to create sanitized aliases for all email accounts.

## 1. Sanitize existing usernames by removing everything but lowercase letters

Implement the `sanitize/1` function. It should accept a username as a charlist and return the username with all characters but lowercase letters removed.

```elixir
Username.sanitize('schmidt1985')
# => 'schmidt'
```

## 2. Allow underscores

Extend the `sanitize/1` function. It should not remove underscores from the username.

```elixir
Username.sanitize('mark_fischer$$$')
# => 'mark_fischer'
```

## 3. Substitute German characters

There are 4 non-Latin characters in the German alphabet, and all of them have commonly-recognized Latin substitutes.

| German character | Latin substitute |
| ---------------- | ---------------- |
| ä                | ae               |
| ö                | oe               |
| ü                | ue               |
| ß                | ss               |

Extend the `sanitize/1` function. It should substitute German characters according to the table. You can safely assume all usernames are already downcase.

```elixir
Username.sanitize('cäcilie_weiß')
# => 'caecilie_weiss'
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw