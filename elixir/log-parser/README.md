# Log Parser

Welcome to Log Parser on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Regular Expressions

Regular expressions in Elixir follow the **PCRE** specification (**P**erl **C**ompatible **R**egular **E**xpressions), similarly to other popular languages like Java, JavaScript, or Ruby.

The `Regex` module offers functions for working with regular expressions. Some of the `String` module functions accept regular expressions as arguments as well.

~~~~exercism/note
This exercise assumes that you already know regular expression syntax, including character classes, quantifiers, groups, and captures.

If you need a refresh your regular expression knowledge, check out one of those sources: [Regular-Expressions.info][website-regex-info], [Rex Egg][website-rexegg], [RegexOne][website-regexone], [Regular Expressions 101][website-regex-101], [RegExr][website-regexr].
~~~~

### Sigils

The most common way to create regular expressions is using the `~r` sigil.

```elixir
~r/test/
```

Note that all Elixir sigils support [different kinds of delimiters][sigils], not only `/`.

### Matching

The `=~/2` can be used to perform a regex match that returns `boolean` result. Alternatively, there are also `match/3` functions in the `Regex` module as well as the `String` module.

```elixir
"this is a test" =~ ~r/test/
# => true

String.match?("Alice has 7 apples", ~r/\d{2}/)
# => false
```

### Capturing

If a simple boolean check is not enough, use the `Regex.run/3` function to get a list of all captures (or `nil` if there was no match). The first element in the returned list is always a match for the whole regular expression, and the following elements are matched groups.

```elixir
Regex.run(~r/(\d) apples/, "Alice has 7 apples")
# => ["7 apples", "7"]
```

### Modifiers

The behavior of a regular expression can be modified by appending special flags. When using a sigil to create a regular expression, add the modifiers after the second delimiter.

Common modifiers are:
- `i` - makes the match case-insensitive.
- `u` - enables Unicode specific patterns like `\p` snf causes character classes like `\w`, `\s` etc. to also match Unicode.

```elixir
"this is a TEST" =~ ~r/test/i
# => true
```

[sigils]: https://hexdocs.pm/elixir/syntax-reference.html#sigils
[website-regex-info]: https://www.regular-expressions.info
[website-rexegg]: https://www.rexegg.com/
[website-regexone]: https://regexone.com/
[website-regex-101]: https://regex101.com/
[website-regexr]: https://regexr.com/

## Instructions

After a recent security review you have been asked to clean up the organization's archived log files.

## 1. Identify garbled log lines

You need some idea of how many log lines in your archive do not comply with current standards.
You believe that a simple test reveals whether a log line is valid.
To be considered valid a line should begin with one of the following strings:

- [DEBUG]
- [INFO]
- [WARNING]
- [ERROR]

Implement the `valid_line?/1` function to return `true` if the log line is valid.

```elixir
LogParser.valid_line?("[ERROR] Network Failure")
# => true

LogParser.valid_line?("Network Failure")
# => false
```

## 2. Split the log line

Shorting after starting the log parsing project, you realize that one application's logs aren't split into lines like the others. In this project, what should have been separate lines, is instead on a single line, connected by fancy arrows such as `<--->` or `<*~*~>`.

In fact, any string that has a first character of `<`, a last character of `>`, and any combination of the following characters `~`, `*`, `=`, and `-` in between can be used as a separator in this project's logs.

Implement the `split_line/1` function that takes a line and returns a list of strings.

```elixir
LogParser.split_line("[INFO] Start.<*>[INFO] Processing...<~~~>[INFO] Success.")
# => ["[INFO] Start.", "[INFO] Processing...", "[INFO] Success."]
```

## 3. Remove artifacts from log

You have found that some upstream processing of the logs has been scattering the text "end-of-line" followed by a line number (without an intervening space) throughout the logs.

Implement the `remove_artifacts/1` function to take a string and remove all occurrence end-of-line text and return a clean log line.

Lines not containing end-of-line text should be returned unmodified.

Just remove the end of line string, there's no need to adjust the whitespaces.

```elixir
LogParser.remove_artifacts("[WARNING] end-of-line23033 Network Failure end-of-line27")
# => "[WARNING]  Network Failure "
```

## 4. Tag lines with user names

You have noticed that some of the log lines include sentences that refer to users.
These sentences always contain the string `"User"`, followed by one or more whitespace characters, and then a user name.
You decide to tag such lines.

Implement a function `tag_with_user_name/1` that processes log lines:

- Lines that do not contain the string `"User"` remain unchanged.
- For lines that contain the string `"User"`, prefix the line with `[USER]` followed by the user name.

```elixir
LogParser.tag_with_user_name("[INFO] User Alice created a new project")
# => "[USER] Alice [INFO] User Alice created a new project"
```

You can assume that:

- Each occurrence of the string `"User"` is followed by one or more whitespace character and the user name.
- There is at most one occurrence of the string `"User"` on each line.
- User names are non-empty strings that do not contain whitespace.

## Source

### Created by

- @angelikatyborska