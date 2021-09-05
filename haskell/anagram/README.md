# Anagram

Welcome to Anagram on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

An anagram is a rearrangement of letters to form a new word.
Given a word and a list of candidates, select the sublist of anagrams of the given word.

Given `"listen"` and a list of candidates like `"enlists" "google"
"inlets" "banana"` the program should return a list containing
`"inlets"`.

To complete this exercise you need to implement the function `anagramsFor`,
that takes a *word* and a group of *words*, returning the ones that are
anagrams of the given *word*.

If it is your first time solving this exercise, it is recommended that you
stick to the provided signature:

```haskell
anagramsFor :: String -> [String] -> [String]
```

Later, it may be a good idea to revisit this problem and play with other data
types and libraries:

- `Text`, from package *text*.
- `Sequence` and `Set`, from package *containers*.
- `MultiSet`, from package *multiset*

The test suite was intentionally designed to accept almost any type signature
that makes sense, so you are encouraged to find the one you think is the best.

## Source

### Created by

- @etrepum

### Contributed to by

- @gris
- @iHiD
- @kytrinyx
- @mttakai
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @tejasbubane

### Based on

Inspired by the Extreme Startup game - https://github.com/rchatley/extreme_startup