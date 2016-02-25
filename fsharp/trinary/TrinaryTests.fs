module TrinaryTests

open NUnit.Framework
open Trinary

[<TestFixture>]
type TrinaryTests() =
    
    [<TestCase("1", ExpectedResult = 1)>]
    [<TestCase("2", ExpectedResult = 2)>]
    [<TestCase("10", ExpectedResult = 3)>]
    [<TestCase("11", ExpectedResult = 4)>]
    [<TestCase("100", ExpectedResult = 9)>]
    [<TestCase("112", ExpectedResult = 14)>]
    [<TestCase("222", ExpectedResult = 26)>]
    [<TestCase("1122000120", ExpectedResult = 32091)>]
    member tests.Binary_converts_to_decimal(input) =
        Trinary(input).toDecimal()

    [<TestCase("carrot")>]
    [<TestCase("3")>]
    [<TestCase("6")>]
    [<TestCase("9")>]
    [<TestCase("124578")>]
    [<TestCase("abc1z")>]
    member tests.Invalid_binary_is_decimal_0(input) =
        Assert.That(Trinary(input).toDecimal(), Is.EqualTo(0))