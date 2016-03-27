module AcronymTests

open NUnit.Framework
open Acronym

[<Test>]
let ``Empty string abbreviated to empty string`` () =
    Assert.That(acronym "", Is.EqualTo(""))
        
[<TestCase("Portable Network Graphics", ExpectedResult = "PNG")>]
[<TestCase("Ruby on Rails", ExpectedResult = "ROR")>]
[<TestCase("HyperText Markup Language", ExpectedResult = "HTML")>]
[<TestCase("First In, First Out", ExpectedResult = "FIFO")>]
[<TestCase("PHP: Hypertext Preprocessor", ExpectedResult = "PHP")>]
[<TestCase("Complementary metal-oxide semiconductor", ExpectedResult = "CMOS")>]
let ``Phrase abbreviated to acronym`` (phrase: string) =
    acronym phrase