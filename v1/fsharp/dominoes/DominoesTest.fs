module DominoesTest

open NUnit.Framework

open Dominoes

[<Test>]
let ``Empty input = empty output`` () =
    let actual = []
    Assert.That(canChain actual, Is.True)

[<Test>]
let ``Singleton input = singleton output`` () =
    let actual = [(1, 1)]
    Assert.That(canChain actual, Is.True)

[<Test>]
let ``Singleton that can't be chained`` () =
    let actual = [(1, 2)]
    Assert.That(canChain actual, Is.False)

[<Test>]
let ``Three elements`` () =
    let actual = [(1, 2); (3, 1); (2, 3)]
    Assert.That(canChain actual, Is.True)

[<Test>]
let ``Can reverse dominoes`` () =
    let actual = [(1, 2); (1, 3); (2, 3)]
    Assert.That(canChain actual, Is.True)

[<Test>]
let ``Can't be chained`` () =
    let actual = [(1, 2); (4, 1); (2, 3)]
    Assert.That(canChain actual, Is.False)

[<Test>]
let ``Disconnected - simple`` () =
    let actual = [(1, 1); (2, 2)]
    Assert.That(canChain actual, Is.False)

[<Test>]
let ``Disconnected - double loop`` () =
    let actual = [(1, 2); (2, 1); (3, 4); (4, 3)]
    Assert.That(canChain actual, Is.False)

[<Test>]
let ``Disconnected - single isolated`` () =
    let actual = [(1, 2); (2, 3); (3, 1); (4, 4)]
    Assert.That(canChain actual, Is.False)

[<Test>]
let ``Need backtrack`` () =
    let actual = [(1, 2); (2, 3); (3, 1); (2, 4); (2, 4)]
    Assert.That(canChain actual, Is.True)

[<Test>]
let ``Separate loops`` () =
    let actual = [(1, 2); (2, 3); (3, 1); (1, 1); (2, 2); (3, 3)]
    Assert.That(canChain actual, Is.True)

[<Test>]
let ``Ten elements`` () =
    let actual = [(1, 2); (5, 3); (3, 1); (1, 2); (2, 4); (1, 6); (2, 3); (3, 4); (5, 6)]
    Assert.That(canChain actual, Is.True)