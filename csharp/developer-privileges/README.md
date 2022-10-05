# Developer Privileges

Welcome to Developer Privileges on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Object initializers are an alternative to constructors. The syntax is illustrated below. You provide a comma separated list of name-value pairs separated with `=` within curly brackets:

```csharp
public class Person
{
    public string Name;
    public string Address;
}

var person = new Person{Name="The President", Address = "Élysée Palace"};
```

Collections can also be initialized in this way. Typically, this is accomplished with comma separated lists as shown here:

```csharp
IList<Person> people = new List<Person>{ new Person(), new Person{Name="Joe Shmo"}};
```

Dictionaries use the following syntax:

```csharp
IDictionary<int, string> numbers = new Dictionary<int, string>{ [0] = "zero", [1] = "one"...};

// or

IDictionary<int, string> numbers = new Dictionary<int, string>{ {0, "zero" }, {1,  "one"}...};
```

## Instructions

You've been asked to do some more work on the network authentication system.

In addition to the admin identity being hard-coded in the system during development the powers that be also want senior developers to be given the same treatment.

## 1. Store the system admin's details hard-coded in the system and make it available to callers.

The admin's details are as follows:

| Email        | Eye Color | Philtrum Width | Name     | Address 1 | Address 2 |
| ------------ | --------- | -------------- | -------- | --------- | --------- |
| admin@ex.ism | green     | 0.9            | Chanakya | Mumbai    | India     |

Implement the `Authenticator.Admin` property to return the system admin's identity details. The name and each part of the address should be in a separate element of the `NameAndAddress` list.

```csharp
var authenticator = new Authenticator();
authenticator.Admin;
// => {"admin@ex.ism", {"green", 0.9m}, ["Chanakya", "Mumbai", "India"]}
```

## 2 Store the developers' details hard-coded in the system and make them available in the form of a dictionary

The developers' details are as follows:

| Email         | Eye Color | Philtrum Width | Name     | Address 1 | Address 2 |
| ------------- | --------- | -------------- | -------- | --------- | --------- |
| bert@ex.ism   | blue      | 0.8            | Bertrand | Paris     | France    |
| anders@ex.ism | brown     | 0.85           | Anders   | Redmond   | USA       |

Implement the `Authenticator.Developers()` method to return the developers' identity details. The dictionary key is the developer's name.

```csharp
var authenticator = new Authenticator();
authenticator.Developers;
// => {"Bertrand" = {"bert@ex.ism", {"blue", 0.8m}, ["Bertrand", "Paris", "France"]},
// ["Anders" = {"anders@ex.ism", {"brown", 0.85m}, ["Anders", "Redmond", "USA"]},

```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin