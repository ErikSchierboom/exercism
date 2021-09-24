# Weighing Machine

Welcome to Weighing Machine on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A property in C# is a member of a class that provides access to data within that class.
Callers can set or retrieve (get) the data. Properties can be either auto-implemented or
have a backing field. They comprise a set accessor and/or a get accessor.
In some other languages a "mutator" is roughly equivalent to a
a set accessor and an "accessor" is roughly equivalent to a set accessor although
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
    get { return myfField; }
    set { myField = value; }
}
```

## Auto-implemented Properties

```
public int MyProperty { get; private set; } = 42;
```

Initialization is optional.

## Instructions

In this exercise you'll be modelling a weighing machine.

The weight can be set and retrieved in pounds or kilograms and cannot be negative.

The weight can be displayed in SI units or US units
, pounds and ounces.

A tare adjustment can be applied to the weight (for instance to deduct the
weight of a container). This can be any value (even negative or a value that makes the display weight negative)
as there are doubts about the accuracy
of the weighing machine. For security reasons this value cannot be retrieved.

Note that:

```
display-weight = input-weight - tare-adjustment
```

Conversion ratios are as follows:

- 16 ounces to a pound
- 2.20462 kg to a pound

For Example:

- 60 kilograms == 132.2772 ponds
- 132.2772 pounds == 132 pounds 4 ounces

You have 5 tasks each of which requires you to implement one or
more properties:

## 1. Allow the weight to be set on the weighing machine

Implement the `WeigingMachine.InputWeight` property to allow the weight to be get and set:

```csharp
var wm = new WeighingMachine();
wm.InputWeight = 60m;

//  => wm.InputWeight == 60m
```

## 2. Ensure that a negative input weight is rejected

Add validation to the `WeighingMachine.InputWeight` property to throw an `ArgumentOutOfRangeException` when trying to set it to a negative weight:

```csharp
var wm = new WeighingMachine();
wm.InputWeight = -10m; // Throws an ArgumentOutOfRangeException
```

## 3. Allow the US weight to be retrieved

Implement the `WeighingMachine.USDisplayWeight` property and the `USWeight` class:

```csharp
var wm = new WeighingMachine();
wm.InputWeight = 60m;

var usw = wm.USDisplayWeight;
// => usw.Pounds == 132 && usw.Ounces == 4
```

## 4. Allow the machine's units to be set to pounds

Implement the `WeighingMachine.Units` property:

```csharp
var wm = new WeighingMachine();
wm.InputWeight = 175.5m;
wm.Units = Units.Pounds;

var usw = wm.USDisplayWeight;
// => usw.Pounds == 175 && usw.Ounces == 8
```

## 5. Allow a tare adjustment to be applied to the weighing machine

Implement the `WeighingMachine.TareAdjustment` and `WeighingMachine.DisplayWeight` properties:

```csharp
var wm = new WeighingMachine();
wm.InputWeight = 100m;
wm.TareAdjustment = 10m;

// => wm.DisplayWeight == 90m
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin