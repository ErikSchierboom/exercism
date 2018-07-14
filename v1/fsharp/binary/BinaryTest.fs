module BinaryTests

open NUnit.Framework
open Binary
    
[<TestCase("1", ExpectedResult = 1)>]
[<TestCase("10", ExpectedResult = 2)>]
[<TestCase("11", ExpectedResult = 3)>]
[<TestCase("100", ExpectedResult = 4)>]
[<TestCase("1001", ExpectedResult = 9)>]
[<TestCase("11010", ExpectedResult = 26)>]
[<TestCase("10001101000", ExpectedResult = 1128)>]
let ``Binary converts to decimal`` (input: string) =
    toDecimal input

[<TestCase("carrot")>]
[<TestCase("2")>]
[<TestCase("5")>]
[<TestCase("9")>]
[<TestCase("a10")>]
[<TestCase("100b")>]
[<TestCase("10c01")>]
[<TestCase("134678")>]
[<TestCase("abc10z")>]
let ``Invalid binary is decimal 0`` (input: string) =
    Assert.That(toDecimal input, Is.EqualTo(0))