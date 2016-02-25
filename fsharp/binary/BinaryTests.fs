module BinaryTests

open NUnit.Framework
open Binary

[<TestFixture>]
type BinaryTests() =
    
    [<TestCase("1", ExpectedResult = 1)>]
    [<TestCase("10", ExpectedResult = 2)>]
    [<TestCase("11", ExpectedResult = 3)>]
    [<TestCase("100", ExpectedResult = 4)>]
    [<TestCase("1001", ExpectedResult = 9)>]
    [<TestCase("11010", ExpectedResult = 26)>]
    [<TestCase("10001101000", ExpectedResult = 1128)>]
    member tests.Binary_converts_to_decimal(input) =
        Binary(input).toDecimal()

    [<TestCase("carrot")>]
    [<TestCase("2")>]
    [<TestCase("5")>]
    [<TestCase("9")>]
    [<TestCase("134678")>]
    [<TestCase("abc10z")>]
    member tests.Invalid_binary_is_decimal_0(input) =
        Assert.That(Binary(input).toDecimal(), Is.EqualTo(0))