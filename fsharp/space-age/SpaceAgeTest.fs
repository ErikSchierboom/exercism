﻿module SpaceAgeTests

open NUnit.Framework
open SpaceAge

[<TestFixture>]
type SpaceAgeTest() =
    
    [<Test>]
    member tests.Age_in_seconds() =
        Assert.That<decimal>(SpaceAge(1000000m).Seconds, Is.EqualTo(1000000))

    [<Test>]
    member tests.Age_on_earth() =
        Assert.That<decimal>(SpaceAge(1000000000m).onEarth, Is.EqualTo(31.69m))

    [<Test>]
    member tests.Age_on_mercury() =
        let spaceAge = SpaceAge(2134835688m)

        Assert.That<decimal>(spaceAge.onEarth, Is.EqualTo(67.65m))
        Assert.That<decimal>(spaceAge.onMercury, Is.EqualTo(280.88m))

    [<Test>]
    member tests.Age_on_venus() =
        let spaceAge = SpaceAge(189839836m)

        Assert.That<decimal>(spaceAge.onEarth, Is.EqualTo(6.02m))
        Assert.That<decimal>(spaceAge.onVenus, Is.EqualTo(9.78m))

    [<Test>]
    member tests.Age_on_mars() =
        let spaceAge = SpaceAge(2329871239m)

        Assert.That<decimal>(spaceAge.onEarth, Is.EqualTo(73.83m))
        Assert.That<decimal>(spaceAge.onMars, Is.EqualTo(39.25m))

    [<Test>]
    member tests.Age_on_jupiter() =
        let spaceAge = SpaceAge(901876382m)

        Assert.That<decimal>(spaceAge.onEarth, Is.EqualTo(28.58m))
        Assert.That<decimal>(spaceAge.onJupiter, Is.EqualTo(2.41m))

    [<Test>]
    member tests.Age_on_saturn() =
        let spaceAge = SpaceAge(3000000000m)

        Assert.That<decimal>(spaceAge.onEarth, Is.EqualTo(95.06m))
        Assert.That<decimal>(spaceAge.onSaturn, Is.EqualTo(3.23m))

    [<Test>]
    member tests.Age_on_uranus() =
        let spaceAge = SpaceAge(3210123456m)

        Assert.That<decimal>(spaceAge.onEarth, Is.EqualTo(101.72m))
        Assert.That<decimal>(spaceAge.onUranus, Is.EqualTo(1.21m))

    [<Test>]
    member tests.Age_on_neptune() =
        let spaceAge = SpaceAge(8210123456m)

        Assert.That<decimal>(spaceAge.onEarth, Is.EqualTo(260.16m))
        Assert.That<decimal>(spaceAge.onNeptune, Is.EqualTo(1.58m))