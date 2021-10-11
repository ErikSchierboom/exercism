# Pizza Pricing

Welcome to Pizza Pricing on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The ability for something to be defined in terms of itself is called recursion. In F#, recursion is most commonly found in recursive functions, which are functions that call themselves.

A recursive function needs to have at least one _base case_ and at least one _recursive case_. A _base case_ returns a value without calling the function again. A _recursive case_ calls the function again, modifying the input so that it will at some point match the base case.

Recursive functions are defined like regular functions, but with the `rec` modifier. Without this modifier, a function will _not_ be able to call itself and any attempt to do so will result in a compilation error. Recursion thus has to be explicitly opted into.

```fsharp
let rec factorial x =
    // Base case
    if x = 1 then
        1
    // Recursive case
    else
        x * factorial (x - 1)
```

F# also supports recursive types through discriminated union types. A recursive discriminated union type has one or more of its cases refer to the discriminated union type itself in their data. Like recursive functions, recursive types must have a base case. Unlike recursive functions, recursive types don't use the `rec` keyword.

```fsharp
type RussianDoll =
    | Doll                 // Base case
    | Layer of RussianDoll // Recursive case
```

## Instructions

In this exercise you're working at a pizza place that delivers to customers.

You offer three types of pizzas:

- Margherita: \$7
- Caprese: \$9
- Formaggio: \$10

Customers can also choose two additional options for a small additional fee:

1. Extra sauce: \$1
1. Extra toppings: \$2

When customers place and order, an additional fee is added if they only order one or two pizzas:

- 1 pizza: \$3
- 2 pizzas: \$2

You have three tasks, each of which will work with pizzas and their price.

## 1. Define the pizza types and options

Define the `Pizza` discriminated union to represent the pizza types and the two additional options that can be added to a pizza:

- `Margherita`
- `Caprese`
- `Formaggio`
- `ExtraSauce`
- `ExtraToppings`

## 2. Calculate the price of pizza

Implement the `pizzaPrice` function to calculate a pizza's price:

```fsharp
pizzaPrice Caprese
// => 9
```

## 3. Calculate the price of an order

Implement the `orderPrice` function to calculate a pizza order's price:

```fsharp
orderPrice [Margherita; Formaggio]
// => 19
```

## Source

### Created by

- @ErikSchierboom