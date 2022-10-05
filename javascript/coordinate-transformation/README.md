# Coordinate Transformation

Welcome to Coordinate Transformation on Exercism's JavaScript Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

**Closures** are a programming pattern in JavaScript which allows variables from an outer [lexical scope][wiki-lexical-scope] to be used inside of a nested block of code. JavaScript supports closures transparently, and they are often used without knowing what they are.

```javascript
// Top-level declarations are global-scope
const dozen = 12;

{
  // Braces create a new block-scope
  // Referencing the outer variable is a closure.
  const twoDozen = dozen * 2;
}

// Functions create a new function-scope and block-scope.
// Referencing the outer variable here is a closure.
function nDozen(n) {
  return dozen * n;
}
```

## Closures to save state and pass along values

Using a mutable variable declaration (like `let` or `var`) allows for some state to be preserved:

```javascript
let counter = 0;

// This function closure increments the counter's state in the outer lexical context.
// This way the counter can be shared between many calling contexts.
export function increment() {
  counter += 1;
  return counter;
}
```

[wiki-lexical-scope]: https://en.wikipedia.org/wiki/Scope_(computer_science)#Lexical_scoping

## Instructions

Your design company has primarily been working with CSS transformations to build web pages. After some discussion, a decision is made
to start using JavaScript to perform some calculations dynamically. Some of your teammates are less experienced with JavaScript,
so you decide to use a function closure to create reusable transformation for `{x, y}` coordinate pairs.

## 1. Translate the coordinates

Implement the `translate2d` function that returns a function making use of a closure to perform a repeatable 2d translation of a coordinate pair.

```javascript
const moveCoordinatesRight2Px = translate2d(2, 0);
const result = moveCoordinatesRight2Px(4, 8);
// result => [6, 8]
```

## 2. Scale the coordinates

Implement the `scale2d` function that returns a function making use of a closure to perform a repeatable 2d scale of a coordinate pair.

> For this exercise, assume only positive scaling values.

```javascript
const doubleScale = scale2d(2, 2);
const result = doubleScale(6, -3);
// result => [12, -6]
```

## 3. Compose transformation functions

Combine two transformation functions to perform a repeatable transformation. This is often called _function composition_, where the result of the first function _'f(x)'_ is used as the input to the second function _'g(x)'_.

```javascript
const moveCoordinatesRight2Px = translate2d(2, 0);
const doubleCoordinates = scale2d(2, 2);
const composedTransformations = composeTransformation(
  moveCoordinatesRight2Px,
  doubleCoordinates
);
const result = composedTransformations(0, 1);
// result => [4, 2]
```

## 4. Save the results of functions

Implement the `memoizeTransform` function. It takes a function to _memoize_, then returns a new function that remembers the inputs to the supplied function so that the last return value can be "remembered" and only calculated once if it is called again with the same arguments.

> Memoizing is sometimes called _dynamic programming_, it allows for expensive operations to be done only once since their result is remembered.

```javascript
const tripleScale = scale2d(3, 3);
const memoizedScale = memoizeTransform(tripleScale);

memoizedScale(4, 3); // => [12, 9], this is computed since it hasn't been computed before for the arguments
memoizedScale(4, 3); // => [12, 9], this is remembered, since it was computed already
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @SleeplessByte