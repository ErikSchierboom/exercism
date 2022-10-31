# Weighing Machine

Welcome to Weighing Machine on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A property in C# is a member of a class that provides access to data within that class.
Callers can set or retrieve (get) the data. Properties can be either auto-implemented or
have a backing field. They comprise a set accessor and/or a get accessor.
In some other languages a "mutator" is roughly equivalent to 
a set accessor and an "accessor" is roughly equivalent to a get accessor although
the composition of the syntax is completely different.

When setting a property the input value can be validated, formatted
or otherwise manipulated and in fact any programmatic operation accessible to code in the
class can be executed.

Similarly when retrieving a property data can be calculated or formatted and again
any programmatic operation available to the class can be executed.

Properties have access modifiers (`public`, `private` etc.) in the same way as other
class members but the set accessor may have an access level independent of the retrieve (get)
accessor and vice versa. A property doesn't have to have both accessors, it can have just one (either get or set).

The basic syntax to express properties can take two forms:

## Field/Expression Backed Properties:

```csharp
private int myField;
public int MyProperty
{
    get { return myField; }
    set { myField = value; }
}
```

## Auto-implemented Properties

```
public int MyProperty { get; private set; } = 42;
```

Initialization is optional.

## Instructions

In this exercise you'll be modelling a weighing machine with Kilograms as a Unit.

You have 6 tasks each of which requires you to implement one or more properties:

## 1. Allow the weighing machine to have a precision

To cater to different demands, we allow each weighing machine to be customized with a precision (the number of digits after the decimal separator).
Implement the `WeighingMachine` class to have a get-only `Precision` property set to the constructor's `precision` argument:

```csharp
var wm = new WeighingMachine(precision: 3);

//  => wm.Precision == 3
```

## 2. Allow the weight to be set on the weighing machine

Implement the `WeighingMachine.Weight` property to allow the weight to be get _and_ set:

```csharp
var wm = new WeighingMachine(precision: 3);
wm.Weight = 60.5;

//  => wm.Weight == 60.5
```

## 3. Ensure that a negative input weight is rejected

Clearly, someone cannot have a negative weight. 
Add validation to the `WeighingMachine.Weight` property to throw an `ArgumentOutOfRangeException` when trying to set it to a negative weight:

```csharp
var wm = new WeighingMachine(precision: 3);
wm.Weight = -10; // Throws an ArgumentOutOfRangeException
```

## 4. Allow a tare adjustment to be applied to the weighing machine

The tare adjustment can be any value (even negative or a value that makes the display weight negative)
Implement the `WeighingMachine.TareAdjustment` property to allow the tare adjustment to be set:

```csharp
var wm = new WeighingMachine(precision: 3);
wm.TareAdjustment = -10.6;

// => wm.TareAdjustment == -10.6
```

## 5. Ensure that the weighing machine has a default tare adjustment

After some thorough testing, it appears that due to a manifacturing issue all weighing machines have a bias towards overestimating the weight by `5`.
Change the `WeighingMachine.TareAdjustment` property to `5` as its default value.

```csharp
var wm = new WeighingMachine(precision: 3);

// => wm.TareAdjustment == 5.0
```

## 6. Allow the weight to be retrieved

Implement the `WeighingMachine.DisplayWeight` property which shows weight after tare adjustment and with the correct precision applied:
Note that:
``` display-weight = input-weight - tare-adjustment ```

```csharp
var wm = new WeighingMachine(precision: 3);
wm.TareAdjustment = 10;
wm.Weight = 60.567;

// => wm.DisplayWeight == "50.567 kg"
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin
- @18-F-Cali