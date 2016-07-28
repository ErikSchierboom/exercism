module TrinaryTests

open NUnit.Framework
open Trinary
    
[<TestCase("1", ExpectedResult = 1)>]
[<TestCase("2", ExpectedResult = 2)>]
[<TestCase("10", ExpectedResult = 3)>]
[<TestCase("11", ExpectedResult = 4)>]
[<TestCase("100", ExpectedResult = 9)>]
[<TestCase("112", ExpectedResult = 14)>]
[<TestCase("222", ExpectedResult = 26)>]
[<TestCase("1122000120", ExpectedResult = 32091)>]
let ``Binary converts to decimal`` input =
    toDecimal input

[<TestCase("carrot")>]
[<TestCase("3")>]
[<TestCase("6")>]
[<TestCase("9")>]
[<TestCase("124578")>]
[<TestCase("abc1z")>]
let ``Invalid binary is decimal 0`` input =
    Assert.That(toDecimal input, Is.EqualTo(0))