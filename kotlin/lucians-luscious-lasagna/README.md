# Lucian's Luscious Lasagna

Welcome to Lucian's Luscious Lasagna on Exercism's Kotlin Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Kotlin is a **statically typed** programming language developed by JetBrains. This means that the type of variables is defined at compile-time.

## Variables

Similarly to other statically-typed programming languages, the type of each variable should be defined at compile time. You can avoid explicit type declarations where they can be inferred by the compiler from their context.

Kotlin has immutable (`val`) and mutable (`var`) variables. The value of an immutable variable can't be changed after it's initial value is assigned. Most of the time you will use this type of variable.

```kotlin
val robotName = "HAL-9000"
userId = "T-1000"  // This will not compile
```

A mutable variable's value can be changed one or more times:

```kotlin
var index = 12
print(index)  // 12

index = 100
print(index)  // 100
```

Semicolons in Kotlin are optional, except for a few special cases that will be covered later.

## Functions

Functions in Kotlin are defined with the `fun` keyword and are _first-class citizens_ (not related to OOP). It means that you can declare (so-called `top-level functions`) them right in files (e.g. in Java you can define methods only in classes, not in files):

```kotlin
// This is content of the Hello.kt file

fun hello() {}
```

Functions can receive arguments. Each argument has a name and a type. Unlike variables, the type of arguments can't be inferred. Functions can have zero or more arguments:

```kotlin
fun hello() {}

fun hello(name: String) {}

fun hello(name: String, age: Int) {}
```

Kotlin functions might or might not return a value:

```kotlin
fun min(a: Int, b: Int): Int

fun countBonuses(user: User): Bonuses

fun run() {}
```

To return a value from a function, the `return` keyword is used:

```kotlin
fun getName(): String {
    return "Alice"
}
```

Functions can have parameters with default values. These values will be used if they are omitted where function is invoked:

```kotlin
fun ping(host: String = "localhost") {
    println("PING --> $host")
}

ping("exercism.io")  // PING --> exercism.io
ping()               // PING --> localhost
```

## Comments

Use `//` to define single-line comment:

```kotlin
foo() // Everything after `//` will be ignored by compiler

// I will be ignored too
```

or `/*` and `*/` to define multi-line comments:

```kotlin
/*
   This this an example
   for a multiline comment
*/
```

## Instructions

The owner of your local pizza place has asked you to help her to calculate cooking times for different pizzas. In this exercise you're going to write few functions to calculate that.

You have three tasks.

## 1. Calculate remaining baking time in minutes

Define and implement the `remainingMinutesInOven()` function that will count how many more minutes you need to keep the pizza in the oven.

The function should accept one **optional** parameter (with default value) for the amount of minutes that passed since you've started baking pizza. If the parameter is missing - assume that you've just put pizza into the oven and **0 (zero)** minutes passed already.

For simplicity - let's assume that all types of pizzas require exactly 40 minutes in the oven to be ready.

```kotlin
remainingMinutesInOven()   // => 40

remainingMinutesInOven(10)   // => 30
```

## 2. Calculate the preparation time in minutes

Before baking the pizza, you need to prepare the dough, roll it out and put toppings onto it.

Define and implement the `preparationTimeInMinutes()` function that will count how many minutes it will take to prepare pizza before putting it into the oven.

The function should accept one **required** parameter (`numberOfIngredientTypes`) for the number of topping ingredient types that will be used.

Assume that you need 5 minutes to make and roll out dough and 2 minutes for using **each** kind of topping.

```kotlin
preparationTimeInMinutes(0) // => 5

preparationTimeInMinutes(1) // => 7
```

## 3. Calculate the elapsed time in minutes

Define and implement the `elapsedCookingTimeInMinutes()` function that will count how many minutes it will take to prepare, bake and serve the pizza. Use the functions from the previous steps while making the calculations.

The function should accept two parameters. The first one is **required** and is the number of topping ingredient types. The second one is **optional** and is the serving time in minutes (assume that is 0 if not provided).

```kotlin
elapsedCookingTimeInMinutes(1)  // => 47

elapsedCookingTimeInMinutes(2, 3)  // => 52
```

## Source

### Created by

- @dector