# Calculator Conundrum

Welcome to Calculator Conundrum on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Exceptions in C# provide a structured, uniform, and type-safe way of handling error conditions that occur during runtime. Proper handling of exceptions and error is important when trying to prevent application crashes.

In C#, all exceptions have `System.Exception` class as their base type. It contains important properties such as `Message`, which contains a human-readable description of the reason for the exception being thrown.

To signal that there should be an error in a certain part of the code, a new exception object needs to be created and then thrown, using the `throw` keyword:

```csharp
using System;
static int Square(int number)
{
    if (number >= 46341)
    {
        throw new ArgumentException($"Argument {number} cannot be higher than 46340 as its' square doesn't fit into int type.");
    }
    return number * number;
}
```

When an exception gets thrown, the runtime has the task of finding a piece of code that is responsible for handling of that exception. If no appropriate handler is found, the runtime displays the unhandled exception message in addition to stopping the execution of the program.

To create a handler for an exception, C# uses the try-catch statement, which consists of a `try` block and one or more `catch` clauses. The `try` block should contain and guard code that may result in the exception getting thrown. The `catch` clauses should contain code that handles the behavior of the program after the error has occurred. It is important to note that the order of exceptions matters after the `try` block, as when multiple exceptions are listed, the first matching `catch` clause is executed.

```csharp
try
{
   if (number == 42)
   {
       throw new ArgumentException("The number cannot be equal to 42.", "number");
   }

   if (number < 0)
   {
      throw new ArgumentOutOfRangeException("number", "The number cannot be negative.");
   }

    // Process number ...
}
catch (ArgumentOutOfRangeException e)
{
    Console.WriteLine($"Number is out of range: {e.Message}.");
}
catch (ArgumentException)
{
    Console.WriteLine("Invalid number.");
}
```

## Instructions

In this exercise you will be building error handling for a simple integer calculator. To make matters simple, methods for calculating addition, multiplication and division are provided.

The goal is to have a working calculator that returns a string with the following pattern: `16 + 51 = 67`, when provided with arguments `16`, `51` and `+`.

```csharp
SimpleCalculator.Calculate(16, 51, "+"); // => returns "16 + 51 = 67"

SimpleCalculator.Calculate(32, 6, "*"); // => returns "32 * 6 = 192"

SimpleCalculator.Calculate(512, 4, "/"); // => returns "512 / 4 = 128"
```

## 1. Implement the calculator operations

The main method for implementation in this task will be the (_static_) `SimpleCalculator.Calculate()` method. It takes three arguments. The first two arguments are integer numbers on which an operation is going to be conducted. The third argument is of type string and for this exercise it is necessary to implement the following operations:

- addition using the `+` string
- multiplication using the `*` string
- division using the `/` string

## 2. Handle illegal operations

Any other operation symbol should throw the `ArgumentOutOfRangeException` exception. If the operation argument is an empty string, then the method should throw the `ArgumentException` exception. When `null` is provided as an operation argument, then the method should throw the `ArgumentNullException` exception.

```csharp
SimpleCalculator.Calculate(100, 10, "-"); // => throws ArgumentOutOfRangeException

SimpleCalculator.Calculate(8, 2, ""); // => throws ArgumentException

SimpleCalculator.Calculate(58, 6, null); // => throws ArgumentNullException
```

## 3. Handle errors when dividing by zero

When attempting to divide by `0`, the calculator should return a string with the content `Division by zero is not allowed.`. Any other exception should not be handled by the `SimpleCalculator.Calculate()` method.

```csharp
SimpleCalculator.Calculate(512, 0, "/"); // => returns "Division by zero is not allowed."
```

## Source

### Created by

- @archrisV

### Contributed to by

- @valentin-p
- @yzAlvin
- @sanderploegsma