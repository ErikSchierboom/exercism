module BracketPushTest

open NUnit.Framework

open BracketPush

[<Test>]
let ``Paired square brackets`` () =
    let actual ="[]"
    Assert.That(matched actual, Is.True)

[<Test>]
let ``Empty string`` () =
    let actual =""
    Assert.That(matched actual, Is.True)

[<Test>]
let ``Unpaired brackets`` () =
    let actual ="[["
    Assert.That(matched actual, Is.False)

[<Test>]
let ``Wrong ordered brackets`` () =
    let actual ="}{"
    Assert.That(matched actual, Is.False)

[<Test>]
let ``Paired with whitespace`` () =
    let actual ="{ }"
    Assert.That(matched actual, Is.True)

[<Test>]
let ``Simple nested brackets`` () =
    let actual ="{[]}"
    Assert.That(matched actual, Is.True)

[<Test>]
let ``Several paired brackets`` () =
    let actual ="{}[]"
    Assert.That(matched actual, Is.True)

[<Test>]
let ``Paired and nested brackets`` () =
    let actual ="([{}({}[])])"
    Assert.That(matched actual, Is.True)

[<Test>]
let ``Unpaired and nested brackets`` () =
    let actual ="([{])"
    Assert.That(matched actual, Is.False)

[<Test>]
let ``Paired and wrong nested brackets`` () =
    let actual ="[({]})"
    Assert.That(matched actual, Is.False)

[<Test>]
let ``Math expression`` () =
    let actual ="(((185 + 223.85) * 15) - 543)/2"
    Assert.That(matched actual, Is.True)

[<Test>]
let ``Complex latex expression`` () =
    let actual ="\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
    Assert.That(matched actual, Is.True)