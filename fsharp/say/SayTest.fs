module SayTest

open NUnit.Framework

open Say

[<Test>]
let ``Zero`` () =
    Assert.That(inEnglish 0L, Is.EqualTo(Some "zero"))

[<Test>]
let ``One`` () =
    Assert.That(inEnglish 1L, Is.EqualTo(Some "one"))

[<Test>]
let ``Fourteen`` () =
    Assert.That(inEnglish 14L, Is.EqualTo(Some "fourteen"))

[<Test>]
let ``Twenty`` () =
    Assert.That(inEnglish 20L, Is.EqualTo(Some "twenty"))

[<Test>]
let ``Twenty-two`` () =
    Assert.That(inEnglish 22L, Is.EqualTo(Some "twenty-two"))

[<Test>]
let ``One hundred`` () =
    Assert.That(inEnglish 100L, Is.EqualTo(Some "one hundred"))

[<Test>]
let ``One hundred twenty-three`` () =
    Assert.That(inEnglish 123L, Is.EqualTo(Some "one hundred twenty-three"))

[<Test>]
let ``One thousand`` () =
    Assert.That(inEnglish 1000L, Is.EqualTo(Some "one thousand"))

[<Test>]
let ``One thousand two hundred thirty-four`` () =
    Assert.That(inEnglish 1234L, Is.EqualTo(Some "one thousand two hundred thirty-four"))

[<Test>]
let ``One million`` () =
    Assert.That(inEnglish 1000000L, Is.EqualTo(Some "one million"))

[<Test>]
let ``One million two`` () =
    Assert.That(inEnglish 1000002L, Is.EqualTo(Some "one million two"))

[<Test>]
let ``One million two thousand three hundred forty-five`` () =
    Assert.That(inEnglish 1002345L, Is.EqualTo(Some "one million two thousand three hundred forty-five"))

[<Test>]
let ``One billion`` () =
    Assert.That(inEnglish 1000000000L, Is.EqualTo(Some "one billion"))

[<Test>]
let ``A big number`` () =
    Assert.That(inEnglish 987654321123L, Is.EqualTo(Some "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three"))
 
[<Test>]
let ``Lower bound`` () =
    Assert.That(inEnglish -1L, Is.EqualTo(None))

[<Test>]
let ``Upper bound`` () =
    Assert.That(inEnglish 1000000000000L, Is.EqualTo(None))