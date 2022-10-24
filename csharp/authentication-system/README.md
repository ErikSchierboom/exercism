# Authentication System

Welcome to Authentication System on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Constants

The `const` modifier can be (and generally should be) applied to any field where its value is known at compile time and will not change during the lifetime of the program.

```csharp
private const int num = 1729;
public const string title = "Grand" + " Master";
```

The `readonly` modifier can be (and generally should be) applied to any field that cannot be made `const` where its value will not change during the lifetime of the program and is either set by an inline initializer or during instantiation (by the constructor or a method called by the constructor).

```csharp
private readonly int num;
private readonly System.Random rand = new System.Random();

public MyClass(int num)
{
    this.num = num;
}
```

## Readonly Collections

While the `readonly` modifier prevents the value or reference in a field from being overwritten, it offers no protection for the members of a reference type.

```csharp
readonly List<int> ints = new List<int>();

void Foo()
{
    ints.Add(1);    // ok
    ints = new List<int>(); // fails to compile
}
```

To ensure that all members of a reference type are protected the fields can be made `readonly` and automatic properties can be defined without a `set` accessor.

The Base Class Library (BCL) provides some readonly versions of collections where there is a requirement to stop members of a collections being updated. These come in the form of wrappers:

- `ReadOnlyDictionary<T>` exposes a `Dictionary<T>` as read-only.
- `ReadOnlyCollection<T>` exposes a `List<T>` as read-only.

## Defensive Copying

In security sensitive situations (or even simply on a large code-base where developers have different priorities and agendas) you should avoid allowing a class's public API to be circumvented by accepting and storing a method's mutable parameters or by exposing a mutable member of a class through a return value or as an `out` parameter.

## Instructions

The authentication system that you last saw in [exercise:csharp/developer-privileges]() is in need of some attention. You have been tasked with cleaning up the code. Such a cleanup project will not only make life easy for future maintainers but will expose and fix some security vulnerabilities.

## 1. Set appropriate fields and properties to const

This is a refactoring task. Add the `const` modifier to any members of `Authenticator` or `Identity` that you think appropriate.

## 2. Set appropriate fields to readonly

This is a refactoring task. Add the `readonly` modifier to any fields of the `Authenticator` class or the `Identity` struct that you think appropriate.

## 3. Ensure that the class cannot be changed once it has been created

Remove the `set` accessor or make it `private` for any appropriate property on the `Authenticator` class or `Identity` struct.

## 4. Ensure that the admin cannot be tampered with

At present the admin identity field is returned by a call to `Admin`. This is not ideal as the caller can modify the field. Find a way to prevent the caller modifying the details of admin on the `Authenticator` object.

## 5. Ensure that the developers cannot be tampered with

At present the dictionary containing the hard coded privileged developer identities is returned by a call to `GetDevelopers()`. This is not ideal as the caller can modify the dictionary. Find a way to prevent the caller modifying the details of admin on the `Authenticator` object.

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin