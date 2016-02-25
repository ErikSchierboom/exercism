module AcronymTests

open NUnit.Framework
open Acronym

[<TestFixture>]
type AcronymTests() =

    [<Test>]
    member tests.Empty_string_abbreviated_to_empty_string() =
        Assert.That(Acronym().abbreviate(""), Is.EqualTo(""))
        
    [<TestCase("Portable Network Graphics", ExpectedResult = "PNG")>]
    [<TestCase("Ruby on Rails", ExpectedResult = "ROR")>]
    [<TestCase("HyperText Markup Language", ExpectedResult = "HTML")>]
    [<TestCase("First In, First Out", ExpectedResult = "FIFO")>]
    [<TestCase("PHP: Hypertext Preprocessor", ExpectedResult = "PHP")>]
    [<TestCase("Complementary metal-oxide semiconductor", ExpectedResult = "CMOS")>]
    member tests.Phrase_abbreviated_to_acronym(phrase) =
        Acronym().abbreviate(phrase)