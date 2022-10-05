# Date Parser

Welcome to Date Parser on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Regular Expressions

Regular expressions (regex) are a powerful tool for working with strings in Elixir. Regular expressions in Elixir follow the **PCRE** specification (**P**erl **C**ompatible **R**egular **E**xpressions). String patterns representing the regular expression's meaning are first compiled then used for matching all or part of a string.

In Elixir, the most common way to create regular expressions is using the `~r` sigil. Sigils provide _syntactic sugar_ shortcuts for common tasks in Elixir. To match a _string literal_, we can use the string itself as a pattern following the sigil.

```elixir
~r/test/
```

The `=~/2` operator is useful to perform a regex match on a string to return a `boolean` result.

```elixir
"this is a test" =~ ~r/test/
# => true
```

Two notes about using sigils:

- many different delimiters may be used depending on your requirements rather than `/`
- string patterns are already _escaped_, when writing the pattern as a string not using a regex, you will have to _escape_ backslashes (`\`)

### Character classes

Matching a range of characters using square brackets `[]` defines a _character class_. This will match any one character to the characters in the class. You can also specify a range of characters like `a-z`, as long as the start and end represent a contiguous range of code points.

```elixir
regex = ~r/[a-z][ADKZ][0-9][!?]/
"jZ5!" =~ regex
# => true
"jB5?" =~ regex
# => false
```

_Shorthand character classes_ make the pattern more concise. For example:

- `\d` short for `[0-9]` (any digit)
- `\w` short for `[A-Za-z0-9_]` (any 'word' character)
- `\s` short for `[ \t\r\n\f]` (any whitespace character)

When a _shorthand character class_ is used outside of a sigil, it must be escaped: `"\\d"`

### Alternations

_Alternations_ use `|` as a special character to denote matching one _or_ another

```elixir
regex = ~r/cat|bat/
"bat" =~ regex
# => true
"cat" =~ regex
# => true
```

### Quantifiers

_Quantifiers_ allow for a repeating pattern in the regex. They affect the group preceding the quantifier.

- `{N, M}` where `N` is the minimum number of repetitions, and `M` is the maximum
- `{N,}` match `N` or more repetitions
  - `{0,}` may also be written as `*`: match zero-or-more repetitions
  - `{1,}` may also be written as `+`: match one-or-more repetitions
- `{,N}` match up to `N` repetitions

### Groups

Round brackets `()` are used to denote _groups_ and _captures_. The group may also be _captured_ in some instances to be returned for use. In Elixir, these may be named or un-named. Captures are named by appending `?<name>` after the opening parenthesis. Groups function as a single unit, like when followed by _quantifiers_.

```elixir
regex = ~r/(h)at/
Regex.replace(regex, "hat", "\\1op")
# => "hop"

regex = ~r/(?<letter_b>b)/
Regex.scan(regex, "blueberry", capture: :all_names)
# => [["b"], ["b"]]
```

### Anchors

_Anchors_ are used to tie the regular expression to the beginning or end of the string to be matched:

- `^` anchors to the beginning of the string
- `$` anchors to the end of the string

### Interpolation

Because the `~r` is a shortcut for `"pattern" |> Regex.escape() |> Regex.compile!()`, you may also use string interpolation to dynamically build a regular expression pattern:

```elixir
anchor = "$"
regex = ~r/end of the line#{anchor}/
"end of the line?" =~ regex
# => false
"end of the line" =~ regex
# => true
```

## Instructions

You have been tasked to write a service which ingests events. Each event has a date associated with it, but you notice that 3 different formats are being submitted to your service's endpoint:

- `"01/01/1970"`
- `"January 1, 1970"`
- `"Thursday, January 1, 1970"`

You can see there are some similarities between each of them, and decide to write some composable regular expression patterns.

## 1. Match the day, month, and year from a date

Implement `day/0`, `month/0`, and `year/0` to return a string pattern which, when compiled, would match the numeric components in `"01/01/1970"` (`dd/mm/yyyy`). The day and month may appear as `1` or `01` (left padded with zeroes).

```elixir
"31" =~ DateParser.day() |> Regex.compile!()
# => true
"12" =~ DateParser.month() |> Regex.compile!()
# => true
"1970" =~ DateParser.year() |> Regex.compile!()
# => true
```

## 2. Match the day of the week and the month of the year

Implement `day_names/0` and `month_names/0` to return a string pattern which, when compiled, would match the named day of the week and the named month of the year respectively.

```elixir
"Tuesday" =~ DateParser.day_names() |> Regex.compile!()
# => true
"June" =~ DateParser.month_names() |> Regex.compile!()
# => true
```

## 3. Capture the day, month, and year

Implement `capture_day/0`, `capture_month/0`, `capture_year/0`, `capture_day_name/0`, `capture_month_name/0` to return a string pattern which captures the respective components to the names: `"day"`, `"month"`, `"year"`, `"day_name"`, `"month_name"`

```elixir
DateParser.capture_month_name()
|> Regex.compile!()
|> Regex.named_captures("December")
# => %{"month_name" => "December"}
```

## 4. Combine the captures to capture the whole date

Implement `capture_numeric_date/0`, `capture_month_name_date()`, and `capture_day_month_name_date/0` to return a string pattern which captures the components from part 3 using the respective date format:

- numeric date - `"01/01/1970"`
- month name date - `"January 1, 1970"`
- day month name date - `"Thursday, January 1, 1970"`

```elixir
DateParser.capture_numeric_date()
|> Regex.compile!()
|> Regex.named_captures("01/01/1970")
# => %{"day" => "01", "month" => "01", "year" => "1970"}
```

## 5. Narrow the capture to match only on the date

Implement `match_numeric_date/0`, `match_month_name_date/0`, and `match_day_month_name_date/0` to return a compiled regular expression that only matches the date, and which can also capture the components.

```elixir
"Thursday, January 1, 1970 was the Unix epoch." =~ DateParser.match_day_month_name_date()
# => false
"Thursday, January 1, 1970" =~ DateParser.match_day_month_name_date()
# => true

DateParser.match_day_month_name_date()
|> Regex.named_captures("Thursday, January 1, 1970")
# => %{
#     "day" => "1",
#     "day_name" => "Thursday",
#     "month_name" => "January",
#     "year" => "1970"
#   }
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @Cohen-Carlisle