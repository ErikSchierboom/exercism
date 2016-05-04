module ClockTests

open System
open NUnit.Framework
open Clock

[<TestCase(8, "08:00")>]
[<TestCase(9, "09:00")>]
let ``Prints the hour`` (hours: int, expected: string) =
    let clock = new Clock(hours)
    Assert.That(clock.ToString(), Is.EqualTo(expected))

[<TestCase(11, 9, "11:09")>]
[<TestCase(11, 19, "11:19")>]
let ``Prints past the hour`` (hours: int) (minutes: int) (expected: string) =
    let clock = new Clock(hours, minutes)
    Assert.That(clock.ToString(), Is.EqualTo(expected))

[<Test>]    
let ``Can add minutes`` () =
    let clock = new Clock(10)
    let added = clock.add(3)
    Assert.That(added.ToString(), Is.EqualTo("10:03"))

[<Test>]    
let ``Can add over an hour`` () =
    let clock = new Clock(10)
    let added = clock.add(63)
    Assert.That(added.ToString(), Is.EqualTo("11:03"))

[<Test>]    
let ``Can add over more than one day`` () =
    let clock = new Clock(10)
    let added = clock.add(7224)
    Assert.That(added.ToString(), Is.EqualTo("10:24"))

[<Test>]    
let ``Can subtract minutes`` () =
    let clock = new Clock(10, 3)
    let subtracted = clock.subtract(3)
    Assert.That(subtracted.ToString(), Is.EqualTo("10:00"))

[<Test>]    
let ``Can subtract to previous hour`` () =
    let clock = new Clock(10, 3)
    let subtracted = clock.subtract(30)
    Assert.That(subtracted.ToString(), Is.EqualTo("09:33"))

[<Test>]    
let ``Can subtract over an hour`` () =
    let clock = new Clock(10, 3)
    let subtracted = clock.subtract(70)
    Assert.That(subtracted.ToString(), Is.EqualTo("08:53"))

[<Test>]    
let ``Wraps around midnight`` () =
    let clock = new Clock(23, 59)
    let added = clock.add(2)
    Assert.That(added.ToString(), Is.EqualTo("00:01"))

[<Test>]    
let ``Wraps around midnight backwards`` () =
    let clock = new Clock(0, 1)
    let subtracted = clock.subtract(2)
    Assert.That(subtracted.ToString(), Is.EqualTo("23:59"))

[<Test>]    
let ``Midnight is zero hundred hours`` () =
    let clock = new Clock(24)
    Assert.That(clock.ToString(), Is.EqualTo("00:00"))

[<Test>]    
let ``Sixty minutes is next hour`` () =
    let clock = new Clock(1, 60)
    Assert.That(clock.ToString(), Is.EqualTo("02:00"))

[<Test>]    
let ``Clocks with same time are equal`` () =
    let clock1 = new Clock(14, 30)
    let clock2 = new Clock(14, 30)
    Assert.That(clock1, Is.EqualTo(clock2))

[<Test>]    
let ``Overflown clocks with same time are equal`` () =
    let clock1 = new Clock(14, 30)
    let clock2 = new Clock(38, 30)
    Assert.That(clock1, Is.EqualTo(clock2))