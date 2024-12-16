# Meetup

Welcome to Meetup on Exercism's Uiua Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

Every month, your partner meets up with their best friend.
Both of them have very busy schedules, making it challenging to find a suitable date!
Given your own busy schedule, your partner always double-checks potential meetup dates with you:

- "Can I meet up on the first Friday of next month?"
- "What about the third Wednesday?"
- "Maybe the last Sunday?"

In this month's call, your partner asked you this question:

- "I'd like to meet up on the teenth Thursday; is that okay?"

Confused, you ask what a "teenth" day is.
Your partner explains that a teenth day, a concept they made up, refers to the days in a month that end in '-teenth':

- 13th (thirteenth)
- 14th (fourteenth)
- 15th (fifteenth)
- 16th (sixteenth)
- 17th (seventeenth)
- 18th (eighteenth)
- 19th (nineteenth)

As there are also seven weekdays, it is guaranteed that each day of the week has _exactly one_ teenth day each month.

Now that you understand the concept of a teenth day, you check your calendar.
You don't have anything planned on the teenth Thursday, so you happily confirm the date with your partner.

## Instructions

Your task is to find the exact date of a meetup, given a month, year, weekday and week.

There are five week values to consider: `first`, `second`, `third`, `fourth`, `last`, `teenth`.

For example, you might be asked to find the date for the meetup on the first Monday in January 2018 (January 1, 2018).

Similarly, you might be asked to find:

- the third Tuesday of August 2019 (August 20, 2019)
- the teenth Wednesday of May 2020 (May 13, 2020)
- the fourth Sunday of July 2021 (July 25, 2021)
- the last Thursday of November 2022 (November 24, 2022)
- the teenth Saturday of August 1953 (August 15, 1953)

## Teenth

The teenth week refers to the seven days in a month that end in '-teenth' (13th, 14th, 15th, 16th, 17th, 18th and 19th).

If asked to find the teenth Saturday of August, 1953, we check its calendar:

```plaintext
    August 1953
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
```

From this we find that the teenth Saturday is August 15, 1953.

## Source

### Created by

- @erikschierboom

### Based on

Jeremy Hinegardner mentioned a Boulder meetup that happens on the Wednesteenth of every month