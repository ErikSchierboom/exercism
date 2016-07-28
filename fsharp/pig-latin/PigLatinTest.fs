module PigLatinTests

open NUnit.Framework
open PigLatin

[<TestCase("apple", ExpectedResult = "appleay")>]
[<TestCase("ear", ExpectedResult = "earay")>]
[<TestCase("igloo", ExpectedResult = "iglooay")>]
[<TestCase("object", ExpectedResult = "objectay")>]
[<TestCase("under", ExpectedResult = "underay")>]
let ``Ay is added to words that start with vowels`` (word) =
    translate word

[<TestCase("pig", ExpectedResult = "igpay")>]
[<TestCase("koala", ExpectedResult = "oalakay")>]
[<TestCase("yellow", ExpectedResult = "ellowyay")>]
[<TestCase("xenon", ExpectedResult = "enonxay")>]
let ``First letter and ay are moved to the end of words that start with consonants`` (word) =
    translate word

[<Test>]
let ``Ch is treated like a single consonant`` () =
    Assert.That(translate "chair", Is.EqualTo("airchay"))

[<Test>]
let ``Qu is treated like a single consonant`` () =
    Assert.That(translate "queen", Is.EqualTo("eenquay"))

[<Test>]
let ``Qu and a single preceding consonant are treated like a single consonant`` () =
    Assert.That(translate "square", Is.EqualTo("aresquay"))

[<Test>]
let ``Th is treated like a single consonant`` () =
    Assert.That(translate "therapy", Is.EqualTo("erapythay"))

[<Test>]
let ``Thr is treated like a single consonant`` () =
    Assert.That(translate "thrush", Is.EqualTo("ushthray"))

[<Test>]
let ``Sch is treated like a single consonant`` () =
    Assert.That(translate "school", Is.EqualTo("oolschay"))

[<Test>]
let ``Yt is treated like a single vowel`` () =
    Assert.That(translate "yttria", Is.EqualTo("yttriaay"))

[<Test>]
let ``Xr is treated like a single vowel`` () =
    Assert.That(translate "xray", Is.EqualTo("xrayay"))

[<Test>]
let ``Phrases are translated`` () =
    Assert.That(translate "quick fast run", Is.EqualTo("ickquay astfay unray"))
