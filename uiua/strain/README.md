# Strain

Welcome to Strain on Exercism's Uiua Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Implement the `keep` and `discard` operation on collections.
Given a collection and a predicate on the collection's elements, `keep` returns a new collection containing those elements where the predicate is true, while `discard` returns a new collection containing those elements where the predicate is false.

For example, given the collection of numbers:

- 1, 2, 3, 4, 5

And the predicate:

- is the number even?

Then your keep operation should produce:

- 2, 4

While your discard operation should produce:

- 1, 3, 5

Note that the union of keep and discard is all the elements.

The functions may be called `keep` and `discard`, or they may need different names in order to not clash with existing functions or concepts in your language.

## Restrictions

Keep your hands off that filter/reject/whatchamacallit functionality provided by your standard library!
Solve this one yourself using other basic tools instead.

This exercise requires you to call a function that is passed in as an argument.
In Uiua, you can do this via [macros](https://www.uiua.org/tutorial/macros), which is how this exercise expects you to solve it.

```exercism/note
You can immediately see that a binding is a macro due to the `!` suffix.
```

## Source

### Created by

- @erikschierboom

### Based on

Conversation with James Edward Gray II - http://graysoftinc.com/