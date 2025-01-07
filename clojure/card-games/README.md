# Card Games

Welcome to Card Games on Exercism's Clojure Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In Clojure, Lists are [collections][type-collection], just like [lists in other languages][type-list]. Similar to other languages in the Lisp family, Clojure uses parentheses to express lists.

Clojure lists can be created in one of two ways. The `list` function can create a list, or you can `quote` a literal list.

Lists are special because Clojure will treat them as _calls_. It expects the call to start with an _operator_, which is usually a function. The remaining items of the list are considered _operands_, meaning they become the function's arguments.

Clojure's special treatment of lists is why we cannot create a list literal directly. Quoting a list using `quote` or its shorthand `'` indicates that the list should not be evaluated.

Unlike some modern languages, Clojure lists are _heterogeneous_, meaning they can contain multiple types of items internally e.g., `'(2 "a" "b" 3)`.
Unlike other Lisps, an empty list in Clojure is truthy and is not equivalent to `nil` or `false`.

[type-list]: https://github.com/exercism/v3/blob/main/reference/types/list.md
[type-collection]: https://github.com/exercism/v3/blob/main/reference/types/collection.md

## Instructions

Elyse is really looking forward to playing some poker (and other card games) during her upcoming trip to Vegas.
 Being a big fan of "self-tracking" she wants to put together some small functions that will help her with tracking tasks and has asked for your help thinking them through.

## 1. Tracking Poker Rounds

Elyse is especially fond of poker, and wants to track how many rounds she plays - and _which rounds_ those are.
 Every round has its own number, and every table shows the round number currently being played.
 Elyse chooses a table and sits down to play her first round. She plans on playing three rounds.

Implement a function `rounds` that takes the current round number and returns a single `list` with that round and the _next two_ that are coming up:

```clojure
(rounds 27)
;;=> (27 28 29)
```

## 2. Keeping all Rounds in the Same Place

Elyse played a few rounds at the first table, then took a break and played some more rounds at a second table ... but ended up with a different list for each table!
 She wants to put the two lists together, so she can track all of the poker rounds in the same place.

Implement a function `concat-rounds` that takes two lists and returns a single `list` consisting of all the rounds in the first `list`, followed by all the rounds in the second `list`:

```clojure
(concat-rounds '(27 28 29) '(35 36))
;;=> (27 28 29 35 36)
```

## 3. Finding Prior Rounds

Talking about some of the prior Poker rounds, another player remarks how similarly two of them played out.
 Elyse is not sure if she played those rounds or not.

Implement a function `contains-round?` that takes two arguments, a list of rounds played and a round number.
 The function will return `true` if the round is in the list of rounds played, `false` if not:

```clojure
(contains-round? '(27 28 29 35 36) 29)
;;=> true

(contains-round? '(27 28 29 35 36) 30)
;;=> false
```

## 4. Averaging Card Values

Elyse wants to try out a new game called Black Joe.
 It's similar to Black Jack - where your goal is to have the cards in your hand add up to a target value - but in Black Joe the goal is to get the _average_ of the card values to be 7.
 The average can be found by summing up all the card values and then dividing that sum by the number of cards in the hand.

Implement a function `card-average` that will return the average value of a hand of Black Joe.

```clojure
(card-average '(5 6 7))
;;=> 6.0
```

## 5. Alternate Averages

In Black Joe, speed is important. Elyse is going to try and find a faster way of finding the average.

She has thought of two ways of getting an _average-like_ number:

- Take the average of the _first_ and _last_ number in the hand.
- Using the median (middle card) of the hand.
  
Implement the function `approx-average?`, given `hand`, a list containing the values of the cards in your hand.

Return `true` if either _one_ `or` _both_ of the, above named, strategies result in a number _equal_ to the _actual average_.

Note: _The length of all hands are odd, to make finding a median easier._

```clojure
(approx-average? '(1 2 3))
;;=> true

(approx-average? '(2 3 4 8 8))
;;=> true

(approx-average? '(1 2 3 5 9))
;;=> false
```

## 6. More Averaging Techniques

Intrigued by the results of her averaging experiment, Elyse is wondering if taking the average of the cards at the _even_ positions versus the average of the cards at the _odd_ positions would give the same results.
 Time for another test function!

Implement a function `average-even-odd?` that returns a Boolean indicating if the average of the cards at even indexes is the same as the average of the cards at odd indexes.

```clojure
(average-even-odd? '(1 2 3))
;;=> true

(average-even-odd? '(1 2 3 4))
;;=> false
```

## 7. Bonus Round Rules

Every 11th hand in Black Joe is a bonus hand with a bonus rule: if the last card you draw is a Jack, you double its value.

Implement a function `maybe-double-last` that takes a hand and checks if the last card is a Jack (11).
 If the last card **is** a Jack (11), double its value before returning the hand.

```clojure
(maybe-double-last '(5 9 11))
;;=> '(5 9 22)

(maybe-double-last '(5 9 10))
;;=> '(5 9 10)
```

## Source

### Created by

- @bobbicodes