module PigLatinTests

open NUnit.Framework
open PigLatin


type PigLatinTests() =
    
    [<TestCase("apple", ExpectedResult = "appleay")>]
    [<TestCase("ear", ExpectedResult = "earay")>]
    [<TestCase("igloo", ExpectedResult = "iglooay")>]
    [<TestCase("object", ExpectedResult = "objectay")>]
    [<TestCase("under", ExpectedResult = "underay")>]
    member tests.Ay_is_added_to_words_that_start_with_vowels(word) =
        PigLatin().translate(word)

    [<TestCase("pig", ExpectedResult = "igpay")>]
    [<TestCase("koala", ExpectedResult = "oalakay")>]
    [<TestCase("yellow", ExpectedResult = "ellowyay")>]
    [<TestCase("xenon", ExpectedResult = "enonxay")>]
    member tests.First_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants(word) =
        PigLatin().translate(word)

    [<Test>]
    member tests.Ch_is_treated_like_a_single_consonant() =
        Assert.That(PigLatin().translate("chair"), Is.EqualTo("airchay"))

    [<Test>]
    member tests.Qu_is_treated_like_a_single_consonant() =
        Assert.That(PigLatin().translate("queen"), Is.EqualTo("eenquay"))

    [<Test>]
    member tests.Qu_and_a_single_preceding_consonant_are_treated_like_a_single_consonant() =
        Assert.That(PigLatin().translate("square"), Is.EqualTo("aresquay"))

    [<Test>]
    member tests.Th_is_treated_like_a_single_consonant() =
        Assert.That(PigLatin().translate("therapy"), Is.EqualTo("erapythay"))

    [<Test>]
    member tests.Thr_is_treated_like_a_single_consonant() =
        Assert.That(PigLatin().translate("thrush"), Is.EqualTo("ushthray"))

    [<Test>]
    member tests.Sch_is_treated_like_a_single_consonant() =
        Assert.That(PigLatin().translate("school"), Is.EqualTo("oolschay"))

    [<Test>]
    member tests.Yt_is_treated_like_a_single_vowel() =
        Assert.That(PigLatin().translate("yttria"), Is.EqualTo("yttriaay"))

    [<Test>]
    member tests.Xr_is_treated_like_a_single_vowel() =
        Assert.That(PigLatin().translate("xray"), Is.EqualTo("xrayay"))

    [<Test>]
    member tests.Phrases_are_translated() =
        Assert.That(PigLatin().translate("quick fast run"), Is.EqualTo("ickquay astfay unray"))
