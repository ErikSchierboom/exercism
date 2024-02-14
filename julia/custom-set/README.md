# Custom Set

Welcome to Custom Set on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Create a custom set type.

Sometimes it is necessary to define a custom data structure of some
type, like a set. In this exercise you will define your own set. How it
works internally doesn't matter, as long as it behaves like a set of
unique elements.

The tests require a constructor that takes an array. The internals of your custom set implementation can use other data structures but you may have to implement an outer constructor that takes exactly one array for the tests to pass.

Certain methods have a unicode operator equivalent. E.g. `intersect(CustomSet([1, 2, 3, 4]), CustomSet([]))` is equivalent to `CustomSet([1, 2, 3, 4]) ∩ CustomSet([])`.

## Source

### Created by

- @SaschaMann