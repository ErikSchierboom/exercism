# Tim from Marketing

Welcome to Tim from Marketing on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In C#, the `null` literal is used to denote the absence of a value. A _nullable_ type is a type that allows for `null` values.

Prior to C# 8.0, reference types were always nullable and value types were not. A value type can be made nullable though by appending it with a question mark (`?`).

```csharp
string nullableReferenceType = "hello";
nullableReferenceType = null; // Valid as type is nullable

int nonNullableValueType = 5;
nonNullableValueType = null; // Compile error as type is not nullable

int? nullableValueType = 5; // Define nullable value type
nullableValueType = null;   // Valid as type is nullable
```

Accessing a member of a variable which value is `null` will compile fine, but result in a `NullReferenceException` being thrown at runtime:

```csharp
string sentence = null;

// Throws NullReferenceException at runtime
sentence.Length;
```

To counter this common type of mistake, C# 8 allows one to opt-into a feature that makes reference types non-nullable by default:

```csharp
string nonNullableReferenceType = "book";
nonNullableReferenceType = null; // Compile warning (no error!)

string? nullableReferenceType = "movie";
nullableReferenceType = null; // Valid as type is nullable
```

To safely work with nullable values, one should check if they are `null` before working with them:

```csharp
string NormalizedName(string? name)
{
    if (name == null)
    {
        return "UNKNOWN";
    }
    else
    {
        // Value is not null at this point, so no compile warning
        // and no runtime NullReferenceException being thrown
        return name.ToUpper();
    }
}

NormalizedName(null); // => "UNKNOWN"
NormalizedName("Elisabeth"); // => "ELISABETH"
```

The `??` operator allows one to return a default value when the value is `null`:

```csharp
string? name1 = "John";
name1 ?? "Paul"; // => "John"

string? name2 = null;
name2 ?? "George"; // => "George"
```

The `?.` operator allows one to call members safely on a possibly `null` value:

```csharp
string? fruit = "apple";
fruit?.Length; // => 5

string? vegetable = null;
vegetable?.Length; // => null
```

[nullable-csharp-8]: https://docs.microsoft.com/en-us/dotnet/csharp/nullable-references

## Instructions

In this exercise you'll be writing code to print name badges for factory employees.

## 1. Print a badge for an employee

Employees have an ID, name and department name. Employee badge labels are formatted as follows: `"[id] - name - DEPARTMENT"`. Implement the (_static_) `Badge.Print()` method to return an employee's badge label:

```csharp
Badge.Print(734, "Ernest Johnny Payne", "Strategic Communication");
// => "[734] - Ernest Johnny Payne - STRATEGIC COMMUNICATION"
```

Note that the department should be uppercased on the label.

## 2. Print a badge for a new employee

Due to a quirk in the computer system, new employees occasionally don't yet have an ID when they start working at the factory. As badges are required, they will receive a temporary badge without the ID prefix. Modify the (_static_) `Badge.Print()` method to support new employees that don't yet have an ID:

```csharp
Badge.Print(id: null, "Jane Johnson", "Procurement");
// => "Jane Johnson - PROCUREMENT"
```

## 3. Print a badge for the owner

Even the factory's owner has to wear a badge at all times. However, an owner does not have a department. In this case, the label should print `"OWNER"` instead of the department name. Modify the (_static_) `Badge.Print()` method to print a label for the owner:

```csharp
Badge.Print(254, "Charlotte Hale", department: null);
// => "[254] - Charlotte Hale - OWNER"
```

Note that it is possible for the owner to also be a new employee:

```csharp
Badge.Print(id: null, "Charlotte Hale", department: null);
// => "Charlotte Hale - OWNER"
```

## Source

### Created by

- @maurelio1234

### Contributed to by

- @yzAlvin