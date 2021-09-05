# Leap

Welcome to Leap on Exercism's Scala Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

```text
on every year that is evenly divisible by 4
  except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
```

For example, 1997 is not a leap year, but 1996 is.  1900 is not a leap
year, but 2000 is.

## Notes

Though our exercise adopts some very simple rules, there is more to
learn!

For a delightful, four minute explanation of the whole leap year
phenomenon, go watch [this youtube video][video].

[video]: http://www.youtube.com/watch?v=xX96xng7sAE

Try to avoid code repetition, use private helper functions if you can.

And you might consider using a single `Boolean` expression instead of `if-else` for better readability. See [here](http://cs.wellesley.edu/~cs111/spring00/lectures/boolean-simplification.html) on how this could be done (the link is for Java, but of course the logic is valid for Scala, too).

## Source

### Created by

- @sgrif

### Contributed to by

- @abo64
- @ErikSchierboom
- @kytrinyx
- @ppartarr
- @rajeshpg
- @ricemery

### Based on

JavaRanch Cattle Drive, exercise 3 - http://www.javaranch.com/leap.jsp