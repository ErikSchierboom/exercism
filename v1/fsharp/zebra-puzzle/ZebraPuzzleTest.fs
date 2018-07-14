module ZebraPuzzleTest

open NUnit.Framework

open ZebraPuzzle

[<Test>]
let ``Who drinks water?`` () =
    let solution = solve
    Assert.That(whoDrinksWater solution, Is.EqualTo(Norwegian))

[<Test>]
let ``Who owns the zebra?`` () =
    let solution = solve
    Assert.That(whoOwnsZebra solution, Is.EqualTo(Japanese))