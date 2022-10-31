# Booking up for Beauty

Welcome to Booking up for Beauty on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A `DateTime` in F# is an immutable object that contains both date _and_ time information. `DateTime` instances are manipulated by calling their methods. Once a `DateTime` has been constructed, its value can never change. Any methods/functions that appear to modify a `DateTime` will actually return a new `DateTime`.

The textual representation of dates and times is dependent on the _culture_. Consider a `DateTime` with its date set to March 28 2019 and its time set to 14:30:59. Converting this `DateTime` to a `string` when using the `en-US` culture (American English) returns `"3/28/19 2:30:59 PM"`. When using the `fr-BE` culture (Belgian French), the same code returns a different value: `"28/03/19 14:30:59"`.

Understanding which `DateTime` methods are culture-dependent is important to know. In general, any `DateTime` method that deals with `string`s (either as input or output) will be dependent on the current culture.

## Instructions

In this exercise you'll be working on an appointment scheduler for a beauty salon in New York that opened on September 15th in 2012.

You have four tasks, which will all involve appointment dates. The dates and times will use one of the following three formats:

- `"7/25/2019 13:45:00"`
- `"July 25, 2019 13:45:00"`
- `"Thursday, July 25, 2019 13:45:00:00"`

~~~~exercism/caution
The tests will automatically set the culture to `en-US` - you don't have to set or specify the culture yourselves.
~~~~

## 1. Parse appointment date

Implement the `schedule` function that can parse a textual representation of an appointment date into the corresponding `DateTime` format:

```fsharp
schedule "7/25/2019 13:45:00"
// => DateTime(2019, 7, 25, 13, 45, 0)
```

## 2. Check if an appointment has already passed

Implement the `hasPassed` function that takes an appointment date and checks if the appointment was somewhere in the past:

```fsharp
hasPassed (DateTime(1999, 12, 31, 9, 0, 0))
// => true
```

## 3. Check if appointment is in the afternoon

Implement the `isAfternoonAppointment` function that takes an appointment date and checks if the appointment is in the afternoon (>= 12:00 and < 18:00):

```fsharp
isAfternoonAppointment (DateTime(2019, 03, 29, 15, 0, 0))
// => true
```

## 4. Describe the time and date of the appointment

Implement the `description` function that takes an appointment date and returns a description of that date and time:

```fsharp
description (DateTime(2019, 03, 29, 15, 0, 0))
// => "You have an appointment on 3/29/2019 3:00:00 PM."
```

## 5. Return the anniversary date

Implement the `anniversaryDate` function that returns this year's anniversary date, which is September 15th:

```fsharp
anniversaryDate()
// => DateTime(2019, 9, 15, 0, 0, 0)
```

## Source

### Created by

- @ErikSchierboom