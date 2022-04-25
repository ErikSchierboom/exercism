# Elyses Destructured Enchantments

Welcome to Elyses Destructured Enchantments on Exercism's JavaScript Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Array destructuring

JavaScript's array destructuring syntax is a concise way to extract values from an array and assign them to distinct variables.

In this example, each value in the `numberOfMoons` array is assigned to its corresponding planet:

```javascript
const numberOfMoons = [0, 2, 14];
const [venus, mars, neptune] = numberOfMoons;

neptune;
// => 14
```

## Rest and spread

JavaScript has a built-in `...` operator that makes it easier to work with indefinite numbers of elements. Depending on the context, it's called either a _rest operator_ or _spread operator_.

### Rest elements

When `...` appears on the left-hand side of an assignment, those three dots are known as the `rest` operator. The three dots together with a variable name is called a rest element. It collects zero or more values, and stores them into a single array.

```javascript
const [a, b, ...everythingElse] = [0, 1, 1, 2, 3, 5, 8];

everythingElse;
// => [1, 2, 3, 5, 8]
```

Note that in JavaScript, unlike some other languages, a `rest` element cannot have a trailing comma. It _must_ be the last element in a destructuring assignment.

### Spread elements

When `...` appears on the right-hand side of an assignment, it's known as the `spread` operator. It expands an array into a list of elements. Unlike the rest element, it can appear anywhere in an array literal expression, and there can be more than one.

```javascript
const oneToFive = [1, 2, 3, 4, 5];
const oneToTen = [...oneToFive, 6, 7, 8, 9, 10];

oneToTen;
// => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

## Instructions

Elyse, magician-to-be, continues her training. She has a deck of cards she wants to manipulate.

To make things easier, she usually only starts with cards numbered 1 to 10, although some of the tricks may involve additional cards.

## 1. Get the first card

Elyse will summon the first card in the deck without using the `array[index]` or `.shift()`. It's just like magic.

```javascript
const deck = [5, 9, 7, 1, 8];

getFirstCard(deck);
// => 5
```

## 2. Get the second card

Elyse performs sleight of hand and summons the second card in the deck without using the `array[index]`.

```javascript
const deck = [3, 2, 10, 6, 7];

getSecondCard(deck);
// => 2
```

## 3. Swap the first two cards

Elyse will make the top two cards of the deck switch places. She doesn't need to call a single function.

```javascript
const deck = [10, 7, 3, 8, 5];

swapTopTwoCards(deck);
// => [7, 10, 3, 8, 5]
```

## 4. Discard the top card

Elyse will separate the deck into two piles. The first pile will contain only the top card of the original deck, while the second pile will contain all the other cards.

```javascript
const deck = [2, 5, 4, 9, 3];

discardTopCard(deck);
// => [2, [5, 4, 9, 3]]
```

## 5. Insert face cards

Elyse will insert a set of face cards (i.e. jack, queen, and king) into her deck such that they become the second, third, and fourth cards, respectively.

```javascript
const deck = [5, 4, 7, 10];

insertFaceCards(deck);
// => [5, 'jack', 'queen', 'king', 4, 7, 10]
```

## Source

### Created by

- @kristinaborn

### Contributed to by

- @SleeplessByte
- @angelikatyborska