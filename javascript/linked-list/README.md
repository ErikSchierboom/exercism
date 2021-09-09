# Linked List

Welcome to Linked List on Exercism's JavaScript Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Implement a doubly linked list.

Like an array, a linked list is a simple linear data structure. Several
common data types can be implemented using linked lists, like queues,
stacks, and associative arrays.

A linked list is a collection of data elements called _nodes_. In a
_singly linked list_ each node holds a value and a link to the next node.
In a _doubly linked list_ each node also holds a link to the previous
node.

You will write an implementation of a doubly linked list. Implement a
Node to hold a value and pointers to the next and previous nodes. Then
implement a List which holds references to the first and last node and
offers an array-like interface for adding and removing items:

- `push` (_insert value at back_);
- `pop` (_remove value at back_);
- `shift` (_remove value at front_).
- `unshift` (_insert value at front_);

To keep your implementation simple, the tests will not cover error
conditions. Specifically: `pop` or `shift` will never be called on an
empty list.

If you want to know more about linked lists, check [Wikipedia](https://en.wikipedia.org/wiki/Linked_list).

Your list must also implement the following interface:

- `delete` (delete the first occurrence of a specified value)
- `count` (count the number of items in the list)

**NOTE**: Do _not_ use a library to implement this exercise. Do _not_ use a backing array to implement this exercise.

## Source

### Created by

- @matthewmorgan

### Contributed to by

- @ankorGH
- @bdjnk
- @cmccandless
- @jcshih
- @junedev
- @monte-hayward
- @rchavarria
- @ryanplusplus
- @SleeplessByte
- @thanhcng

### Based on

Classic computer science topic