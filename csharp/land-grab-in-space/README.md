# Land Grab in Space

Welcome to Land Grab in Space on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

C# `struct`s are closely related `class`s. They have state and behavior. They have constructors that take arguments, instances can be assigned, tested for equality and stored in collections.

```csharp
enum Unit
{
    Kg,
    Lb
}
struct Weight
{
    private double count;
    private Unit unit;

    public Weight(double count, Unit unit)
    {
        this.count = count;
        this.unit = unit;
    }

    public override string ToString()
    {
        return count.ToString() + unit.ToString();
    }
}

new Weight(77.5, Unit.Kg).ToString();
// => "77.6Kg"
```

## Instructions

You have been tasked by the claims department of Isaacs Asteroid Exploration Co. to improve the performance of their land claim system.

Every time a new asteroid is ready for exploitation speculators are invited to stake their claim to a plot of land. The asteroid's land is divided into 4 sided plots. Speculators claim the land by specifying its dimensions.

Your goal is to develop a performant system to handle the land rush that has in the past caused the website to crash.

The unit of measure is 100 meters but can be ignored in these tasks.

## 1. Define a Plot

Complete the implementation of the `Plot` struct which comprises 4 coord structs (which it accepts in its constructor).

## 2. Speculators can stake their claim by specifying a plot identified by its dimensions

Implement the `ClaimsHandler.StakeClaim()` method to allow a claim to be registered.

Implement the `ClaimsHandler.IsClaimStaked()` method to determine whether a claim has been staked.

```csharp
var ch = new ClaimsHandler();
ch.StakeClaim(new Plot(new Coord(1,1), new Coord(2,1), new Coord(1,2), new Coord(2,2)));
ch.IsClaimStaked(new Plot(new Coord(1,1), new Coord(2,1), new Coord(1,2), new Coord(2,2)));
// => true
```

## 3. Check whether the current claim is the same as the last one.

Implement the `ClaimsHandler.IsLastClaim()` method to compare the current claim with the previous one.

```csharp
var ch = new ClaimsHandler();
ch.StakeClaim(new Plot(new Coord(1,1), new Coord(2,1), new Coord(1,2), new Coord(2,2)));
ch.IsLastClaim(new Plot(new Coord(1,1), new Coord(2,1), new Coord(1,2), new Coord(2,2)));
// => true
```

## 4. Find the plot claimed that has the longest side for research purposes

Implement the `ClaimsHandler.GetClaimWithLongestSide()` method to examine all registered claims and return the plot with the longest side.

```csharp
var ch = new ClaimsHandler();
ch.StakeClaim(new Plot(new Coord(1,1), new Coord(2,1), new Coord(1,2), new Coord(2,2)));
ch.StakeClaim(new Plot(new Coord(1,1), new Coord(20,1), new Coord(1,2), new Coord(2,2)));
ch.GetClaimWithLongestSide();
// => new Plot(new Coord(1,1), new Coord(20,1), new Coord(1,2), new Coord(2,2))
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @efx
- @jrr
- @ErikSchierboom
- @yzAlvin