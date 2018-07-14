module SgfParsingTest

open NUnit.Framework

open SgfParsing

let treeWithChildren node children = mkTree (Map.ofList node) children
let treeWithSingleChild node child = mkTree (Map.ofList node) [child]
let treeWithNoChildren node = mkTree (Map.ofList node) []

[<Test>]
let ``Empty value`` () =
    let input = "" 
    let expected = None
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Tree without nodes`` () =
    let input = "()"
    let expected = None
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Node without tree`` () =
    let input = ";"
    let expected = None
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Node without properties`` () =
    let input = "(;)"
    let expected = Some (treeWithNoChildren [])
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Single node tree`` () =
    let input = "(;A[B])"
    let expected = Some (treeWithNoChildren [("A", ["B"])])
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Properties without delimiter`` () =
    let input = "(;a)"
    let expected = None
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``All lowercase property`` () =
    let input = "(;a[b])"
    let expected = None
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Upper- and lowercase property`` () =
    let input = "(;Aa[b])"
    let expected = None
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Two nodes`` () =
    let input = "(;A[B];B[C])"
    let expected = Some (treeWithSingleChild [("A", ["B"])] (treeWithNoChildren [("B", ["C"])]))
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Two child trees`` () =
    let input = "(;A[B](;B[C])(;C[D]))"
    let expected = Some (treeWithChildren [("A", ["B"])]
                            [ treeWithNoChildren [("B", ["C"])]; 
                              treeWithNoChildren [("C", ["D"])] ])
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Multiple properties`` () =
    let input = "(;A[b][c][d])"
    let expected = Some (treeWithNoChildren [("A", ["b"; "c"; "d"])])
    Assert.That(parseSgf input, Is.EqualTo(expected))

[<Test>]
let ``Escaped property`` () =
    let input = @"(;A[\]b\nc\nd\t\te\\ \n\]])"
    let expected = Some (treeWithNoChildren [("A", [@"]b c d  e\  ]"])])
    Assert.That(parseSgf input, Is.EqualTo(expected))