# Roll the Die!

Welcome to Roll the Die! on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In C# randomness is achieved with the help of `System.Random`. Typically, you create an instance and then call one of its `Next()` or `NextDouble()` methods, possibly multiple times depending on the use-case.

## Instructions

Continuing the theme of the wizards and warriors game, it is time to add an all purpose die rolling method. This will be the traditional 18 sided die with numbers 1 to 18. Players also generate a spell strength.

## 1. Enable a _wizards and warriors_ player to roll a die.

Implement a `RollDie()` method on the `Player` class.

```csharp
var player = new Player();
player.RollDie();
// => >= 1 <= 18
```

## 2. Players need their strength. Provide a means to generate spell strength

Implement a `GenerateSpellStrength()` method on the player class. The spell strength is between 0.0 and up to but not including 100.0.

Note that spell strength must be a real number (not an integer) to reduce the possibility of a tie when the strengths of two adversaries are compared.

```csharp
var player = new Player();
player.GenerateSpellStrength();
// => >= 0.0 < 100.0
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin
- @aage