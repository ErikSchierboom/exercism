module ScrabbleScoreTests

open NUnit.Framework
open Scrabble

[<TestFixture>]
type ScrabbleScoreTest() = 
  
    [<Test>]
    member tests.Empty_word_scores_zero() =
        Assert.That(Scrabble("").score, Is.EqualTo(0))

    [<Test>]
    member tests.Whitespace_scores_zero() =
        Assert.That(Scrabble(" \t\n").score, Is.EqualTo(0))

    [<Test>]
    member tests.scores_very_short_word() =
        Assert.That(Scrabble("a").score, Is.EqualTo(1))

    [<Test>]
    member tests.scores_other_very_short_word() =
        Assert.That(Scrabble("f").score, Is.EqualTo(4))

    [<Test>]
    member tests.Simple_word_scores_the_number_of_letters() =
        Assert.That(Scrabble("street").score, Is.EqualTo(6))

    [<Test>]
    member tests.Complicated_word_scores_more() =
        Assert.That(Scrabble("quirky").score, Is.EqualTo(22))

    [<Test>]
    member tests.scores_are_case_insensitive() =
        Assert.That(Scrabble("MULTIBILLIONAIRE").score, Is.EqualTo(20))

    [<Test>]
    member tests.Convenient_scoring() =
        Assert.That(Scrabble.wordScore("alacrity"), Is.EqualTo(13))