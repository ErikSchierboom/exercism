# Building Telemetry

Welcome to Building Telemetry on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

This exercise discusses some details of method parameters and their use in C#.

Parameters convey information from a calling method to a called method.

- The behavior of parameters can be modified by the use of modifies such as `ref` and `out`.

- A parameter with the `out` modifier conveys a value back from the called method to the caller. The parameter can be passed to the called method without being initialized and in any case it is treated within the called method as if, on entry, it had not been initialized. An understanding of the behavior and rules regarding parameter modifiers can be gained most easily through examples (see below) and compiler messages.

```csharp
void Foo(out int val)
{
    val = 42;
}
void Bar(int val)
{
    val = 42;
}

int importantValue = 1729;
Foo(out importantValue);
var result = importantValue == 42;
// => true

importantValue = 1729;
Bar(importantValue);
result = importantValue == 1729;
// => true
```

- `out` parameters must be assigned to within a called method.

- A parameter with the `ref` modifier passes a value into a called method. When the method returns the caller will find any updates made by the called method in that parameter.

```csharp
void Foo(ref int val)
{
    val *= 7;
}

int importantValue = 6;
Foo(ref importantValue);
return importantValue;
// => 42
```

- `ref` parameters must be variables as the called method will be operating directly on the parameter as seen by the caller.
- The `out` and `ref` modifiers are required both in the called method signature and at the call site.

## Instructions

The remote control car project you kicked off in the `classes` exercise has gone well (congratulations!) and due to a number of recent sponsorship deals there is money in the budget for enhancements.

Part of the budget is being used to provide some telemetry.

To keep the sponsors sweet a panel has been installed on the car to display the sponsors names as it goes round the track.

You will note that the introduction of these fancy new technologies has dramatically reduced the car's battery life.

## 1. Enable the remote control car to display sponsor names

Implement `SetSponsors()` to take one or more sponsor names and store them on the car.

Note that the `SetSponsors()` method's argument is guaranteed to be non-null.

Implement `DisplaySponsor()` to display the selected sponsor. The first sponsor passed in has a `sponsorNum` of 0, the second, 1 etc.

```csharp
var car = RemoteControlCar.Buy();
car.SetSponsors("Exercism", "Walker Industries", "Acme Co.");
var sp2 = car.DisplaySponsor(sponsorNum: 1);
// => "Walker Industries"
```

## 2 Get the car's telemetry data

Implement the `RemoteControlCar.GetTelemetryData()` method.

`GetTelemetryData()` should make the battery percentage and distance driven in meters available via `out` parameters.

`GetTelemetryData()` should return `false` if the serialNum argument is less than the previously received value. (There is some issue of multiple telemetry nodes being involved). In this case `serialNum` will be set to the highest previous `serialNum` and battery percentage and meters driven will both be set to `-1`. Where the call is successful `serialNum` remains unchanged.

```csharp
var car = RemoteControlCar.Buy();
car.Drive();
car.Drive();
int serialNum = 4;
car.GetTelemetryData(ref serialNum, out int batteryPercentage, out int distanceDrivenInMeters);
// => true, 4L, 80, 4

serialNum = 1;
car.GetTelemetryData(ref serialNum, out batteryPercentage, out distanceDrivenInMeters);
// => false, 4L, -1, -1
```

## 3 Add functionality so that the telemetry system can get battery usage per meter

Implement the `TelemetryClient.GetBatteryUsagePerMeter()` method.

This will call `RemoteControlCar.GetTelemetryData()`. If `GetTelemetryData()` returns `false` or the car has not been driven, then this routine should return "no data". If `GetTelemetryData()` returns `true` then a message in the following form should be returned "usage-per-meter=BATTERY-USAGE-PER-METER". Where the calculation is (100 - current battery percentage) divided by the distance driven in meters so far.

```csharp
var car = RemoteControlCar.Buy();
car.Drive();
car.Drive();
var tc = new TelemetryClient(car);
int serialNum = 4;
tc.GetBatteryUsagePerMeter(serialNum);
// => "usage-per-meter=5"

serialNum = 1;
tc.GetBatteryUsagePerMeter(serialNum);
// => "no data"
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin