# Face ID 2.0

Welcome to Face ID 2.0 on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Equality

Simple types (strings and primitives) are typically tested for equality with the `==` and `!=`.

Reference types (Instances of classes) are compared using the `Equals()` method inherited from `Object`. If your goal with the equality test is to ensure that two objects are the exact same instance then relying on `Object`'s implementation will suffice. If not, you need to override `object.Equals()`.

If you know that all the instances of your class are created in one place, say characters in some game or simulation then reference equality is sufficient. However, it is likely that multiple instances of the same real-world entity will be created (from a database, by user input, via a web request). In this case values that uniquely identify the entity must be tested for equality. Therefore `Equals()` must be overridden and appropriate data members of your class are tested for equality.

An overridden `Equals()` method will contain equality tests on members of simple types using `==` and reference types with recursive calls to `Equals()`.

The `Object` class provides appropriate methods to compare two objects to detect if they are one and the same instance.

### `Object.GetHashCode()`

The `Object.GetHashCode()` method returns a hash code in the form of a 32 bit integer. The hash code is used by _dictionary_ and _set_ classes such as `Dictionary<T>` and `HashSet<T>`to store and retrieve objects in a performant manner.

The relationship between hash code and equality is that if two objects are equal (`Equal()` returns true) then `GetHashCode()` for the two objects must return the same value. This does not apply in the reverse direction. It is not symmetrical. Just because two objects have the same hashcode they do not have to be equal. Picture a lookup function that first goes to a "bucket" based on the hash code and then picks out the particular item using the equality test.

The HashCode library API documentation discusses the best way to generate a hash code

The values used in the equality test must be stable while the hashed collection is in use. If you add an object to the collection with one set of values and then change those values the hash code will no longer point to the correct "bucket". In practice this means that the object should be immutable. Other approaches run the risk of creating gotchas for maintainers.

## Sets

The `HashSet` library class provides a good mechanism for storing unique values.

## Instructions

You are working on a system to simplify the login process for your organization's network. The tasks concern the authentication part. The system uses facial recognition to prove identity.

In all occurrences the eye color parameter is guaranteed to be non-null.

## 1. Ensure that facial features match

Implement `Authenticator.AreSameFace()` to check that two faces match.

Add equality routines for the `FacialFeatures` class.

```csharp
Authenticator.AreSameFace(new FacialFeatures("green", 0.9m), new FacialFeatures("green", 0.9m);
// => true
Authenticator.AreSameFace(new FacialFeatures("blue", 0.9m), new FacialFeatures("green", 0.9m);
// => false
```

## 2. Authenticate the system administrator

Despite your protests the system administrator insists on having a built-in identity during acceptance testing so that they can always be authenticated.

The admin's email is admin@exerc.ism. They have green eyes and a philtrum with a width of 0.9.

Add equality routines for the `Identity` class.

Implement the `Authenticator.IsAdmin()` method to check that the identity passed in matches that of the administrator.

```csharp
var authenticator = new Authenticator();
authenticator.IsAdmin(new Identity("admin@exerc.ism", new FacialFeatures("green", 0.9m)));
// => true
authenticator.IsAdmin(new Identity("admin@thecompetition.com", new FacialFeatures("green", 0.9m)));
// => false
```

## 3. Register new identities

Implement the `Authenticator.Register()` method which stores an identity on the authenticator itself such that calls to `IsRegistered()` will return `true` for this identity: otherwise `IsRegistered()` returns `false`.

To detect duplicated attempts to register an identity, if the identity has already been registered then `false` is returned by `Authenticator.Register()`, otherwise `true`.

```csharp
var authenticator = new Authenticator();
authenticator.Register(new Identity("tunde@thecompetition.com", new FacialFeatures("blue", 0.9m)));
// => true
authenticator.IsRegistered(new Identity("tunde@thecompetition.com", new FacialFeatures("blue", 0.9m)));
// => true
authenticator.Register(new Identity("tunde@thecompetition.com", new FacialFeatures("blue", 0.9m)));
// => false
```

## 4. Prevent invalid identities being authenticated

Implement the `Authenticator.IsRegistered()` method and ensure it returns false when no identities have been registered.

```csharp
var authenticator = new Authenticator();
authenticator.IsRegistered(new Identity("alice@thecompetition.com", new FacialFeatures("blue", 0.8m)));
// => false
```

## 5. Add diagnostics to detect multiple attempts to authenticate

A bug has been reported whereby the `Authenticator.IsRegistered()` method is called multiple times in quick succession for the same identity. You believe that there is some sort of "bounce" problem where the exact same record is being submitted multiple times. Your task is to add a diagnostic routine `Authenticator.AreSameObject()` to support any testing that's undertaken. The routine compares to objects and returns `true` if they are the exact same instance otherwise `false`.

```csharp
var identityA = new Identity("alice@thecompetition.com", new FacialFeatures("blue", 0.9m));
var identityB = identityA;
Authenticator.AreSameObject(identityA, identityB);
// => true

var identityC = new Identity("alice@thecompetition.com", new FacialFeatures("blue", 0.9m));
var identityD = new Identity("alice@thecompetition.com", new FacialFeatures("blue", 0.9m));
Authenticator.AreSameObject(identityC, identityD);
// => false
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin