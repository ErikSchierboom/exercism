# Series

Welcome to Series on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given a string of digits, output all the contiguous substrings of length `n` in
that string in the order that they appear.

For example, the string "49142" has the following 3-digit series:

- "491"
- "914"
- "142"

And the following 4-digit series:

- "4914"
- "9142"

And if you ask for a 6-digit series from a 5-digit string, you deserve
whatever you get.

Note that these series are only required to occupy *adjacent positions*
in the input; the digits need not be *numerically consecutive*.

In this exercise you're practicing iterating over an array, meaning: executing an operation on each element of an array. Ruby has many useful built-in methods for iterations. Take a look at [this article](http://jeromedalbert.com/ruby-how-to-iterate-the-right-way/).

Most of the methods listed in the article are not methods specifically for Array, but come from [Enumerable](https://ruby-doc.org/core/Enumerable.html). The article doesn't list iterating over _consecutive elements_. The first challenge is to find a method that does.

## Source

### Created by

- @kytrinyx

### Contributed to by

- @budmc29
- @emcoding
- @hilary
- @iHiD
- @Insti
- @jeporcher
- @kotp
- @mikegehard
- @pgaspar
- @stevensonmt
- @tryantwit

### Based on

A subset of the Problem 8 at Project Euler - http://projecteuler.net/problem=8