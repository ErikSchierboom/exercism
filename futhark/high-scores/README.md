# High Scores

Welcome to High Scores on Exercism's Futhark Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Manage a game player's High Score list.

Your task is to build a high-score component of the classic Frogger game, one of the highest selling and most addictive games of all time, and a classic of the arcade era.
Your task is to write methods that return the highest score from the list, the last added score and the three highest scores.

## Sorting package

This exercise requires you to sort an array, but this isn't built into the standard library.
You could write your own sorting library, but a better option is to use the [sorts package](https://github.com/diku-dk/sorts).

You can use this package in your solution by running the following command in the solution directory:

```shell
futhark pkg add github.com/diku-dk/sorts
futhark pkg sync
```

Then, import your [desired sorting algoritms](https://github.com/diku-dk/sorts/tree/master/lib/github.com/diku-dk/sorts) via:

```futhark
import "lib/github.com/diku-dk/sorts/<sorting algorithm>"
```

## Source

### Created by

- @erikschierboom

### Based on

Tribute to the eighties' arcade game Frogger