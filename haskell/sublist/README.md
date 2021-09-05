# Sublist

Welcome to Sublist on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given two lists determine if the first list is contained within the second
list, if the second list is contained within the first list, if both lists are
contained within each other or if none of these are true.

Specifically, a list A is a sublist of list B if by dropping 0 or more elements
from the front of B and 0 or more elements from the back of B you get a list
that's completely equal to A.

Examples:

 * A = [1, 2, 3], B = [1, 2, 3, 4, 5], A is a sublist of B
 * A = [3, 4, 5], B = [1, 2, 3, 4, 5], A is a sublist of B
 * A = [3, 4], B = [1, 2, 3, 4, 5], A is a sublist of B
 * A = [1, 2, 3], B = [1, 2, 3], A is equal to B
 * A = [1, 2, 3, 4, 5], B = [2, 3, 4], A is a superlist of B
 * A = [1, 2, 4], B = [1, 2, 3, 4, 5], A is not a superlist of, sublist of or equal to B

The type
[`Ordering`](http://hackage.haskell.org/package/base/docs/Data-Ord.html#t:Ordering)
has three constructors, `LT` ("less than"), `EQ` ("equals") and `GT` ("greater
than"). These can represent sublist ordering with `Just LT` meaning "sublist",
and so on, and `Nothing` meaning not a sublist, superlist or equal to.

## Source

### Created by

- @etrepum

### Contributed to by

- @iHiD
- @kytrinyx
- @lpalma
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @tejasbubane