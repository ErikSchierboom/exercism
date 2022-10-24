# Remote Control Cleanup

Welcome to Remote Control Cleanup on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

C# types can be defined within the scope of a class or struct. The enclosing type provides a kind of name space. Access to the type is through the enclosing type with dot syntax.

```csharp
class Outer
{
    public interface IInner {}
    public enum EInner {}
    public class CInner {}
    public struct SInner {}
}

var outer = new Outer();
var inner = new Outer.CInner();
```

You can set access levels for inner types.

Private members of the outer type are in scope for members of the inner type but not vice versa.

## Instructions

Some "other" developers have been working on the remote control car project [exercise:csharp/remote-control-competition](). You have been called in to clean up the code.

## 1. Separate concerns between the car itself and the telemetry system

Refactor the `RemoteControlCar` class to move to separate out telemetry methods and properties.

```csharp
var car = new RemoteControlCar();
car.Telemetry.Calibrate();
car.Telemetry.SelfTest();
car.Telemetry.ShowSponsor("Walker Industries Inc.");
car.CurrentSponsor
// => "Walker Industries Inc."
car.Telemetry.SetSpeed(100, "cps");
car.GetSpeed()
// => "100 centimeters per second"
```

## 2. Prevent other code taking too many dependencies on the Telemetry type

Ensure that the `Telemetry` instance cannot be created outside the scope of the car.

## 3. Prevent other code from taking dependencies on the Speed struct

Ensure that the `Speed` struct cannot be used outside the scope of the `RemoteControlCar` class.

## 4. Prevent other code from taking dependencies on the SpeedUnits enum

Ensure that the `SpeedUnits` enum cannot be used outside the scope of the `RemoteControlCar` class.

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin