# Layers of Lasagna

Welcome to Layers of Lasagna on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Swift is a statically-typed language, which means that every value has a known, fixed type at compile time.

Values can be associated with names by defining a variable or a constant and assigning a value to the constant or variable. That name may then be used to refer to that value throughout the program. As the name implies, a constant is _immutable_ which means that the value cannot be changed. A variable, on the other hand, is _mutable_, which means that the value can be changed at any time.

Variables are defined using the `var` keyword, while constants are defined using the `let` keyword.

```swift
var variableName = 10 // variable
let constantName = 10 // constant
```

The type associated with a variable can be either explicitly specified, or it can be inferred by the compiler based on the assigned value. Therefore, the following two variable definitions are equivalent:

```swift
var explicitVar: Int = 10 // Explicitly typed
var implicitVar = 10 // Implicitly typed
```

Updating a variable's value is done using the `=` operator. Note that the type of that variable, however, is fixed once it is initially defined and like the value associated with a constant, cannot be changed.

```swift
variableName = 13 // update to new value

// compiler error when assigning different type
variableName = "Hello, world!" // Cannot assign value of type 'String' to type 'Int'
```

Constants and variables may be declared without assigning a value by specifying the name and type, but they may not be used before a value is assigned.

```swift
var someInt: Int
let someString: String

// This would trigger a compiler error
// print(someString) // Constant 'someString' used before being initialized
// print(someInt) // Variable 'someInt' used before being initialized

// Assign a value to the names
someInt = 169
someString = "Finally! A value."

print(someString) // prints 'Finally! A value.'
print(someInt) // prints '169'
```

Functions in Swift are also values that are associated with a name, though they are defined using a different syntax from constants and variables. They are defined using the `func` keyword followed by a pair of parentheses enclosing a comma-separated list of parameter names along with their explicit types and an external name to be used by the caller of the function. The parameter list is followed by `->` and the type of the values returned by the function. Finally, this is followed by the body of the function enclosed in a pair of curly braces. For example:

```swift
func add10(to x: Int) -> Int {
  return x + 10
}
```

Invoking a function is done by specifying its name and passing arguments for each of the function's parameters using the external parameter name.

```swift
let fifteen = add10(to: 5)
```

Swift supports two types of comments. Single line comments start with `//` and continue to the following newline. Multiline comments are inserted between `/*` and `*/`.

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have four tasks, all related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Define the `expectedMinutesInOven` constant to check how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is 40:

```swift
expectedMinutesInOven
// => 40
```

## 2. Calculate the remaining oven time in minutes

Define the `remainingMinutesInOven` function that takes the number of elapsed minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected time oven time in minutes from the previous task.

```swift
remainingMinutesInOven(elapsedMinutes: 30)
// => 10
```

## 3. Calculate the preparation time in minutes

Define the `preparationTimeInMinutes` function that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```swift
preparationTimeInMinutes(layers: 2)
// => 4
```

## 4. Calculate the total working time in minutes

Define the `totalTimeInMinutes` function that takes two parameters: the first parameter is the number of layers you added to the lasagna, and the second parameter is the number of minutes the lasagna has been in the oven. The function should return how many minutes in total you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```swift
totalTimeInMinutes(layers: 3, elapsedMinutes: 20)
// => 26
```

## Source

### Created by

- @wneumann