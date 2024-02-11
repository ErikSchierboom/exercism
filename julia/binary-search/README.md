# Binary Search

Welcome to Binary Search on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

You have stumbled upon a group of mathematicians who are also singer-songwriters.
They have written a song for each of their favorite numbers, and, as you can imagine, they have a lot of favorite numbers (like [0][zero] or [73][seventy-three] or [6174][kaprekars-constant]).

You are curious to hear the song for your favorite number, but with so many songs to wade through, finding the right song could take a while.
Fortunately, they have organized their songs in a playlist sorted by the title — which is simply the number that the song is about.

You realize that you can use a binary search algorithm to quickly find a song given the title.

[zero]: https://en.wikipedia.org/wiki/0
[seventy-three]: https://en.wikipedia.org/wiki/73_(number)
[kaprekars-constant]: https://en.wikipedia.org/wiki/6174_(number)

## Instructions

Your task is to implement a binary search algorithm.

A binary search algorithm finds an item in a list by repeatedly splitting it in half, only keeping the half which contains the item we're looking for.
It allows us to quickly narrow down the possible locations of our item until we find it, or until we've eliminated all possible locations.

~~~~exercism/caution
Binary search only works when a list has been sorted.
~~~~

The algorithm looks like this:

- Find the middle element of a sorted list and compare it with the item we're looking for.
- If the middle element is our item, then we're done!
- If the middle element is greater than our item, we can eliminate that element and all the elements **after** it.
- If the middle element is less than our item, we can eliminate that element and all the elements **before** it.
- If every element of the list has been eliminated then the item is not in the list.
- Otherwise, repeat the process on the part of the list that has not been eliminated.

Here's an example:

Let's say we're looking for the number 23 in the following sorted list: `[4, 8, 12, 16, 23, 28, 32]`.

- We start by comparing 23 with the middle element, 16.
- Since 23 is greater than 16, we can eliminate the left half of the list, leaving us with `[23, 28, 32]`.
- We then compare 23 with the new middle element, 28.
- Since 23 is less than 28, we can eliminate the right half of the list: `[23]`.
- We've found our item.

## Behaviour

Your solution should match the behaviour of Julia's built-in `searchsorted` functions for the test cases.
This means that, instead of returning the index of the first matching element that you find in the list, you will return a range whose lower bound is the index of the first matching element in the list and whose upper bound is the index of the last matching element in the list.
However, **to simplify your solution you may assume that the target element is not repeated**, except for the bonus task testset on multiple matches.

If the searched-for item is not in the list you must return an empty range whose lower bound is the index at which the item could be inserted into the sorted list. An empty range is any range where the upper bound is less than the lower bound.

Please read the documentation and examples for the `searchsorted` function for more details:

```
searchsorted(a, x; by=<transform>, lt=<comparison>, rev=false)

Return the range of indices of a which compare as equal to x (using binary
search) according to the order specified by the by, lt and rev keywords,
assuming that a is already sorted in that order.
Return an empty range located at the insertion point if a does not contain
values equal to x.

See also: insorted, searchsortedfirst, sort, findall.

Examples

julia> searchsorted([1, 2, 4, 5, 5, 7], 4) # single match
3:3

julia> searchsorted([1, 2, 4, 5, 5, 7], 5) # multiple matches
4:5

julia> searchsorted([1, 2, 4, 5, 5, 7], 3) # no match, insert in the middle
3:2

julia> searchsorted([1, 2, 4, 5, 5, 7], 9) # no match, insert at end
7:6

julia> searchsorted([1, 2, 4, 5, 5, 7], 0) # no match, insert at start
1:0
```

## Bonus tasks

- Extend your solution to support the keyword arguments `by`, `lt` and `rev` so that `by` specifies a
  transformation applied to all elements of the list, `lt` specifies a
  comparison and `rev` specifies if the list is ordered in reverse. When these
  parameters are used you must assume that the list has already been sorted
  using these parameters. See the docs for `sort` for more details.
- Support lists where the target element is repeated (find the first and last index that the target element compares equal to).

## Source

### Created by

- @SaschaMann

### Contributed to by

- @tomerarnon

### Based on

Wikipedia - http://en.wikipedia.org/wiki/Binary_search_algorithm