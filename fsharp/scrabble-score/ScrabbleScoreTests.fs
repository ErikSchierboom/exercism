module ScrabbleScoreTests

open NUnit.Framework
open Scrabble
  
[<Test>]
let ``Empty word scores zero`` () =
    Assert.That(score "", Is.EqualTo(0))

[<Test>]
let ``Whitespace scores zero`` () =
    Assert.That(score " \t\n", Is.EqualTo(0))

[<Test>]
let ``scores very short word`` () =
    Assert.That(score "a", Is.EqualTo(1))

[<Test>]
let ``scores other very short word`` () =
    Assert.That(score "f", Is.EqualTo(4))

[<Test>]
let ``Simple word scores the number of letters`` () =
    Assert.That(score "street", Is.EqualTo(6))

[<Test>]
let ``Complicated word scores more`` () =
    Assert.That(score "quirky", Is.EqualTo(22))

[<Test>]
let ``scores are case insensitive`` () =
    Assert.That(score "MULTIBILLIONAIRE", Is.EqualTo(20))