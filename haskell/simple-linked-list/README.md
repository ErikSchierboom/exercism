# Simple Linked List

Welcome to Simple Linked List on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Write a simple linked list implementation that uses Elements and a List.

The linked list is a fundamental data structure in computer science,
often used in the implementation of other data structures. They're
pervasive in functional programming languages, such as Clojure, Erlang,
or Haskell, but far less common in imperative languages such as Ruby or
Python.

The simplest kind of linked list is a singly linked list. Each element in the
list contains data and a "next" field pointing to the next element in the list
of elements.

This variant of linked lists is often used to represent sequences or
push-down stacks (also called a LIFO stack; Last In, First Out).

As a first take, lets create a singly linked list to contain the range (1..10),
and provide functions to reverse a linked list and convert to and from arrays.

When implementing this in a language with built-in linked lists,
implement your own abstract data type.

To complete this exercise, you need to create the data type `LinkedList`,
and implement the following functions:

- `datum`
- `fromList`
- `isNil`
- `new`
- `next`
- `nil`
- `reverseLinkedList`
- `toList`

You will find a dummy data declaration and type signatures already in place,
but it is up to you to define the functions and create a meaningful data type,
newtype or type synonym.

## Source

### Created by

- @etrepum

### Contributed to by

- @cjlarose
- @iHiD
- @kytrinyx
- @lpalma
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @tejasbubane

### Based on

Inspired by 'Data Structures and Algorithms with Object-Oriented Design Patterns in Ruby', singly linked-lists. - https://web.archive.org/web/20160731005714/http://brpreiss.com/books/opus8/html/page96.html