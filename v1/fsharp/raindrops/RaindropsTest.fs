module RaindropsTests
    
open NUnit.Framework
open Raindrops

[<TestCase(1, ExpectedResult = "1")>]
[<TestCase(52, ExpectedResult = "52")>]
[<TestCase(12121, ExpectedResult = "12121")>]
let ``Non primes pass through`` (number) =
    convert number

[<TestCase(3)>]
[<TestCase(6)>]
[<TestCase(9)>]
let ``Numbers containing 3 as a prime factor give pling`` (number) =
    Assert.That(convert number, Is.EqualTo("Pling"))

[<TestCase(5)>]
[<TestCase(10)>]
[<TestCase(25)>]
let ``Numbers containing 5 as a prime factor give plang`` (number) =
    Assert.That(convert number, Is.EqualTo("Plang"))

[<TestCase(7)>]
[<TestCase(14)>]
[<TestCase(49)>]
let ``Numbers containing 7 as a prime factor give plong`` (number) =
    Assert.That(convert number, Is.EqualTo("Plong"))

[<TestCase(15, ExpectedResult = "PlingPlang")>]
[<TestCase(21, ExpectedResult = "PlingPlong")>]
[<TestCase(35, ExpectedResult = "PlangPlong")>]
[<TestCase(105, ExpectedResult = "PlingPlangPlong")>]    
let ``Numbers containing multiple prime factors give all results concatenated`` (number) =
    convert number