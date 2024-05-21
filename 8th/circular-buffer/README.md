# Circular Buffer

Welcome to Circular Buffer on Exercism's 8th Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

A circular buffer, cyclic buffer or ring buffer is a data structure that uses a single, fixed-size buffer as if it were connected end-to-end.

A circular buffer first starts empty and of some predefined length.
For example, this is a 7-element buffer:

```text
[ ][ ][ ][ ][ ][ ][ ]
```

Assume that a 1 is written into the middle of the buffer (exact starting location does not matter in a circular buffer):

```text
[ ][ ][ ][1][ ][ ][ ]
```

Then assume that two more elements are added — 2 & 3 — which get appended after the 1:

```text
[ ][ ][ ][1][2][3][ ]
```

If two elements are then removed from the buffer, the oldest values inside the buffer are removed.
The two elements removed, in this case, are 1 & 2, leaving the buffer with just a 3:

```text
[ ][ ][ ][ ][ ][3][ ]
```

If the buffer has 7 elements then it is completely full:

```text
[5][6][7][8][9][3][4]
```

When the buffer is full an error will be raised, alerting the client that further writes are blocked until a slot becomes free.

When the buffer is full, the client can opt to overwrite the oldest data with a forced write.
In this case, two more elements — A & B — are added and they overwrite the 3 & 4:

```text
[5][6][7][8][9][A][B]
```

3 & 4 have been replaced by A & B making 5 now the oldest data in the buffer.
Finally, if two elements are removed then what would be returned is 5 & 6 yielding the buffer:

```text
[ ][ ][7][8][9][A][B]
```

Because there is space available, if the client again uses overwrite to store C & D then the space where 5 & 6 were stored previously will be used not the location of 7 & 8.
7 is still the oldest element and the buffer is once again full.

```text
[C][D][7][8][9][A][B]
```

This exercise introduces a couple of concepts you might not have seen before:

## User-defined namespace

Words in 8th all belong to a namespace, e.g. `a:new` refers to the `new` word in the `a` namespace.
One can also define custom namespaces, which is what we do at the top of the `circular-buffer.8th` file:

```8th
ns: cb
```

This means that all words within that file can be accessed via `cb:<word>`, which is a great way to group related functionality.

For more information, check out the [namespaces][namespaces] documentation.

## Exceptions

The `read` and `write` words are both expected to throw an exception when they're called on a circular buffer with an invalid state.
For more information, check the [exceptions and error handling][exceptions-and-error-handling] documentation.

## Objects

While you're free to implement the circular buffer as you like, you could consider using 8th's [object support][objects].

[namespaces]: https://8th-dev.com/manual.html#namespaces
[exceptions-and-error-handling]: https://8th-dev.com/manual.html#exceptions-and-error-handling
[objects]: https://8th-dev.com/manual.html#objects

## Source

### Created by

- @erikschierboom

### Based on

Wikipedia - https://en.wikipedia.org/wiki/Circular_buffer