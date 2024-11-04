# Saddle Points

Welcome to Saddle Points on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

You plan to build a tree house in the woods near your house so that you can watch the sun rise and set.

You've obtained data from a local survey company that show the height of every tree in each rectangular section of the map.
You need to analyze each grid on the map to find good trees for your tree house.

A good tree is both:

- taller than every tree to the east and west, so that you have the best possible view of the sunrises and sunsets.
- shorter than every tree to the north and south, to minimize the amount of tree climbing.

## Instructions

Your task is to find the potential trees where you could build your tree house.

The data company provides the data as grids that show the heights of the trees.
The rows of the grid represent the east-west direction, and the columns represent the north-south direction.

An acceptable tree will be the largest in its row, while being the smallest in its column.

A grid might not have any good trees at all.
Or it might have one, or even several.

Here is a grid that has exactly one candidate tree.

```text
    1  2  3  4
  |-----------
1 | 9  8  7  8
2 | 5  3  2  4  <--- potential tree house at row 2, column 1, for tree with height 5
3 | 6  6  7  1
```

- Row 2 has values 5, 3, 2, and 4. The largest value is 5.
- Column 1 has values 9, 5, and 6. The smallest value is 5.

So the point at `[2, 1]` (row: 2, column: 1) is a great spot for a tree house.

## Rust Indices Start At 0

By convention, ordered sequences of values in Rust have their contents numbered
("indexed") starting from 0. This applies regardless of what the rest of the
exercise description in this README says, such as references to indices that
start at 1, so you will have to subtract 1 to translate those index numbers
to Rust index numbers.

## Efficiency Notice

This exercise uses a _vector of vectors_ to store the content of matrices. While
this exercise is designed to help students understand basic concepts about
vectors, such as indexing, and that nested data types are legal, _vector of
vectors_ is a suboptimal choice for high-performance matrix algebra and any
similar efficient processing of larger amounts of data.

The detailed explanation of this inefficiency is beyond the scope of this
exercise and this learning track in general. This aspect is known as
[cache locality](https://stackoverflow.com/questions/12065774/why-does-cache-locality-matter-for-array-performance)
and you can find a good introduction to it by clicking that link if you'd like
to learn more about details of a modern computer architecture.

## Source

### Created by

- @hekrause

### Contributed to by

- @bitfield
- @ClashTheBunny
- @coriolinus
- @cwhakes
- @efx
- @Emerentius
- @ErikSchierboom
- @michalfita
- @mtodor
- @murlakatamenka
- @petertseng
- @RiderSargent
- @rofrol
- @scarvalhojr
- @stringparser
- @workingjubilee
- @xakon
- @ZapAnton

### Based on

J Dalbey's Programming Practice problems - https://users.csc.calpoly.edu/~jdalbey/103/Projects/ProgrammingPractice.html