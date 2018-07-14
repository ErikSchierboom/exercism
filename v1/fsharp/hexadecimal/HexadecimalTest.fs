module HexadecimalTests

open NUnit.Framework
open Hexadecimal

[<TestCase("1", ExpectedResult = 1)>]
[<TestCase("c", ExpectedResult = 12)>]
[<TestCase("10", ExpectedResult = 16)>]
[<TestCase("af", ExpectedResult = 175)>]
[<TestCase("100", ExpectedResult = 256)>]
[<TestCase("19ace", ExpectedResult = 105166)>]
[<TestCase("19ace", ExpectedResult = 105166)>]
[<TestCase("000000", ExpectedResult = 0)>]
[<TestCase("ffffff", ExpectedResult = 16777215)>]
[<TestCase("ffff00", ExpectedResult = 16776960)>]
let ``Hexadecimal_converts_to_decimal`` (hexadecimal) =
    toDecimal hexadecimal
    
[<Test>]
let ``Invalid_hexadecimal_is_decimal_0`` () =
    Assert.That(toDecimal "carrot", Is.EqualTo(0))