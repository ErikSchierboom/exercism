module PerfectNumbersTest

open NUnit.Framework

open PerfectNumbers

[<TestCase(3)>]
[<TestCase(7)>]
[<TestCase(13)>]
let ``Can classify deficient numbers`` (number) =
    Assert.That(classify number, Is.EqualTo(Deficient))

[<TestCase(6)>]
[<TestCase(28)>]
[<TestCase(496)>]
let ``Can classify perfect numbers`` (number) =
    Assert.That(classify number, Is.EqualTo(Perfect))

[<TestCase(12)>]
[<TestCase(18)>]
[<TestCase(20)>]
let ``Can classify abundant numbers`` (number) =
    Assert.That(classify number, Is.EqualTo(Abundant))