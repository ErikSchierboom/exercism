# Reverse String

Welcome to Reverse String on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Reverse a string

For example:
input: "cool"
output: "looc"

## Bonus

Preserve grapheme clusters, i.e.

```julia
myreverse("hi 👋🏾") == "👋🏾 ih"
myreverse("as⃝df̅") == "f̅ds⃝a"
```

You will probably find the `Unicode` stdlib useful for this bonus task.

To enable the graphemes test, add `const TEST_GRAPHEMES = true` to the global scope of your file.

## Bonus

Preserve grapheme clusters, i.e.

```julia
myreverse("hi 👋🏾") == "👋🏾 ih"
myreverse("as⃝df̅") == "f̅ds⃝a"
```

You will probably find the `Unicode` stdlib useful for this bonus task.

To enable the graphemes test, add `const TEST_GRAPHEMES = true` to the global scope of your file.

## Source

### Created by

- @kimttfung

### Contributed to by

- @cmcaine
- @SaschaMann

### Based on

Introductory challenge to reverse an input string - https://medium.freecodecamp.org/how-to-reverse-a-string-in-javascript-in-3-different-ways-75e4763c68cb