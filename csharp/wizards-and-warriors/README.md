# Wizards and Warriors

Welcome to Wizards and Warriors on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In C#, a _class_ hierarchy can be defined using _inheritance_, which allows a derived class (`Car`) to inherit the behavior and data of its parent class (`Vehicle`). If no parent is specified, the class inherits from the `object` class.

Parent classes can provide functionality to derived classes in three ways:

- Define a regular method.
- Define a `virtual` method, which is like a regular method but one that derived classes _can_ change.
- Define an `abstract` method, which is a method without an implementation that derived classes _must_ implement. A class with `abstract` methods must be marked as `abstract` too. Abstract classes cannot be instantiated.

The `protected` access modifier allows a parent class member to be accessed in a derived class, but blocks access from other classes.

Derived classes can access parent class members through the `base` keyword.

```csharp
// Inherits from the 'object' class
abstract class Vehicle
{
    // Can be overridden
    public virtual void Drive()
    {
    }

    // Must be overridden
    protected abstract int Speed();
}

class Car : Vehicle
{
    public override void Drive()
    {
        // Override virtual method

        // Call parent implementation
        base.Drive();
    }

    protected override int Speed()
    {
        // Implement abstract method
    }
}
```

The constructor of a derived class will automatically call its parent's constructor _before_ executing its own constructor's logic. Arguments can be passed to a parent class' constructor using the `base` keyword:

```csharp
abstract class Vehicle
{
    protected Vehicle(int wheels)
    {
        Console.WriteLine("Called first");
    }
}

class Car : Vehicle
{
    public Car() : base(4)
    {
        Console.WriteLine("Called second");
    }
}
```

Where more than one class is derived from a base class the two (or more) classes will often implement different versions of a base class method. This is a very important principle called polymorphism. For instance in a variation on the above example we show how code using `Vehicle` can change its behavior depending on what type of vehicle has been instantiated.

```csharp
abstract class Vehicle
{
   public abstract string GetDescription();
}

class Car : Vehicle
{
   public Car()
   {
   }

   public override string GetDescription()
   {
      return "Runabout";
   }
}

class Rig : Vehicle
{
   public Rig()
   {
   }

   public override string GetDescription()
   {
      return "Big Rig";
   }
}

Vehicle v1 = new Car();
Vehicle v2 = new Rig();

v1.GetDescription();
// => Runabout
v2.GetDescription();
// => Big Rig
```

## Instructions

In this exercise you're playing a role-playing game named "Wizard and Warriors," which allows you to play as either a Wizard or a Warrior.

There are different rules for Warriors and Wizards to determine how much damage points they deal.

For a Warrior, these are the rules:

- Deal 6 points of damage if the character they are attacking is not vulnerable
- Deal 10 points of damage if the character they are attacking is vulnerable

For a Wizard, these are the rules:

- Deal 12 points of damage if the Wizard prepared a spell in advance
- Deal 3 points of damage if the Wizard did not prepare a spell in advance

In general, characters are never vulnerable. However, Wizards _are_ vulnerable if they haven't prepared a spell.

You have six tasks that work with Warriors and Wizard characters.

## 1. Describe a character

Override the `ToString()` method on the `Character` class to return a description of the character, formatted as `"Character is a <CHARACTER_TYPE>"`.

```csharp
var warrior = new Warrior();
warrior.ToString();
// => "Character is a Warrior"
```

## 2. Make characters not vulnerable by default

Ensure that the `Character.Vulnerable()` method always returns `false`.

```csharp
var warrior = new Warrior();
warrior.Vulnerable();
// => false
```

## 3. Allow Wizards to prepare a spell

Implement the `Wizard.PrepareSpell()` method to allow a Wizard to prepare a spell in advance.

```csharp
var wizard = new Wizard();
wizard.PrepareSpell();
```

## 4. Make Wizards vulnerable when not having prepared a spell

Ensure that the `Vulnerable()` method returns `true` if the wizard did not prepare a spell; otherwise, return `false`.

```csharp
var wizard = new Wizard();
wizard.Vulnerable();
// => true
```

## 5. Calculate the damage points for a Wizard

Implement the `Wizard.DamagePoints()` method to return the damage points dealt: 12 damage points when a spell has been prepared, 3 damage points when not.

```csharp
var wizard = new Wizard();
var warrior = new Warrior();

wizard.PrepareSpell();
wizard.DamagePoints(warrior);
// => 12
```

## 6. Calculate the damage points for a Warrior

Implement the `Warrior.DamagePoints()` method to return the damage points dealt: 10 damage points when the target is vulnerable, 6 damage points when not.

```csharp
var warrior = new Warrior();
var wizard = new Wizard();

warrior.DamagePoints(wizard);
// => 10
```

## Source

### Created by

- @ErikSchierboom

### Contributed to by

- @yzAlvin