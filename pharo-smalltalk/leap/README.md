# Leap

Welcome to Leap on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

A leap year (in the Gregorian calendar) occurs:

- In every year that is evenly divisible by 4.
- Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly divisible by 400.

Some examples:

- 1997 was not a leap year as it's not divisible by 4.
- 1900 was not a leap year as it's not divisible by 400.
- 2000 was a leap year!

~~~~exercism/note
For a delightful, four-minute explanation of the whole phenomenon of leap years, check out [this YouTube video](https://www.youtube.com/watch?v=xX96xng7sAE).
~~~~

## Instructions

Your task is to determine whether a given year is a leap year.

The tests for this exercise (and future exercises), are prefix numbered like 'test00_'. This is not a normal convention in Pharo, however to ease the study of the language it is useful to present tests in a deterministic order.For this exercise, study the 'arithmetic' method category for class Number, as well as how boolean operators are also defined as messages. Notice how "and:" and "or:" are implented in the classes True and False. You can use the context menu item "senders of..." to view how other parts of Pharo use these operators.You may also find something useful trying... `World > Tools > Finder > Examples > 20 . 4 . true`<br> which is asking Pharo which operations between the first and second elements result in the third.<br> [View demo][demo][demo]: https://github.com/exercism/pharo-smalltalk/raw/master/docs/images/Hint-Finder-Leap.gif

## Source

### Created by

- @macta

### Contributed to by

- @bencoman

### Based on

CodeRanch Cattle Drive, Assignment 3 - https://coderanch.com/t/718816/Leap