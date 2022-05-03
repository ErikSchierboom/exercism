# Library Fees

Welcome to Library Fees on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Dates and time

Elixir's standard library offers 4 different modules for working with dates and time, each with its own struct.

- The `Date` module. A `Date` struct can be created with the `~D` sigil.
    ```elixir
    ~D[2021-01-01]
    ```

- The `Time` module. A `Time` struct can be created with the `~T` sigil.
    ```elixir
    ~T[12:00:00]
    ```

- The `NaiveDateTime` module for datetimes without a timezone. A `NaiveDateTime` struct can be created with the `~N` sigil.
    ```elixir
    ~N[2021-01-01 12:00:00]
    ```

- The `DateTime` module for datetimes with a timezone. Using this module for timezones other than UTC requires an external dependency, a timezone database.

### Comparisons

To compare dates or times to one another, look for a `compare` or `diff` function in the corresponding module. Comparison operators such as `==`, `>`, and `<` _seem_ to work, but they don't do a correct semantic comparison for those structs.

## Instructions

Your librarian friend has asked you to extend her library software to automatically calculate late fees.
Her current system stores the exact date and time of a book checkout as an [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime string.
She runs a local library in a small town in Ghana, which uses the GMT timezone (UTC +0), doesn't use daylight saving time, and doesn't need to worry about other timezones.

## 1. Parse the stored datetimes

Implement the `LibraryFees.datetime_from_string/1` function. It should take an ISO8601 datetime string as an argument, and return a `NaiveDateTime` struct.

```elixir
LibraryFees.datetime_from_string("2021-01-01T13:30:45Z")
# => ~N[2021-01-01 13:30:45]
```

## 2. Determine if a book was checked out before noon

If a book was checked out before noon, the reader has 28 days to return it. If it was checked out at or after noon, it's 29 days.

Implement the `LibraryFees.before_noon?/1` function. It should take a `NaiveDateTime` struct and return a boolean.

```elixir
LibraryFees.before_noon?(~N[2021-01-12 08:23:03])
# => true
```

## 3. Calculate the return date

Based on the checkout datetime, calculate the return date.

Implement the `LibraryFees.return_date/1` function. It should take a `NaiveDateTime` struct and return a `Date` struct, either 28 or 29 days later.

```elixir
LibraryFees.return_date(~N[2020-11-28 15:55:33])
# => ~D[2020-12-27]
```

## 4. Determine how late the return of the book was

The library has a flat rate for late returns. To be able to calculate the fee, we need to know how many days after the return date the book was actually returned.

Implement the `LibraryFees.days_late/2` function. It should take a `Date` struct - the planned return datetime, and a `NaiveDateTime` struct - the actual return datetime.

If the actual return date is on an earlier or the same day as the planned return datetime, the function should return 0. Otherwise, the function should return the difference between those two dates in days.

The library tracks both the date and time of the actual return of the book for statistical purposes, but doesn't use the time when calculating late fees.

```elixir
LibraryFees.days_late(~D[2020-12-27], ~N[2021-01-03 09:23:36])
# => 7
```

## 5. Determine if the book was returned on a Monday

The library has a special offer for returning books on Mondays.

Implement the `LibraryFees.monday?/1` function. It should take a `NaiveDateTime` struct and return a boolean.

```elixir
LibraryFees.monday?(~N[2021-01-03 13:30:45Z])
# => false
```

## 6. Calculate the late fee

Implement the `LibraryFees.calculate_late_fee/3` function. It should take three arguments - two ISO8601 datetime strings, checkout datetime and actual return datetime, and the late fee for one day. It should return the total late fee according to how late the actual return of the book was.

Include the special Monday offer. If you return the book on Monday, your late fee is 50% off, rounded down.

```elixir
# Sunday, 7 days late
LibraryFees.calculate_late_fee("2020-11-28T15:55:33Z", "2021-01-03T13:30:45Z", 100)
# => 700

# one day later, Monday, 8 days late
LibraryFees.calculate_late_fee("2020-11-28T15:55:33Z", "2021-01-04T09:02:11Z", 100)
# => 400
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw