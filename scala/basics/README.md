# Lucians Luscious Lasagna

Welcome to Lucians Luscious Lasagna on Exercism's Scala Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Defining Variables

Defining a variable means assigning a value to a name. In Scala there are two kinds of variables, vals and vars.

A `val` is immutable, so it's value cannot be changed anymore after the first assignment:

```scala
val numberTen = 10

numberTen = 11
// --> raises a compile error "reassignment to val"
```

A `var`, in contrast, can be reassigned to a new value of same type:

```scala
var someNumber = 10

someNumber = 11
// now someNumber has been reassigned
```

Scala is a statically-typed language, which means that everything has a type at compile-time. A variable can be defined either by explicitly specifying its type, or by letting the Scala compiler infer its type based on the assigned value (known as type inference). Therefore, the following two variable definitions are equivalent:

```scala
val explicitNumber: Int = 10; // Explicitly typed
val implicitNumber = 10; // Implicitly typed
```

Once defined, a variable's type can never change.

```scala
var count = 1; // Assigning an initial value of type Int
count = 2;     // Updating to new value is possible, because it is defined as var

count = false;
// --> raises a compile error "type mismatch"
```

## Defining Methods within Classes

Scala is an _object-oriented language_ and requires all methods to be defined in a _class_. The `class` keyword is used to define a class.

```scala
class Calculator {
  // ...
}
```

Inside a class, methods can be defined starting with keyword `def` followed by a name. Each method can have zero or more parameters, which are listed comma-separated within round brackets. All parameters must be explicitly typed, there is no type inference for parameters. After the list of parameters, the method's return type is defined separated by another colon.

The method definition is followed by an `=` sign to start with the method body. In the following example the method body consists of two statements, which are surrounded by curly braces.

The method will return the value of the last expression, in this case the `add` method returns the value of variable `sum`:

```scala
class Calculator {
  // long form
  def add(x: Int, y: Int): Int = {
    val sum = x + y
    sum
  }
}
```

There are a few improvements, which can be done to shorten that method in order to improve readability:

- since the variable `sum` is accessed only once to return the value, it can be omitted
- methods consisting of only one statement do not need curly braces
- the method's return type can be inferred the same as for variable types

This leads to the following one-line method with same functionality:

```scala
class Calculator {
  // shortened form
  def add(x: Int, y: Int) = x + y
}
```

## Instantiating classes and calling methods

Invoking a method is done by first creating an instance of a class and second to call the method on that instance with arguments:

```scala
val calculator = new Calculator()
val sum = calculator.add(5, 7)
// sum is of type Int with assigned value of 12
```

## Commenting

Scala supports two types of comments, single line comments and multiline comments:

```scala
// this is a single line comment

/*
This comment spans across
multiple lines.
*/
```

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have four tasks, all related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Define the `Lasagna.expectedMinutesInOven()` method that does not take any parameters and returns how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is 40:

```scala
val lasagna = new Lasagna()
lasagna.expectedMinutesInOven()
// => 40
```

## 2. Calculate the remaining oven time in minutes

Define the `Lasagna.remainingMinutesInOven()` method that takes the actual minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

```scala
val lasagna = new Lasagna()
lasagna.remainingMinutesInOven(30)
// => 10
```

## 3. Calculate the preparation time in minutes

Define the `Lasagna.preparationTimeInMinutes()` method that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```scala
val lasagna = new Lasagna()
lasagna.preparationTimeInMinutes(2)
// => 4
```

## 4. Calculate the elapsed time in minutes

Define the `Lasagna.elapsedTimeInMinutes()` method that takes two parameters: the first parameter is the number of layers you added to the lasagna, and the second parameter is the number of minutes the lasagna has been in the oven. The function should return how many minutes you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```scala
var lasagna = new Lasagna()
lasagna.elapsedTimeInMinutes(3, 20)
// => 26
```

## Source

### Created by

- @stillleben