# Pizza Order

Welcome to Pizza Order on Exercism's JavaScript Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The ability for something to be defined in terms of itself is called recursion.
Recursive functions are functions that call themselves.

Suppose that you have a function called `recurse`.
This function is recursive if it calls itself inside its body, like this:

```js
function recurse() {
  // ...
  recurse();
  // ...
}
```

A recursive function usually has a condition to stop calling itself and return a value, known as a _base case_.
If a base case is missing, in most cases, because it will call itself indefinitely, it would be able to run forever.
In reality, in most of those situations, you'll end up with a "StackSize error": an error raised by the runtime because the _stack_ of function calls has grown beyond a predefined limit because each recursive call adds to this _stack_ until it returns (and it doesn't).
The message of this error is `Maximum call stack size exceeded`.

```js
function recurse() {
  if (baseCondition) {
    // stop calling itself
    //...
  } else {
    recurse();
  }
}
```

Recursive functions often can be used instead of `for` loops for more succinct code.
For example, take a countdown.
Here's the more intuitive `for` loop approach:

```js
function countDown(fromNumber) {
  for (let i = fromNumber; i > 0; i--) {
    console.log(i);
  }
}

countDown(3); // 3, 2, 1 in separate lines
```

We could solve this using recursion too:

```js
function countDown(fromNumber) {
  console.log(fromNumber);
  if (fromNumber > 1) {
    countDown(fromNumber - 1);
  }
}

countDown(3); // same result
```

Here, our base case is when `fromNumber` is 1, in which case we don't call `countDown` again.

Apart from just displaying numbers, recursive functions can be used for more complicated procedures, such as keeping a sum or total.

```js
function sum(n) {
  if (n <= 1) {
    return n;
  }
  return n + sum(n - 1);
}

sum(3); // 6
```

## Instructions

You run a pizza shop, and offer three types of pizzas:

- Margherita: $7
- Caprese: $9
- Formaggio: $10

If customers want, they can add an unlimited number of extra options: either "ExtraSauce" for $1 or "ExtraToppings" for $2.

Your task is to write code that assists the customer in figuring out the cost to them.

## Calculate the price of a pizza

Provided the pizza's name as the first argument, and an unlimited number of added options, calculate the price of the pizza in dollars.

```js
pizzaPrice('Margherita');
// => 7

pizzaPrice('Caprese', 'ExtraSauce', 'ExtraToppings');
// => 12

pizzaPrice(
  'Caprese',
  'ExtraToppings',
  'ExtraToppings',
  'ExtraToppings',
  'ExtraToppings',
);
// => 17
```

## Calculate the total price of an order

Your function is called with a list of `PizzaOrder`s and should return the total price of the order in dollars.
Each `PizzaOrder` has a `pizza` property - the pizza's name, and an `extras` property - the list of extra options.

```js
const margherita = new PizzaOrder('Margherita');
const caprese = new PizzaOrder('Caprese', 'ExtraToppings');
orderPrice([margherita, caprese]);
// => 18
```

You'll realize that you can't write this using recursion, as one test with a tremendous amount of orders will raise a `Maximum call stack size exceeded`.
No worries, this is intentional - try implementing this function using an imperative loop!
You have many options, such as, but not limited to using `reduce` or a `for` loop.

<!-- prettier-ignore-start -->
~~~~exercism/advanced
When the JavaScript interpreter is running the JavaScript code, it will keep track of which functions it has entered (started to call) on a data structure called "a stack".
When the function returns (ends), it is removed from the stack.

However, this stack has a limited size.
The most common mistake made is a recursive function that never ends.
Each call is placed on the stack, but before it returns, another call is placed on the stack.

```javascript
function kaboom() {
  kaboom()
}

kaboom()
// => RangeError: Maximum call stack size exceeded
```

The stacktrace of this error shows the same line over and over, which makes sense, because the function calls itself.
Whilst it has no real practical application in most cases, you can find out how tall that stack can get.

```javascript
let calls = 0;
function kaboom() {
  calls +=1 ;
  kaboom()
}

kaboom()
// => RangeError: Maximum call stack size exceeded

console.log(calls)
// => a number, generally higher than 10.000
```

There are only two viable solutions to a call stack error caused by a synchronous recursive function:
- ensure the functions return before the stack limit is reached, usually by adding or fixing a base case.
- rewrite the recursive function to an imperative loop, which will execute the body of the loop, without having to enter a function, thus without increasing the stack.
~~~~
<!-- prettier-ignore-end -->

## Source

### Created by

- @SleeplessByte
- @safwansamsudeen