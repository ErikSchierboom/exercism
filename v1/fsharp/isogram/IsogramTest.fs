module IsogramTest
    
open NUnit.Framework

open Isogram

[<TestCase("duplicates", ExpectedResult = true)>]
[<TestCase("eleven", ExpectedResult = false)>]
[<TestCase("subdermatoglyphic", ExpectedResult = true)>]
[<TestCase("Alphabet", ExpectedResult = false)>]
[<TestCase("thumbscrew-japingly", ExpectedResult = true)>]
[<TestCase("Hjelmqvist-Gryb-Zock-Pfund-Wax", ExpectedResult = true)>]
[<TestCase("Heizölrückstoßabdämpfung", ExpectedResult = true)>]
[<TestCase("the quick brown fox", ExpectedResult = false)>]
[<TestCase("Emily Jung Schwartzkopf", ExpectedResult = true)>]
[<TestCase("éléphant", ExpectedResult = false)>]
let ``Isogram correctly detects isograms`` (actual: string) =
    isogram actual